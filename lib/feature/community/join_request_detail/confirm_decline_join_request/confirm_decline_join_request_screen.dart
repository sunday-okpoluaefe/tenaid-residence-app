import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tenaid_mobile/ds/component/app_scrollview.dart';
import 'package:tenaid_mobile/ds/component/app_widget.dart';
import 'package:tenaid_mobile/ds/component/page_header.dart';
import 'package:tenaid_mobile/ds/component/primary_button.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/ds/component/text_field.dart';
import 'package:tenaid_mobile/feature/community/community_navigator.dart';
import 'package:tenaid_mobile/feature/community/join_request_detail/confirm_decline_join_request/bloc/confirm_decline_join_request_bloc.dart';
import 'package:tenaid_mobile/library/community/domain/entity/join_request_domain.dart';
import 'package:tenaid_mobile/utils/xts/global_notifier.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

class ConfirmDeclineJoinRequestScreen extends AppStatefulWidget {
  final JoinRequestDomain request;

  ConfirmDeclineJoinRequestScreen(this.request);

  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<ConfirmDeclineJoinRequestScreen> {
  final ConfirmDeclineJoinRequestBloc bloc = GetIt.instance.get();
  final CommunityNavigator navigator = GetIt.instance.get();

  @override
  Widget build(BuildContext context) => BlocConsumer(
      bloc: bloc,
      builder: (_, ConfirmDeclineJoinRequestState state) => Scaffold(
            appBar: AppBar(),
            body: SafeArea(child: _screen(context, state)),
          ),
      listener: (_, ConfirmDeclineJoinRequestState state) {
        widget.handleApiError(context, state.error?.get());

        if (state.completed?.get() == true) {
          widget.showSuccessMessage(
              message: 'The join request has be declined successfully',
              title: 'Decline Successful',
              onDismiss: () {
                syncRequiredNotifier.notify();
                navigator.back(toRoot: true);
              });
        }
      });

  Widget _screen(BuildContext context, ConfirmDeclineJoinRequestState state) =>
      AppScrollView(
          bottom: PrimaryButton(
            title: context.locale.continue_button,
            loading: state.loading,
            enabled: state.reason.isNotEmpty,
            onClick: () =>
                bloc.handleUiEvent(OnDeclineRequest(widget.request.id ?? '')),
            modifier: EdgeInsets.symmetric(
                horizontal: Spacing.small_w, vertical: Spacing.small_h),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: Spacing.small_w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PageHeader(
                  title: 'Confirm decline',
                  description: 'Kindly click continue to confirm your decision',
                  bottom: Spacing.medium_h,
                ),
                TTextField(
                  label: 'Enter decline reason',
                  onChanged: (x) => bloc.handleUiEvent(OnReasonChanged(x)),
                )
              ],
            ),
          ));
}
