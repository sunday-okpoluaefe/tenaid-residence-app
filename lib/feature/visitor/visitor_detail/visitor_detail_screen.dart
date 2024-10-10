import 'package:another_stepper/another_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:tenaid_mobile/ds/component/app_scrollview.dart';
import 'package:tenaid_mobile/ds/component/app_widget.dart';
import 'package:tenaid_mobile/ds/component/empty_screen.dart';
import 'package:tenaid_mobile/ds/component/icon_size.dart';
import 'package:tenaid_mobile/ds/component/page_loader.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/feature/visitor/visitor_detail/bloc/visitor_detail_bloc.dart';
import 'package:tenaid_mobile/library/community/domain/entity/invite_activity_domain.dart';
import 'package:tenaid_mobile/utils/pair.dart';
import 'package:tenaid_mobile/utils/xts/datetime_xts.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../../assets/assets.gen.dart';
import '../../../ds/component/app_table_view.dart';
import '../../../ds/component/avatar.dart';
import '../../../ds/component/horizontal_line.dart';
import '../../../ds/component/large_profile_image.dart';
import '../components/invite_code_status.dart';

enum CheckType { checkIn, checkOut }

class VisitorDetailScreen extends AppStatefulWidget {
  final String invite;

  VisitorDetailScreen({super.key, required this.invite});

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<VisitorDetailScreen> {
  final VisitorDetailBloc bloc = GetIt.instance.get();

  double stepIconSize = IconSize.extraLarge.height;

  @override
  void initState() {
    super.initState();

    bloc.handleUiEvent(
        OnLoadActivities(invite: widget.invite, page: 1, limit: 10));
  }

  @override
  Widget build(BuildContext context) => BlocConsumer(
      bloc: bloc,
      builder: (_, VisitorDetailState state) => Scaffold(
            appBar: AppBar(),
            body: SafeArea(
                child: state.loading
                    ? PageLoader()
                    : (state.hasError
                        ? EmptyScreen(
                            hasError: state.hasError,
                            onTryAgain: () => bloc.handleUiEvent(
                                OnLoadActivities(
                                    invite: widget.invite, page: 1, limit: 10)),
                          )
                        : _screen(context, state))),
          ),
      listener: (_, VisitorDetailState state) {});

  Widget _screen(BuildContext context, VisitorDetailState state) =>
      AppScrollView(
          body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: Spacing.small_w,
                right: Spacing.small_w,
                bottom: Spacing.small_h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Flexible(
                              child: Text(
                            state.invite?.name ?? '',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: context.text.headlineSmall,
                          )),
                          SizedBox(
                            width: Spacing.extraSmall_w,
                          ),
                          InviteCodeStatus(
                            start: state.invite!.startDate,
                            end: state.invite!.endDate,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Spacing.extraExtraSmall_h,
                      ),
                      Text(
                        state.invite?.createdAt.asDateTimeString ?? '',
                        style: context.text.labelMedium,
                      )
                    ],
                  ),
                ),
                LargeProfileImage(
                  image: '',
                  size: IconSize.extraLarge,
                )
              ],
            ),
          ),
          HorizontalLine(),
          SizedBox(
            height: Spacing.small_h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Spacing.small_w),
            child: AppTableView(
              items: [
                TableItemModel(
                    key: 'Purpose of visit', value: state.invite?.reason ?? ''),
              ],
            ),
          ),
          Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Spacing.small_w, vertical: Spacing.small_h),
              child: AnotherStepper(
                stepperList: _mapStepperData(Pair(
                    first: state.invite!,
                    second:
                        state.activities!.data as List<InviteActivityDomain>)),
                stepperDirection: Axis.vertical,
                iconWidth: 38.w,
                iconHeight: 38.w,
                activeBarColor: context.color.surfaceBright,
                inActiveBarColor: context.color.surfaceBright,
                inverted: false,
                verticalGap: Spacing.medium_h,
                activeIndex: 3,
                barThickness: Spacing.extraExtraSmall_w,
              )),
          if (state.activities?.data.isEmpty == true) _emptyActivities()
        ],
      ));

  StepperData _step(
          {required String title,
          required String subtitle,
          required Widget icon}) =>
      StepperData(
          title: StepperText(
            title,
            textStyle: context.text.titleMedium,
          ),
          subtitle: StepperText(subtitle,
              textStyle: context.text.labelMedium?.fade(context)),
          iconWidget: Avatar(
            title: '',
            opacity: 0.3,
            size: IconSize.extraLarge.height,
            icon: icon,
          ));

  List<StepperData> _mapStepperData(
      Pair<InviteDomain, List<InviteActivityDomain>> data) {
    List<StepperData> steps = [];
    steps.add(_step(
        title: 'Invite Sent',
        subtitle: data.first.createdAt.periodDateTimeString,
        icon: Assets.send.svg(color: context.color.primaryFixed)));

    List<StepperData> activities = data.second
        .map((activity) => _step(
            title: _stepTitle(activity.type!),
            subtitle: activity.createdAt.periodDateTimeString,
            icon: _stepIcon(activity.type!)))
        .toList();

    steps.addAll(activities);

    return steps;
  }

  String _stepTitle(String type) =>
      type == CheckType.checkIn.name ? 'Checked In' : 'Checked Out';

  Widget _stepIcon(String type) => type == CheckType.checkIn.name
      ? Assets.checkIn.svg(height: 18.w, color: context.color.secondary)
      : Assets.checkOut.svg(height: 18.w, color: context.color.secondary);

  Widget _emptyActivities() => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: Spacing.medium_h,
          ),
          Assets.emptyActivity.svg(),
          SizedBox(
            height: Spacing.small_h,
          ),
          Text(
            'No activities found',
            style: context.text.bodyMedium?.fade(context),
          ),
          SizedBox(
            height: Spacing.small_h,
          ),
        ],
      );
}
