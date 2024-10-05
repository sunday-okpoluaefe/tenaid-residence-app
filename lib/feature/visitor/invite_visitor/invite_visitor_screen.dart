import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tenaid_mobile/ds/component/app_scrollview.dart';
import 'package:tenaid_mobile/ds/component/app_widget.dart';
import 'package:tenaid_mobile/ds/component/page_header.dart';
import 'package:tenaid_mobile/ds/component/primary_button.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/feature/visitor/invite_visitor/bloc/invite_visitor_screen_bloc.dart';
import 'package:tenaid_mobile/feature/visitor/visitor_navigator.dart';
import 'package:tenaid_mobile/library/community/domain/entity/invite_domain.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../../ds/component/animated_tab.dart';
import 'components/multi_entry_screen.dart';
import 'components/single_entry_screen.dart';

class InviteVisitorScreen extends AppStatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends AppState<InviteVisitorScreen> {
  final InviteVisitorScreenBloc bloc = GetIt.instance.get();
  final VisitorNavigator navigator = GetIt.instance.get();

  @override
  void initState() {
    super.initState();
    bloc.handleUiEvent(OnInit());
  }

  @override
  Widget build(BuildContext context) => BlocConsumer(
      bloc: bloc,
      builder: (_, InviteVisitorScreenState state) => Scaffold(
            appBar: AppBar(),
            body: SafeArea(child: _screen(context, state)),
          ),
      listener: (_, InviteVisitorScreenState state) {
        widget.handleApiError(context, state.error?.get());

        InviteDomain? invite = state.showDetailsScreen?.get();
        if (invite != null) {
          navigator.toInviteDetails(invite);
        }
      });

  _screen(BuildContext context, InviteVisitorScreenState state) =>
      AppScrollView(
          bottom: PrimaryButton(
            title: context.locale.continue_button,
            enabled: state.validated,
            loading: state.loading,
            onClick: () => bloc.handleUiEvent(OnContinueClicked()),
            modifier: EdgeInsets.symmetric(
                horizontal: Spacing.small_w, vertical: Spacing.small_h),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: Spacing.small_w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: Spacing.small_h),
                  child: PageHeader(
                    title: 'Invite a guest',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: Spacing.small_h),
                  child: AnimatedAppTab(
                      onChanged: (x) {
                        bloc.handleUiEvent(OnInviteTypeChanged(InviteType.values
                            .firstWhere((item) => item.index == x)));
                      },
                      items: ['One Time', 'Extended']),
                ),
                IndexedStack(
                  index: state.type.index,
                  children: [
                    SingleEntryScreen(
                      state: state,
                      timeError: state.startTimeError,
                      onStartDateChanged: (x) =>
                          bloc.handleUiEvent(OnStartDateChanged(x)),
                      onNameChanged: (x) =>
                          bloc.handleUiEvent(OnNameChanged(x)),
                      onPurposeChanged: (x) =>
                          bloc.handleUiEvent(OnPurposeChanged(x)),
                      onTimeChanged: (x) =>
                          bloc.handleUiEvent(OnTimeChanged(x)),
                      onValidityChanged: (x) =>
                          bloc.handleUiEvent(OnValidityChanged(x)),
                    ),
                    MultiEntryScreen(
                      state: state,
                      dateError: state.endDateError,
                      onPurposeChanged: (x) =>
                          bloc.handleUiEvent(OnPurposeChanged(x)),
                      onNameChanged: (x) =>
                          bloc.handleUiEvent(OnNameChanged(x)),
                      onEndDateChanged: (x) =>
                          bloc.handleUiEvent(OnEndDateChanged(x)),
                      onStartDateChanged: (x) =>
                          bloc.handleUiEvent(OnStartDateChanged(x)),
                    )
                  ],
                )
              ],
            ),
          ));
}
