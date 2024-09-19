import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/feature/account/forgot_password/forgot_password_screen.dart';
import 'package:tenaid_mobile/feature/account/login/login_screen.dart';
import 'package:tenaid_mobile/feature/account/onboarding/onboarding_screen.dart';
import 'package:tenaid_mobile/feature/account/profile/profile_screen.dart';
import 'package:tenaid_mobile/feature/account/signup/signup_screen.dart';
import 'package:tenaid_mobile/feature/home/home_screen.dart';
import 'package:tenaid_mobile/utils/route_utils/base_navigator.dart';

import 'change_password/change_password_screen.dart';
import 'edit_profile/edit_profile_screen.dart';

@injectable
class AccountNavigator extends BaseNavigator {
  static const String login = '/account/login';
  static const String signup = '/account/signup';
  static const String forgotPassword = '/account/forgot_password';
  static const String onboarding = '/account/onboarding';
  static const String profile = '/account/profile';

  static Map<String, WidgetBuilder> accountRoutes = {
    login: (BuildContext context) => LoginScreen(),
    signup: (BuildContext context) => SignUpScreen(),
    onboarding: (BuildContext context) => OnboardingScreen(),
    forgotPassword: (BuildContext context) => ForgotPasswordScreen(),
    profile: (BuildContext context) => ProfileScreen()
  };

  Future toLogin() => toScreen(screen: const LoginScreen(), clearStack: true);

  Future toSignUp() => toScreen(screen: const SignUpScreen());

  Future toChangePassword() => toScreen(screen: ChangePasswordScreen());

  Future toForgotPassword() => toScreen(screen: const ForgotPasswordScreen());

  Future toHome() => toScreen(screen: const HomeScreen(), clearStack: true);

  Future toProfile() => toScreen(screen: ProfileScreen());

  Future toEditProfile() => toScreen(screen: EditProfileScreen());
}
