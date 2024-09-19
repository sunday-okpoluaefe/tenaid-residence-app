part of 'forgot_password_screen_bloc.dart';

sealed class ForgotPasswordScreenState extends Equatable {
  const ForgotPasswordScreenState();
}

final class ForgotPasswordScreenInitial extends ForgotPasswordScreenState {
  @override
  List<Object> get props => [];
}
