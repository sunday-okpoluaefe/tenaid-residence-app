part of 'invite_status_bloc.dart';

sealed class InviteStatusEvent extends Equatable {
  const InviteStatusEvent();
}

class OnGenerateExitCode extends InviteStatusEvent {
  @override
  List<Object?> get props => [];
}

class OnInit extends InviteStatusEvent {
  final VisitorDomain visitor;

  OnInit(this.visitor);

  @override
  List<Object?> get props => [];
}
