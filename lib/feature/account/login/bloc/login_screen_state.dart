part of 'login_screen_bloc.dart';

@CopyWith(skipFields: true)
class LoginScreenState extends Equatable {
  final bool loading;
  final bool canContinue;
  final Resettable<ApiException> errorMessage;
  final Resettable<bool> signInComplete;
  final bool emailValidationError;

  const LoginScreenState(
      {this.loading = false,
      required this.errorMessage,
      required this.signInComplete,
      this.canContinue = false,
      this.emailValidationError = false});

  @override
  List<Object?> get props =>
      [loading, errorMessage, emailValidationError, canContinue, signInComplete];
}
