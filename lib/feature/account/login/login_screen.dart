import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:tenaid_mobile/ds/component/app_scrollview.dart';
import 'package:tenaid_mobile/utils/xts/material_xt.dart';

import '../../../ds/component/app_widget.dart';
import '../../../ds/component/asset_icon.dart';
import '../../../ds/component/icon_size.dart';
import '../../../ds/component/primary_button.dart';
import '../../../ds/component/spacing.dart';
import '../../../ds/component/text_field.dart';
import '../account_navigator.dart';
import 'bloc/login_screen_bloc.dart';

class LoginScreen extends AppStatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _State();
  }
}

class _State extends State<LoginScreen> {
  final LoginScreenBloc _loginScreenBloc = GetIt.instance.get();

  final AccountNavigator _accountNavigator =
      GetIt.instance.get<AccountNavigator>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: BlocConsumer(
          bloc: _loginScreenBloc,
          builder: (_, LoginScreenState state) =>
              SafeArea(child: _screen(context, state)),
          listener: (_, LoginScreenState state) {
            bool? isSignInComplete = state.signInComplete.get();

            widget.handleApiError(context, state.errorMessage.get());

            if (isSignInComplete == true) {
              _accountNavigator.toHome();
            }
          }),
    );
  }

  _screen(BuildContext context, LoginScreenState state) => AppScrollView(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Spacing.small),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: Spacing.small),
              child: Text(
                context.locale.welcome_back,
                style: context.text.headlineMedium,
              ),
            ),
            Text(
              context.locale.sign_in_body_text,
              textAlign: TextAlign.center,
              style: context.text.titleMedium
                  ?.copyWith(color: context.color.onSurface.withOpacity(0.50)),
            ),
            SizedBox(height: Spacing.large),
            TTextField(
                label: context.locale.email_address,
                inputType: TextInputType.emailAddress,
                errorText: state.emailValidationError
                    ? context.locale.invalid_email
                    : null,
                onChanged: (t) {
                  _loginScreenBloc.handleUiEvent(OnEmailChanged(t));
                },
                autoFocus: true,
                onFocusChanged: (f) {
                  _loginScreenBloc.handleUiEvent(OnEmailFocusChanged(f));
                },
                prefixIcon:
                    AssetIcon(size: IconSize.large, asset: 'assets/sms.svg')),
            SizedBox(height: Spacing.small),
            TTextField(
                label: context.locale.password,
                inputType: TextInputType.text,
                onChanged: (t) {
                  _loginScreenBloc.handleUiEvent(OnPasswordChanged(t));
                },
                isSecret: true,
                prefixIcon:
                    AssetIcon(size: IconSize.large, asset: 'assets/lock.svg')),
            SizedBox(height: Spacing.extraSmall),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              GestureDetector(
                child: Text(context.locale.forgot_password,
                    style: context.text.bodyMedium),
                onTap: () {
                  _accountNavigator.toForgotPassword();
                },
              )
            ])
          ],
        ),
      ),
      bottom: Padding(
        padding: EdgeInsets.symmetric(horizontal: Spacing.small),
        child: Column(
          children: [
            SizedBox(height: Spacing.medium),
            PrimaryButton(
                title: AppLocalizations.of(context)!.sign_in,
                modifier: EdgeInsets.symmetric(vertical: Spacing.small),
                loading: state.loading,
                enabled: state.canContinue,
                onClick: () {
                  _loginScreenBloc.handleUiEvent(OnContinueClicked());
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(context.locale.no_account,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: context.color.onSurface.withOpacity(0.50))),
                SizedBox(width: Spacing.extraExtraSmall),
                GestureDetector(
                  child: Text(context.locale.sign_up,
                      style: context.text.bodyMedium),
                  onTap: () {
                    _accountNavigator.toSignUp();
                  },
                )
              ],
            ),
            SizedBox(height: Spacing.small),
          ],
        ),
      ));
}
//
