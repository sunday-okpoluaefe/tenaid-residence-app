part of 'signup_screen_bloc.dart';

@CopyWith(skipFields: true)
class SignupScreenState extends Equatable {
  final bool loading;
  final bool validated;
  final CountryDomain? selectedCountry;
  final bool lNameValidationError;
  final bool fNameValidationError;
  final bool emailValidationError;
  final bool phoneValidationError;
  final bool passwordValidationError;
  final Resettable<bool> signUpComplete;
  final Resettable<ApiException> errorMessage;

  const SignupScreenState(
      {this.loading = false,
      this.validated = false,
      this.selectedCountry,
      this.lNameValidationError = false,
      this.fNameValidationError = false,
      this.emailValidationError = false,
      this.phoneValidationError = false,
      required this.signUpComplete,
      required this.errorMessage,
      this.passwordValidationError = false});

  @override
  List<Object?> get props => [
        loading,
        lNameValidationError,
        fNameValidationError,
        emailValidationError,
        phoneValidationError,
        passwordValidationError,
        validated,
        errorMessage,
        selectedCountry
      ];
}
