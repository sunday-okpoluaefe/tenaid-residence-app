part of 'login_screen_bloc.dart';

abstract class LoginScreenEvent extends Equatable {
  const LoginScreenEvent();
}

final class OnEmailChanged extends LoginScreenEvent {
  final String email;

  const OnEmailChanged(this.email);

  @override
  List<Object?> get props => [email];
}

final class OnPasswordChanged extends LoginScreenEvent {
  final String password;

  const OnPasswordChanged(this.password);

  @override
  List<Object?> get props => [password];
}

final class OnEmailFocusChanged extends LoginScreenEvent {
  final bool hasFocus;

  const OnEmailFocusChanged(this.hasFocus);

  @override
  List<Object?> get props => [hasFocus];
}

final class OnContinueClicked extends LoginScreenEvent {
  @override
  List<Object?> get props => [];
}
