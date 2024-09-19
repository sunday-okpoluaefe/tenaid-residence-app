part of 'search_address_screen_bloc.dart';

sealed class SearchAddressScreenEvent extends Equatable {
  const SearchAddressScreenEvent();
}

class OnSearch extends SearchAddressScreenEvent {
  final String query;

  OnSearch(this.query);

  @override
  List<Object?> get props => [query];
}
