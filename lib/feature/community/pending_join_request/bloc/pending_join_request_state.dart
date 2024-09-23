part of 'pending_join_request_bloc.dart';

@CopyWith(skipFields: true)
class PendingJoinRequestState extends Equatable {
  final bool loading;
  final Resettable<PaginatedResult>? requests;
  final Resettable<ApiException>? error;
  final AccountCommunityDomain? primaryCommunity;

  PendingJoinRequestState(
      {this.loading = false, this.requests, this.error, this.primaryCommunity});

  @override
  List<Object?> get props => [loading, error, requests, primaryCommunity];
}
