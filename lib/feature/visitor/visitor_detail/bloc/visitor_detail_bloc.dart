import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/core/network/api_error_parser.dart';
import 'package:tenaid_mobile/library/community/domain/entity/invite_activity_domain.dart';
import 'package:tenaid_mobile/library/community/domain/entity/paginate_param.dart';
import 'package:tenaid_mobile/library/community/domain/entity/visitor_domain.dart';
import 'package:tenaid_mobile/library/core/domain/entity/paginated_result.dart';
import 'package:tenaid_mobile/utils/pair.dart';

import '../../../../library/community/domain/use_cases/get_invite_activities_usecase.dart';
import '../../../../utils/app_bloc.dart';

part 'visitor_detail_bloc.g.dart';
part 'visitor_detail_event.dart';
part 'visitor_detail_state.dart';

@injectable
class VisitorDetailBloc
    extends AppBloc<VisitorDetailEvent, VisitorDetailState> {
  final GetInviteActivitiesUseCase getInviteActivities;

  VisitorDetailBloc(this.getInviteActivities) : super(VisitorDetailState()) {
    on<OnLoadActivities>((event, emit) async {
      emit(state.copyWith(loading: true));

      try {
        Pair<InviteDomain, PaginatedResult> result = await getInviteActivities(
            PaginateParam(
                page: event.page, limit: event.limit, query: event.invite));

        PaginatedResult activities = result.second.copyWith(
            data: result.second.data.isEmpty
                ? <InviteActivityDomain>[]
                : result.second.data as List<InviteActivityDomain>);

        emit(state.copyWith(
            invite: result.first,
            activities: activities,
            loading: false,
            hasError: false));
      } on ApiException catch (_) {
        emit(state.copyWith(loading: false, hasError: true));
      }
    });
  }
}
