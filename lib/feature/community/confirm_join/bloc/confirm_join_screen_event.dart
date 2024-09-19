part of 'confirm_join_screen_bloc.dart';

sealed class ConfirmJoinScreenEvent extends Equatable {
  const ConfirmJoinScreenEvent();
}

class OnContinueClicked extends ConfirmJoinScreenEvent {
  @override
  List<Object?> get props => [];
}

class OnPrimaryChanged extends ConfirmJoinScreenEvent {
  final bool checked;

  OnPrimaryChanged(this.checked);

  @override
  List<Object?> get props => [checked];
}
