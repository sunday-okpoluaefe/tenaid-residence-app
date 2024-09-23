import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/core/network/api_error_parser.dart';
import 'package:tenaid_mobile/library/community/domain/entity/account_community_domain.dart';
import 'package:tenaid_mobile/library/community/domain/entity/paginate_param.dart';
import 'package:tenaid_mobile/library/community/domain/use_cases/get_join_requests_usecase.dart';
import 'package:tenaid_mobile/library/core/domain/entity/paginated_result.dart';
import 'package:tenaid_mobile/utils/resettable.dart';

import '../../../../library/community/domain/use_cases/get_primary_account_community_usecase.dart';
import '../../../../utils/app_bloc.dart';

part 'pending_join_request_bloc.g.dart';
part 'pending_join_request_event.dart';
part 'pending_join_request_state.dart';

@injectable
class PendingJoinRequestBloc
    extends AppBloc<PendingJoinRequestEvent, PendingJoinRequestState> {
  final GetJoinRequestsUseCase getJoinRequests;
  final GetPrimaryAccountCommunityUseCase getPrimaryAccountCommunity;

  PendingJoinRequestBloc(this.getJoinRequests, this.getPrimaryAccountCommunity)
      : super(PendingJoinRequestState()) {
    on<OnLoadRequests>((event, emit) async {
      emit(state.copyWith(loading: true));
      try {
        PaginatedResult result = await getJoinRequests(
            PaginateParam(page: event.page, limit: event.limit));
        emit(state.copyWith(loading: false, requests: Resettable(result)));
      } on ApiException catch (error) {
        emit(state.copyWith(error: Resettable(error)));
      }
    });

    on<OnGetPrimaryCommunity>((event, emit) async {
      try {
        AccountCommunityDomain? community =
            await getPrimaryAccountCommunity(true);

        emit(state.copyWith(primaryCommunity: community));
      } on ApiException catch (_) {}
    });
  }
}
