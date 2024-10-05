import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tenaid_mobile/ds/component/app_scrollview.dart';
import 'package:tenaid_mobile/ds/component/app_widget.dart';
import 'package:tenaid_mobile/ds/component/info_text.dart';
import 'package:tenaid_mobile/ds/component/page_header.dart';
import 'package:tenaid_mobile/ds/component/primary_button.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/feature/visitor/exit_visitor/bloc/exit_visitor_bloc.dart';
import 'package:tenaid_mobile/library/community/domain/entity/invite_domain.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../../ds/component/text_field.dart';
import '../visitor_navigator.dart';

class ExitVisitorScreen extends AppStatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends State<ExitVisitorScreen> {
  final ExitVisitorBloc bloc = GetIt.instance.get();
  final VisitorNavigator navigator = GetIt.instance.get();

  @override
  Widget build(BuildContext context) => BlocConsumer(
      bloc: bloc,
      builder: (_, ExitVisitorState state) => Scaffold(
            appBar: AppBar(),
            body: SafeArea(child: _screen(context, state)),
          ),
      listener: (_, ExitVisitorState state) {
        InviteDomain? invite = state.showDetailsScreen?.get();
        if (invite != null) {
          navigator.toInviteDetails(invite);
        }
      });

  Widget _screen(BuildContext context, ExitVisitorState state) => AppScrollView(
      bottom: Padding(
        padding: EdgeInsets.symmetric(horizontal: Spacing.small_w),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Spacing.small_w),
              child: Text(
                'This is a single guest exit code. Please do not share it with anyone else, as it is intended for one guest only.',
                textAlign: TextAlign.center,
                style: context.text.labelMedium?.fade(context),
              ),
            ),
            PrimaryButton(
              title: context.locale.continue_button,
              loading: state.loading,
              enabled: state.name.isNotEmpty,
              onClick: () => bloc.handleUiEvent(OnContinueClicked()),
              modifier: EdgeInsets.symmetric(vertical: Spacing.small_h),
            )
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Spacing.small_w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PageHeader(
              title: 'Exit a guest',
              description: 'Generate an exit code for your visitor.',
              bottom: Spacing.medium_h,
            ),
            Text('Guest details', style: context.text.titleMedium),
            SizedBox(
              height: Spacing.extraSmall_h,
            ),
            TTextField(
              label: 'Enter guest name',
              onChanged: (x) => bloc.handleUiEvent(OnNameChanged(name: x)),
              inputType: TextInputType.name,
            ),
            SizedBox(
              height: Spacing.small_h,
            ),
            TTextField(
                label: 'Purpose of visit (Optional)',
                onChanged: (x) =>
                    bloc.handleUiEvent(OnPurposeChanged(purpose: x)),
                inputType: TextInputType.name),
            SizedBox(
              height: Spacing.medium_h,
            ),
            InfoText(
                title: 'This code will expire 45 minutes after its generated.')
          ],
        ),
      ));
}
