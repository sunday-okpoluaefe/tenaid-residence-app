part of 'invite_details_screen_bloc.dart';

sealed class InviteDetailsScreenEvent extends Equatable {
  const InviteDetailsScreenEvent();
}

class OnInit extends InviteDetailsScreenEvent {
  final InviteDomain invite;

  OnInit(this.invite);

  @override
  List<Object?> get props => [invite];
}
