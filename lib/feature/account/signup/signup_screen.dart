import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tenaid_mobile/core/network/api_error_parser.dart';
import 'package:tenaid_mobile/ds/component/app_widget.dart';
import 'package:tenaid_mobile/ds/component/page_header.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../../assets/assets.gen.dart';
import '../../../ds/component/app_scrollview.dart';
import '../../../ds/component/phone_field.dart';
import '../../../ds/component/primary_button.dart';
import '../../../ds/component/spacing.dart';
import '../../../ds/component/text_field.dart';
import '../account_navigator.dart';
import 'bloc/signup_screen_bloc.dart';
import 'component/terms_conditions.dart';

class SignUpScreen extends AppStatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<SignUpScreen> {
  final SignupScreenBloc _screenBloc = GetIt.instance.get<SignupScreenBloc>();

  final AccountNavigator _accountNavigator =
      GetIt.instance.get<AccountNavigator>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: BlocConsumer(
          bloc: _screenBloc,
          builder: (_, SignupScreenState state) =>
              SafeArea(child: _body(context, state)),
          listener: (_, SignupScreenState state) {
            ApiException? error = state.errorMessage.get();

            if (error != null) {
              String? message = (error is NetworkError)
                  ? context.locale.network_error
                  : error.message;
              widget.showErrorMessage(
                  error: message ?? "", title: context.locale.error);
            }

            bool? signUpComplete = state.signUpComplete.get();
            if (signUpComplete == true) _accountNavigator.toHome();
          }),
    );
  }

  _body(BuildContext context, SignupScreenState state) => AppScrollView(
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Spacing.small_w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PageHeader(
                      title: context.locale.let_get_started,
                      description: context.locale.create_account),
                  SizedBox(height: Spacing.large_h),
                  TTextField(
                    label: context.locale.first_name,
                    inputType: TextInputType.name,
                    onChanged: (s) {
                      _screenBloc.handleUiEvent(OnFNameChanged(s));
                    },
                    prefixIcon: Assets.profile.svg(fit: BoxFit.scaleDown),
                  ),
                  SizedBox(height: Spacing.small_h),
                  TTextField(
                    label: context.locale.last_name,
                    inputType: TextInputType.name,
                    prefixIcon: Assets.profile.svg(fit: BoxFit.scaleDown),
                    onChanged: (s) {
                      _screenBloc.handleUiEvent(OnLNameChanged(s));
                    },
                  ),
                  SizedBox(height: Spacing.small_h),
                  TTextField(
                    label: context.locale.email_address,
                    errorText: state.emailValidationError
                        ? context.locale.invalid_email
                        : null,
                    onFocusChanged: (f) {
                      _screenBloc.handleUiEvent(OnEmailFocusChanged(f));
                    },
                    inputType: TextInputType.emailAddress,
                    prefixIcon: Assets.sms.svg(fit: BoxFit.scaleDown),
                    onChanged: (s) {
                      _screenBloc.handleUiEvent(OnEmailNameChanged(s));
                    },
                  ),
                  SizedBox(height: Spacing.small_h),
                  PhoneField(
                    label: context.locale.phone_number,
                    error: state.phoneValidationError
                        ? context.locale.invalid_phone
                        : null,
                    onChanged: (s) =>
                        _screenBloc.handleUiEvent(OnPhoneNameChanged(s)),
                    onCountrySelected: (country) {
                      _screenBloc.handleUiEvent(OnCountryChanged(country));
                    },
                  ),
                  SizedBox(height: Spacing.small_h),
                  TTextField(
                    label: context.locale.password,
                    isSecret: true,
                    prefixIcon: Assets.lock.svg(fit: BoxFit.scaleDown),
                    onChanged: (s) {
                      _screenBloc.handleUiEvent(OnPasswordNameChanged(s));
                    },
                  ),
                  SizedBox(height: Spacing.extraSmall_h),
                ],
              ),
            ),
          ],
        ),
        bottom: Padding(
          padding: EdgeInsets.symmetric(horizontal: Spacing.small_w),
          child: Column(
            children: [
              SizedBox(height: Spacing.medium_h),
              const TermsConditions(),
              PrimaryButton(
                  title: context.locale.sign_up,
                  modifier: EdgeInsets.symmetric(vertical: Spacing.small_h),
                  loading: state.loading,
                  enabled: state.validated,
                  onClick: () {
                    _screenBloc.handleUiEvent(const OnContinueClicked());
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(context.locale.have_account,
                      style: context.text.bodyMedium?.copyWith(
                          color: context.color.onSurface.withOpacity(0.70))),
                  SizedBox(width: Spacing.extraExtraSmall_w),
                  GestureDetector(
                    child: Text(context.locale.sign_in,
                        style: Theme.of(context).textTheme.bodyMedium),
                    onTap: () {
                      _accountNavigator.back();
                    },
                  )
                ],
              ),
              SizedBox(height: Spacing.small_h),
            ],
          ),
        ),
      );
}
