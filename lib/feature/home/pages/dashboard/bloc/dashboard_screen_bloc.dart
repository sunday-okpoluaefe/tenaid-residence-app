import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/core/network/api_error_parser.dart';
import 'package:tenaid_mobile/library/account/domain/entity/account_domain.dart';
import 'package:tenaid_mobile/library/account/domain/use_cases/get_account_usecase.dart';
import 'package:tenaid_mobile/library/community/domain/entity/account_community_domain.dart';
import 'package:tenaid_mobile/library/community/domain/entity/paginate_param.dart';
import 'package:tenaid_mobile/library/community/domain/entity/visitor_domain.dart';
import 'package:tenaid_mobile/library/community/domain/use_cases/get_recent_visitors_usecase.dart';
import 'package:tenaid_mobile/library/community/domain/use_cases/get_today_visitors_usecase.dart';
import 'package:tenaid_mobile/utils/xts/list_xt.dart';

import '../../../../../library/community/domain/use_cases/get_all_communities_usecase.dart';
import '../../../../../library/community/domain/use_cases/get_join_request_count_usecase.dart';
import '../../../../../library/core/domain/entity/paginated_result.dart';
import '../../../../../utils/app_bloc.dart';

part 'dashboard_screen_bloc.g.dart';
part 'dashboard_screen_event.dart';
part 'dashboard_screen_state.dart';

@injectable
class DashboardScreenBloc
    extends AppBloc<DashboardScreenEvent, DashboardScreenState> {
  final GetAccountUseCase getAccount;
  final GetAllCommunitiesUseCase getAllCommunities;
  final GetRecentVisitorsUseCase getRecentVisitors;
  final GetTodayVisitorsUseCase getTodayVisitors;
  final GetJoinRequestCountUseCase getJoinRequestCount;

  DashboardScreenBloc(this.getAccount, this.getAllCommunities,
      this.getRecentVisitors, this.getTodayVisitors, this.getJoinRequestCount)
      : super(DashboardScreenState()) {
    on<OnGetAccount>((event, emit) async {
      emit(state.copyWith(accountLoading: true && !event.silent));
      try {
        AccountDomain account = await getAccount(false);
        emit(state.copyWith(accountLoading: false, account: account));

        account = await getAccount(event.refresh);
        emit(state.copyWith(account: account));
      } on ApiException catch (_) {}
    });

    on<OnGetTodayVisitors>((event, emit) async {
      emit(state.copyWith(todayVisitorsLoading: true && !event.silent));
      try {
        PaginatedResult visitors =
            await getTodayVisitors(PaginateParam(page: 1, limit: 4));
        emit(state.copyWith(
            todayVisitorsLoading: false,
            todayVisitors: visitors.data.isEmpty
                ? <VisitorDomain>[]
                : visitors.data as List<VisitorDomain>));
      } on ApiException catch (_) {
        emit(state.copyWith(todayVisitorsLoading: false));
      }
    });

    on<OnGetRecentVisitors>((event, emit) async {
      emit(state.copyWith(recentVisitorsLoading: true && !event.silent));
      try {
        PaginatedResult visitors =
            await getRecentVisitors(PaginateParam(page: 1, limit: 4));
        emit(state.copyWith(
            recentVisitorsLoading: false,
            recentVisitors: visitors.data.isEmpty
                ? <VisitorDomain>[]
                : visitors.data as List<VisitorDomain>));
      } on ApiException catch (_) {
        emit(state.copyWith(recentVisitorsLoading: false));
      }
    });

    on<OnGetRequestsCount>((event, emit) async {
      try {
        int count = await getJoinRequestCount(true);
        emit(state.copyWith(joinRequests: count));
      } on ApiException catch (_) {}
    });

    on<OnGetCommunities>((event, emit) async {
      emit(state.copyWith(communitiesLoading: true && !event.silent));
      try {
        List<AccountCommunityDomain> response = await getAllCommunities(false);

        emit(state.copyWith(communitiesLoading: false, communities: response));

        response = await getAllCommunities(event.refresh);
        emit(state.copyWith(
            communities: response,
            loading: false,
            pendingCreate: response.pendingCreate,
            pendingJoin: response.pendingJoin));
      } on ApiException catch (_) {
        emit(state.copyWith(communitiesLoading: false));
      }
    });
  }
}
