import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/core/network/api_error_parser.dart';
import 'package:tenaid_mobile/library/core/domain/use_cases/search_address_usecase.dart';
import 'package:tenaid_mobile/utils/resettable.dart';

import '../../../../library/core/domain/entity/place_domain.dart';

part 'search_address_screen_bloc.g.dart';
part 'search_address_screen_event.dart';
part 'search_address_screen_state.dart';

@injectable
class SearchAddressScreenBloc
    extends Bloc<SearchAddressScreenEvent, SearchAddressScreenState> {
  final SearchAddressUseCase searchAddress;

  void handleUiEvent(SearchAddressScreenEvent event) => add(event);

  SearchAddressScreenBloc(this.searchAddress)
      : super(SearchAddressScreenState()) {
    on<OnSearch>((event, emit) async {
      emit(state.copyWith(loading: true));
      try {
        List<PlaceDomain> result = await searchAddress(event.query);
        emit(state.copyWith(results: result, loading: false));
      } on ApiException catch (error) {
        emit(state.copyWith(loading: false, error: Resettable(error)));
      }
    });
  }
}
