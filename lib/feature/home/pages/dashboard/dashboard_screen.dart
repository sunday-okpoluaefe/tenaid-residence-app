import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tenaid_mobile/ds/component/app_bottom_sheet.dart';
import 'package:tenaid_mobile/feature/community/community_navigator.dart';
import 'package:tenaid_mobile/feature/home/pages/dashboard/bloc/dashboard_screen_bloc.dart';
import 'package:tenaid_mobile/feature/home/pages/dashboard/components/starting_banner.dart';
import 'package:tenaid_mobile/feature/visitor/components/visitor_status_bottomsheet.dart';
import 'package:tenaid_mobile/library/community/domain/entity/visitor_domain.dart';
import 'package:tenaid_mobile/utils/network.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../../../assets/assets.gen.dart';
import '../../../../ds/component/page_loader.dart';
import '../../../../ds/component/spacing.dart';
import '../../../../utils/xts/global_notifier.dart';
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
                    CountNotifyBlock(
                      text: 'Pending join requests',
                      count: state.joinRequests,
                      onTap: () => _communityNavigator.toPendingJoinRequests(),
                    ),
                    _body(context, state),
                    if (state.loading) PageLoader()
                  ]))
                ],
              ));

  Widget _greeting(BuildContext context, DashboardScreenState state) => Padding(
        padding: EdgeInsets.only(left: Spacing.small, top: Spacing.extraSmall),
        child: Text.rich(
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
      );

  Widget _cards() => Padding(
        padding:
            EdgeInsets.only(bottom: Spacing.small, top: Spacing.extraSmall),
        child: CarouselSlider(
          items: [
            _banner(Assets.adsInviteCard),
            _banner(Assets.adsDuesCard),
            _banner(Assets.adsUtilityCard)
          ],
          options: CarouselOptions(
              height: 120.0,
              enlargeCenterPage: true,
              autoPlay: true,
              viewportFraction: 0.9),
        ),
      );

  Widget _banner(SvgGenImage asset) => Padding(
        padding: EdgeInsets.zero,
        child: asset.svg(width: MediaQuery.of(context).size.width),
      );

  Widget _body(BuildContext context, DashboardScreenState state) => Padding(
        padding: EdgeInsets.symmetric(horizontal: Spacing.small),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (state.pendingJoin != null || state.pendingCreate != null)
              Padding(
                padding: EdgeInsets.only(top: Spacing.small),
                child: Text(
                  'Under review',
                  style: context.text.titleMedium,
                ),
              ),
            if (state.pendingJoin != null)
              CommunityRequest(
                accountCommunity: state.pendingJoin!,
              ),
            if (state.pendingCreate != null)
              CommunityRequest(
                accountCommunity: state.pendingCreate!,
              ),
            if (state.account?.flags?.joinCommunity == true ||
                state.account?.flags?.createCommunity == true)
              Padding(
                padding: EdgeInsets.only(
                    bottom: Spacing.extraSmall, top: Spacing.small),
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
                onTap: () =>
                    _communityNavigator.toCreateCommunity(root: HomeScreen()),
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
            SizedBox(
              height: Spacing.medium,
            ),
            if (state.account?.flags?.quickActions == true &&
                !state.accountLoading)
              QuickActions(),
            if (state.accountLoading) QuickActionsLoader(size: 64),
            if (state.account?.flags?.quickActions == true &&
                !state.accountLoading)
              _emptyActivity(
                  title: 'Recent activities', label: 'No activities found'),
          ],
        ),
      );

  Widget _emptyActivity({required String title, required String label}) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Spacing.medium,
          ),
          Text(
            title,
            style: context.text.titleMedium,
          ),
          SizedBox(
            height: Spacing.small,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Assets.emptyActivity.svg(),
                  SizedBox(
                    height: Spacing.extraSmall,
                  ),
                  Text(
                    label,
                    style: context.text.bodyMedium?.fade(context),
                  ),
                ],
              )
            ],
          )
        ],
      );

  Widget _visitors(
      {required String label,
      required List<VisitorDomain> visitors,
      bool hasBadge = false,
      required bool loading}) {
    if (!loading && visitors.isEmpty)
      return SizedBox();
    else if (loading)
      return Padding(
        padding: EdgeInsets.only(top: Spacing.small),
        child: QuickActionsLoader(size: 48),
      );
    return Container(
      margin: EdgeInsets.only(top: Spacing.medium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Text(label, style: context.text.labelMedium),
                padding: EdgeInsets.symmetric(horizontal: Spacing.extraSmall),
                decoration: BoxDecoration(
                    color: context.color.surfaceBright,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10))),
              ),
              Text(
                'View All',
                style: context.text.labelMedium?.copyWith(
                    color: context.color.surfaceTint,
                    decoration: TextDecoration.underline),
              )
            ],
          ),
          SizedBox(
            height: Spacing.small,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (VisitorDomain visitor in visitors)
                VisitorQuickAction(
                  title: visitor.name!,
                  badge: hasBadge,
                  status: visitor.status!,
                  onTap: () {
                    AppBottomSheet(VisitorStatusBottomSheet(
                      visitor: visitor,
                    )).show(context);
                  },
                ),
              for (int i = 0; i < 4 - visitors.length; i++)
                SizedBox(
                  width: 64,
                  height: 64,
                )
            ],
          )
        ],
      ),
    );
  }
}
