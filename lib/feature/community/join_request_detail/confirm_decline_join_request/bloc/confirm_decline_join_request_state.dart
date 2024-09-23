part of 'confirm_decline_join_request_bloc.dart';

@CopyWith(skipFields: true)
class ConfirmDeclineJoinRequestState extends Equatable {
  final bool loading;
  final String reason;
  final JoinRequestDomain? request;
  final Resettable<ApiException>? error;
  final Resettable<bool>? completed;

  ConfirmDeclineJoinRequestState(
      {this.loading = false,
      this.request,
      this.error,
      this.completed,
      this.reason = ''});

  @override
  List<Object?> get props => [loading, request, completed, error, reason];
}
