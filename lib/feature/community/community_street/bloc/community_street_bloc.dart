import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/utils/resettable.dart';

import '../../../../core/network/api_error_parser.dart';
import '../../../../library/community/domain/entity/paginate_param.dart';
import '../../../../library/community/domain/use_cases/get_streets_usecase.dart';
import '../../../../library/core/domain/entity/paginated_result.dart';
import '../../../../utils/app_bloc.dart';

part 'community_street_bloc.g.dart';
part 'community_street_event.dart';
part 'community_street_state.dart';

@injectable
class CommunityStreetBloc
    extends AppBloc<CommunityStreetEvent, CommunityStreetState> {
  final GetStreetsUseCase _getStreets;

  CommunityStreetBloc(this._getStreets) : super(CommunityStreetState()) {
    on<OnLoadStreets>((event, emit) async {
      emit(state.copyWith(loading: true));

      try {
        PaginatedResult result = await _getStreets(PaginateParam(
            page: event.page, limit: event.limit, query: event.community));
        emit(state.copyWith(loading: false, results: Resettable(result)));
      } on ApiException catch (error) {
        emit(state.copyWith(loading: false, errorMessage: Resettable(error)));
      }
    });
  }
}
