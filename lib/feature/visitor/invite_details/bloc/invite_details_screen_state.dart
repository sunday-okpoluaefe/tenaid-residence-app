part of 'invite_details_screen_bloc.dart';

@CopyWith(skipFields: true)
class InviteDetailsScreenState extends Equatable {
  final bool loading;
  final InviteDomain? invite;

  InviteDetailsScreenState({this.invite, this.loading = true});

  @override
  List<Object?> get props => [invite];
}
