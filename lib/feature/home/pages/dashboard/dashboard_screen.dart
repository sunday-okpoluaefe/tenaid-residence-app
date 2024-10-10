import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:tenaid_mobile/ds/component/app_bottom_sheet.dart';
import 'package:tenaid_mobile/ds/component/dashboard_section.dart';
import 'package:tenaid_mobile/feature/community/community_navigator.dart';
import 'package:tenaid_mobile/feature/home/pages/dashboard/bloc/dashboard_screen_bloc.dart';
import 'package:tenaid_mobile/feature/home/pages/dashboard/components/starting_banner.dart';
import 'package:tenaid_mobile/library/community/domain/entity/visitor_domain.dart';
import 'package:tenaid_mobile/utils/network.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../../../assets/assets.gen.dart';
import '../../../../ds/component/horizontal_line.dart';
import '../../../../ds/component/page_loader.dart';
import '../../../../ds/component/spacing.dart';
import '../../../../utils/xts/global_notifier.dart';
import '../../../visitor/invite_status/invite_status_screen.dart';
import '../../home_screen.dart';
import 'components/community_request.dart';
import 'components/count_notify_block.dart';
import 'components/quick_actions.dart';
import 'components/quick_actions_loader.dart';
import 'components/visitor_quick_action.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<DashboardScreen> {
  final CommunityNavigator _communityNavigator =
      GetIt.instance.get<CommunityNavigator>();

  final DashboardScreenBloc bloc = GetIt.instance.get();

  _fetch({required bool refresh, bool silent = false}) {
    // cached account details
    context
        .read<DashboardScreenBloc>()
        .handleUiEvent(OnGetAccount(refresh: refresh, silent: silent));

    // communities
    context
        .read<DashboardScreenBloc>()
        .handleUiEvent(OnGetCommunities(refresh: refresh, silent: silent));

    // recent visitors
    context
        .read<DashboardScreenBloc>()
        .handleUiEvent(OnGetRecentVisitors(refresh: refresh, silent: silent));

    // today visitors
    context
        .read<DashboardScreenBloc>()
        .handleUiEvent(OnGetTodayVisitors(refresh: refresh, silent: silent));

    // get requests count
    context
        .read<DashboardScreenBloc>()
        .handleUiEvent(OnGetRequestsCount(refresh: refresh, silent: silent));
  }

  @override
  void initState() {
    super.initState();
    _fetch(refresh: true);
    networkNotifier.addListener(() {
      if (networkNotifier.value && mounted) {
        _fetch(refresh: true, silent: true);
      }
    });

    syncRequiredNotifier.addListener(() {
      if (syncRequiredNotifier.syncRequired && mounted) {
        _fetch(refresh: true, silent: true);
      }
    });
  }

  @override
  Widget build(BuildContext context) =>
      BlocBuilder<DashboardScreenBloc, DashboardScreenState>(
          builder: (_, DashboardScreenState state) => CustomScrollView(
                slivers: [
                  SliverList(
                      delegate: SliverChildListDelegate([
                    if (state.account?.flags?.welcome == true)
                      _cards()
                    else
                      _greeting(context, state),
                    SizedBox(
                      height: Spacing.extraSmall_h,
                    ),
                    HorizontalLine(),
                  ])),
                  SliverFillRemaining(
                      child: Container(
                    color: context.color.onSecondary.withOpacity(0.3),
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        CountNotifyBlock(
                          text: 'Pending join requests',
                          count: state.joinRequests,
                          onTap: () =>
                              _communityNavigator.toPendingJoinRequests(),
                        ),
                        _body(context, state),
                        if (state.loading) PageLoader()
                      ],
                    ),
                  ))
                ],
              ));

  Widget _greeting(BuildContext context, DashboardScreenState state) => Padding(
        padding:
            EdgeInsets.only(left: Spacing.small_w, top: Spacing.extraSmall_h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                TextSpan(children: [
                  TextSpan(
                      style: context.text.headlineMedium?.fade(context),
                      text: 'Hi, '),
                  TextSpan(
                      style: context.text.headlineMedium,
                      text: state.account?.firstName ?? '')
                ])),
            Text(
              state.primaryCommunity?.community?.name ?? '',
              maxLines: 1,
              style: context.text.bodyMedium?.fade(context),
            ),
          ],
        ),
      );

  Widget _cards() => Padding(
        padding:
            EdgeInsets.only(bottom: Spacing.small_h, top: Spacing.extraSmall_h),
        child: CarouselSlider(
          items: [
            _banner(Assets.adsInviteCard),
            _banner(Assets.adsDuesCard),
            _banner(Assets.adsUtilityCard)
          ],
          options: CarouselOptions(
              height: 120.h,
              enlargeCenterPage: true,
              autoPlay: true,
              viewportFraction: 0.9),
        ),
      );

  Widget _banner(SvgGenImage asset) => Padding(
        padding: EdgeInsets.zero,
        child: asset.svg(width: MediaQuery.of(context).size.width),
      );

  Widget _body(BuildContext context, DashboardScreenState state) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Spacing.small_w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (state.account?.flags?.quickActions == true &&
                    !state.accountLoading)
                  Padding(
                    padding: EdgeInsets.only(top: Spacing.extraSmall_h),
                    child: QuickActions(),
                  ),
                if (state.accountLoading) QuickActionsLoader(size: 64),
                if (state.pendingJoin != null || state.pendingCreate != null)
                  Padding(
                    padding: EdgeInsets.only(top: Spacing.small_h),
                    child: Text(
                      'Under review',
                      style: context.text.titleMedium,
                    ),
                  ),
                if (state.pendingJoin != null)
                  CommunityRequest(
                    accountCommunity: state.pendingJoin!,
                    onTap: (community) => _communityNavigator.toCommunityDetail(
                        community: community),
                  ),
                if (state.pendingCreate != null)
                  CommunityRequest(
                    accountCommunity: state.pendingCreate!,
                    onTap: (community) => _communityNavigator.toCommunityDetail(
                        community: community),
                  ),
                if (state.account?.flags?.joinCommunity == true ||
                    state.account?.flags?.createCommunity == true)
                  Padding(
                    padding: EdgeInsets.only(
                        bottom: Spacing.extraSmall_h, top: Spacing.small_h),
                    child: Text(
                      context.locale.getting_started,
                      style: context.text.titleMedium,
                    ),
                  ),
                if (state.account?.flags?.joinCommunity == true)
                  StartingBanner(
                    icon: Assets.joinCommunity.svg(),
                    title: context.locale.join_community,
                    body: context.locale.join_community_body,
                    onTap: () =>
                        _communityNavigator.toJoinCommunity(root: HomeScreen()),
                  ),
                if (state.account?.flags?.createCommunity == true)
                  StartingBanner(
                    icon: Assets.createCommunity.svg(),
                    title: context.locale.create_community,
                    body: context.locale.create_community_body,
                    onTap: () => _communityNavigator.toCreateCommunity(
                        root: HomeScreen()),
                  ),
              ],
            ),
          ),
          _visitors(
              label: 'Today visitors',
              hasBadge: true,
              loading: state.todayVisitorsLoading,
              visitors: state.todayVisitors),
          _visitors(
              label: 'Recent visitors',
              loading: state.recentVisitorsLoading,
              visitors: state.recentVisitors),
          if (state.account?.flags?.quickActions == true &&
              !state.accountLoading)
            _emptyActivity(
                title: 'Recent activities', label: 'No activities found'),
        ],
      );

  Widget _emptyActivity({required String title, required String label}) =>
      Padding(
        padding: EdgeInsets.symmetric(horizontal: Spacing.small_w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Spacing.medium_h,
            ),
            Text(
              title,
              style: context.text.titleMedium,
            ),
            SizedBox(
              height: Spacing.small_h,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Assets.emptyActivity.svg(),
                    SizedBox(
                      height: Spacing.extraSmall_h,
                    ),
                    Text(
                      label,
                      style: context.text.bodyMedium?.fade(context),
                    ),
                    SizedBox(
                      height: Spacing.small_h,
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      );

  Widget _visitors(
      {required String label,
      required List<VisitorDomain> visitors,
      bool hasBadge = false,
      required bool loading}) {
    if (!loading && visitors.isEmpty)
      return SizedBox.shrink();
    else if (loading)
      return Padding(
        padding: EdgeInsets.only(top: Spacing.small_h),
        child: QuickActionsLoader(size: 48.w),
      );
    return Container(
      margin: EdgeInsets.only(top: Spacing.extraSmall_h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _sectionHeader(
            title: label,
            onView: () {},
          ),
          DashboardSection(children: [
            for (VisitorDomain visitor in visitors)
              VisitorQuickAction(
                title: visitor.name!,
                badge: hasBadge,
                status: visitor.status!,
                onTap: () {
                  AppBottomSheet(InviteStatusScreen(
                    visitor: visitor,
                  )).show(context);
                },
              ),
            for (int i = 0; i < 4 - visitors.length; i++)
              SizedBox(
                width: 64.w,
                height: 64.w,
              )
          ], axis: Axis.horizontal),
        ],
      ),
    );
  }

  Widget _sectionHeader({required String title, required Function() onView}) =>
      Padding(
          padding: EdgeInsets.only(
              left: Spacing.small_w,
              right: Spacing.small_w,
              top: Spacing.small_h,
              bottom: Spacing.extraSmall_h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: context.text.titleMedium,
              ),
              Text(
                'View All',
                style: context.text.labelMedium?.copyWith(
                    color: context.color.surfaceTint,
                    decoration: TextDecoration.underline),
              )
            ],
          ));
}
