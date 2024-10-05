import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tenaid_mobile/ds/component/app_scrollview.dart';
import 'package:tenaid_mobile/ds/component/app_widget.dart';
import 'package:tenaid_mobile/ds/component/page_header.dart';
import 'package:tenaid_mobile/ds/component/primary_button.dart';
import 'package:tenaid_mobile/ds/component/spacing.dart';
import 'package:tenaid_mobile/ds/component/text_field.dart';
import 'package:tenaid_mobile/feature/account/account_navigator.dart';
import 'package:tenaid_mobile/feature/account/change_password/bloc/change_password_screen_bloc.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

class ChangePasswordScreen extends AppStatefulWidget {
  @override
  State<StatefulWidget> createState() => _State();
}

class _State extends AppState<ChangePasswordScreen> {
  final ChangePasswordScreenBloc bloc = GetIt.instance.get();
  final AccountNavigator navigator = GetIt.instance.get();

  @override
  Widget build(BuildContext context) => BlocConsumer(
      bloc: bloc,
      builder: (_, ChangePasswordScreenState state) => Scaffold(
            appBar: AppBar(),
            body: SafeArea(child: _body(context, state)),
          ),
      listener: (_, ChangePasswordScreenState state) {
        widget.handleApiError(context, state.error?.get());

        if (state.isComplete?.get() == true) {
          widget.showSuccessMessage(
              title: context.locale.password,
              message: context.locale.change_password_success,
              onDismiss: () => navigator.back());
        }
      });

  Widget _body(BuildContext context, ChangePasswordScreenState state) =>
      AppScrollView(
          bottom: PrimaryButton(
              loading: state.loading,
              enabled: state.validated,
              modifier: EdgeInsets.symmetric(
                  horizontal: Spacing.small_w, vertical: Spacing.small_h),
              title: context.locale.continue_button,
              onClick: () => bloc.handleUiEvent(OnContinueClicked())),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: Spacing.small_w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PageHeader(
                  title: context.locale.change_password,
                  description: context.locale.change_password_body,
                ),
                SizedBox(
                  height: Spacing.medium_h,
                ),
                TTextField(
                  label: context.locale.new_password,
                  onChanged: (s) => bloc.handleUiEvent(OnPasswordChanged(s)),
                  isSecret: true,
                ),
                SizedBox(
                  height: Spacing.small_h,
                ),
                TTextField(
                  label: context.locale.confirm_new_password,
                  errorText: state.isValidConfirm
                      ? null
                      : context.locale.password_mismatch,
                  onChanged: (s) =>
                      bloc.handleUiEvent(OnConfirmPasswordChanged(s)),
                  isSecret: true,
                ),
              ],
            ),
          ));
}
