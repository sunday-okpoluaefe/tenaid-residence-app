part of 'signup_screen_bloc.dart';

sealed class SignupScreenEvent extends Equatable {
  const SignupScreenEvent();
}

class OnFNameChanged extends SignupScreenEvent {
  final String name;

  const OnFNameChanged(this.name);

  @override
  List<Object?> get props => [name];
}

class OnLNameChanged extends SignupScreenEvent {
  final String name;

  const OnLNameChanged(this.name);

  @override
  List<Object?> get props => [name];
}

class OnEmailFocusChanged extends SignupScreenEvent {
  final bool hasFocus;

  const OnEmailFocusChanged(this.hasFocus);

  @override
  List<Object?> get props => [hasFocus];
}

class OnContinueClicked extends SignupScreenEvent {
  const OnContinueClicked();

  @override
  List<Object?> get props => [];
}

class OnEmailNameChanged extends SignupScreenEvent {
  final String email;

  const OnEmailNameChanged(this.email);

  @override
  List<Object?> get props => [email];
}

class OnPhoneNameChanged extends SignupScreenEvent {
  final String phone;

  const OnPhoneNameChanged(this.phone);

  @override
  List<Object?> get props => [phone];
}

class OnPasswordNameChanged extends SignupScreenEvent {
  final String password;

  const OnPasswordNameChanged(this.password);

  @override
  List<Object?> get props => [password];
}

class OnCountryChanged extends SignupScreenEvent {
  final Country country;

  const OnCountryChanged(this.country);

  @override
  List<Object?> get props => [country];
}
