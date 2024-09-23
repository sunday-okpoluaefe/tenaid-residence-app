part of 'join_request_detail_bloc.dart';

@CopyWith(skipFields: true)
class JoinRequestDetailState extends Equatable {
  final bool loading;
  final bool approving;
  final Resettable<bool>? completed;
  final Resettable<ApiException>? error;
  final String? request;
  final JoinRequestDomain? requestDetail;

  JoinRequestDetailState(
      {this.loading = false,
      this.approving = false,
      this.completed,
      this.error,
      this.request,
      this.requestDetail});

  @override
  List<Object?> get props =>
      [approving, completed, loading, error, request, requestDetail];
}
