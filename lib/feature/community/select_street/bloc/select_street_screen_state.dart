part of 'select_street_screen_bloc.dart';

@CopyWith(skipFields: true)
class SelectStreetScreenState extends Equatable {
  final Resettable<PaginatedResult>? results;
  final Resettable<ApiException>? errorMessage;
  final Resettable<StreetDomain>? itemSelected;
  final bool loading;

  const SelectStreetScreenState(
      {this.results,
      this.loading = false,
      this.errorMessage,
      this.itemSelected});

  @override
  List<Object?> get props => [results, loading, errorMessage, itemSelected];
}
