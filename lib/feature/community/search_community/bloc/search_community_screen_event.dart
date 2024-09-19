part of 'search_community_screen_bloc.dart';

sealed class SearchCommunityScreenEvent extends Equatable {
  const SearchCommunityScreenEvent();
}

class OnSearch extends SearchCommunityScreenEvent {
  final String query;

  OnSearch(this.query);

  @override
  List<Object?> get props => [query];
}
