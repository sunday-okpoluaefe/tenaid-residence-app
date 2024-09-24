part of 'community_street_bloc.dart';

@CopyWith(skipFields: true)
class CommunityStreetState extends Equatable {
  final bool loading;
  final Resettable<PaginatedResult>? results;
  final Resettable<ApiException>? errorMessage;

  final bool error;

  CommunityStreetState(
      {this.loading = false,
      this.results,
      this.error = false,
      this.errorMessage});

  @override
  List<Object?> get props => [loading, error, results, errorMessage];
}
