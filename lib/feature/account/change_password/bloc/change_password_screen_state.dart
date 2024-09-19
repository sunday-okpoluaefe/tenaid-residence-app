part of 'change_password_screen_bloc.dart';

@CopyWith(skipFields: true)
class ChangePasswordScreenState extends Equatable {
  final bool loading;
  final bool validated;
  final String? password;
  final bool isValidConfirm;
  final String? confirmPassword;
  final Resettable<ApiException>? error;
  final Resettable<bool>? isComplete;

  ChangePasswordScreenState(
      {this.loading = false,
      this.validated = false,
      this.isComplete,
      this.password,
      this.isValidConfirm = true,
      this.confirmPassword,
      this.error});

  @override
  List<Object?> get props => [
        isComplete,
        validated,
        loading,
        password,
        confirmPassword,
        error,
        isValidConfirm
      ];
}
