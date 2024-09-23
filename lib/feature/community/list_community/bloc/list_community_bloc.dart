import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/core/network/api_error_parser.dart';

import '../../../../library/community/domain/entity/account_community_domain.dart';
import '../../../../library/community/domain/use_cases/get_all_communities_usecase.dart';
import '../../../../utils/app_bloc.dart';

part 'list_community_bloc.g.dart';
part 'list_community_event.dart';
part 'list_community_state.dart';

@injectable
class ListCommunityBloc
    extends AppBloc<ListCommunityEvent, ListCommunityState> {
  final GetAllCommunitiesUseCase getAllCommunities;

  ListCommunityBloc(this.getAllCommunities) : super(ListCommunityState()) {
    on<OnLoadCommunities>((event, emit) async {
      emit(state.copyWith(loading: true, error: false));

      try {
        List<AccountCommunityDomain> communities =
            await getAllCommunities(true);
        emit(state.copyWith(
            loading: false, communities: communities, error: false));
      } on ApiException catch (_) {
        emit(state.copyWith(loading: false, error: true));
      }
    });
  }
}
