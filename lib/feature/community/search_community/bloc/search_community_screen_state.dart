part of 'search_community_screen_bloc.dart';

@CopyWith(skipFields: true)
class SearchCommunityScreenState extends Equatable {
  final bool loading;
  final List<CommunityDomain> results;
  final Resettable<ApiException> error;

  const SearchCommunityScreenState(this.error,
      {this.results = const [], this.loading = false});

  @override
  List<Object?> get props => [loading, results, error];
}
