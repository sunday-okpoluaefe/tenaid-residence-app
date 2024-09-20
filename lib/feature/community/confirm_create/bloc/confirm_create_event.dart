part of 'confirm_create_bloc.dart';

sealed class ConfirmCreateEvent extends Equatable {
  const ConfirmCreateEvent();
}

class OnContinueClicked extends ConfirmCreateEvent {
  @override
  List<Object?> get props => [];
}

class OnInit extends ConfirmCreateEvent {
  final CreateCommunityParam param;

  OnInit(this.param);

  @override
  List<Object?> get props => [param];
}
