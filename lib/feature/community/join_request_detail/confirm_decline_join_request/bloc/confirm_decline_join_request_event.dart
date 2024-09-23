part of 'confirm_decline_join_request_bloc.dart';

sealed class ConfirmDeclineJoinRequestEvent extends Equatable {
  const ConfirmDeclineJoinRequestEvent();
}

class OnDeclineRequest extends ConfirmDeclineJoinRequestEvent {
  final String request;

  OnDeclineRequest(this.request);

  @override
  List<Object?> get props => [request];
}

class OnReasonChanged extends ConfirmDeclineJoinRequestEvent {
  final String reason;

  OnReasonChanged(this.reason);

  @override
  List<Object?> get props => [reason];
}
