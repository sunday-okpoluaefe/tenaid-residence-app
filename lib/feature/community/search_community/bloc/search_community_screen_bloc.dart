import 'package:bloc/bloc.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/core/network/api_error_parser.dart';
import 'package:tenaid_mobile/library/community/domain/entity/community_domain.dart';
import 'package:tenaid_mobile/utils/resettable.dart';

import '../../../../library/community/domain/use_cases/search_community_usecase.dart';

part 'search_community_screen_bloc.g.dart';

part 'search_community_screen_event.dart';

part 'search_community_screen_state.dart';

@injectable
class SearchCommunityScreenBloc
    extends Bloc<SearchCommunityScreenEvent, SearchCommunityScreenState> {
  final SearchCommunityUseCase _searchCommunity;

  void handleUiEvent(SearchCommunityScreenEvent event) => add(event);

  SearchCommunityScreenBloc(this._searchCommunity)
      : super(SearchCommunityScreenState(Resettable())) {
    on<OnSearch>((event, emit) async {
      emit(state.copyWith(loading: true));

      try {
        List<CommunityDomain> results = await _searchCommunity(event.query);
        emit(state.copyWith(loading: false, results: results));
      } on ApiException catch (error) {
        emit(state.copyWith(loading: false, error: Resettable(error)));
      }
    });
  }
}
