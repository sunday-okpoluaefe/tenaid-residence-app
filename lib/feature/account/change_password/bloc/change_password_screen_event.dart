part of 'change_password_screen_bloc.dart';

sealed class ChangePasswordScreenEvent extends Equatable {
  const ChangePasswordScreenEvent();
}

class OnPasswordChanged extends ChangePasswordScreenEvent {
  final String password;

  OnPasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}

class OnConfirmPasswordChanged extends ChangePasswordScreenEvent {
  final String password;

  OnConfirmPasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}

class OnContinueClicked extends ChangePasswordScreenEvent {
  @override
  List<Object?> get props => [];
}
