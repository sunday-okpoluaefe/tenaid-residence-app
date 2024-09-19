import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/core/network/api_error_parser.dart';
import 'package:tenaid_mobile/library/community/domain/use_cases/get_streets_usecase.dart';
import 'package:tenaid_mobile/utils/resettable.dart';

import '../../../../library/community/domain/entity/street_domain.dart';

part 'select_street_screen_bloc.g.dart';

part 'select_street_screen_event.dart';

part 'select_street_screen_state.dart';

@injectable
class SelectStreetScreenBloc
    extends Bloc<SelectStreetScreenEvent, SelectStreetScreenState> {
  final GetStreetsUseCase _getStreets;

  void handleUiEvent(SelectStreetScreenEvent event) => add(event);

  SelectStreetScreenBloc(this._getStreets) : super(SelectStreetScreenState()) {
    on<OnGetStreets>((event, emit) async {
      emit(state.copyWith(loading: true));

      try {
        List<StreetDomain> streets = await _getStreets(event.community);
        emit(state.copyWith(loading: false, results: streets));
      } on ApiException catch (error) {
        emit(state.copyWith(loading: false, errorMessage: Resettable(error)));
      }
    });

    on<OnStreetSelected>((event, emit) {
      emit(state.copyWith(itemSelected: Resettable(event.street)));
    });
  }
}
