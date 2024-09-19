part of 'search_address_screen_bloc.dart';

@CopyWith(skipFields: true)
class SearchAddressScreenState extends Equatable {
  final List<PlaceDomain> results;
  final bool loading;
  final Resettable<ApiException>? error;

  SearchAddressScreenState(
      {this.results = const [], this.loading = false, this.error});

  @override
  List<Object?> get props => [results, loading, error];
}
