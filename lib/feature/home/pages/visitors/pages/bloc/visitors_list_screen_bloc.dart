import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/core/network/api_error_parser.dart';
import 'package:tenaid_mobile/library/community/domain/entity/paginate_param.dart';
import 'package:tenaid_mobile/library/community/domain/use_cases/get_today_visitors_usecase.dart';
import 'package:tenaid_mobile/utils/resettable.dart';

import '../../../../../../../library/community/domain/use_cases/get_all_visitors_usecase.dart';
import '../../../../../../../library/core/domain/entity/paginated_result.dart';
import '../../../../../../../utils/app_bloc.dart';
import '../../../../../../library/community/domain/use_cases/get_upcoming_visitors_usecase.dart';

part 'visitors_list_screen_bloc.g.dart';
part 'visitors_list_screen_event.dart';
part 'visitors_list_screen_state.dart';

@injectable
class VisitorsListScreenBloc
    extends AppBloc<VisitorsListScreenEvent, VisitorsListScreenState> {
  final GetAllVisitorsUseCase getAllVisitors;
  final GetUpcomingVisitorsUseCase getUpcomingVisitors;
  final GetTodayVisitorsUseCase getTodayVisitors;

  Future<PaginatedResult> _getVisitors(
      {required ListType type, required PaginateParam param}) async {
    switch (type) {
      case ListType.all:
        return await getAllVisitors(param);

      case ListType.today:
        return await getTodayVisitors(param);

      case ListType.upcoming:
        return await getUpcomingVisitors(param);
    }
  }

  VisitorsListScreenBloc(
      this.getAllVisitors, this.getUpcomingVisitors, this.getTodayVisitors)
      : super(VisitorsListScreenState()) {
    on<OnLoadVisitors>((event, emit) async {
      emit(state.copyWith(loading: true));
      try {
        PaginatedResult data = await _getVisitors(
            type: event.type,
            param: PaginateParam(page: event.page, limit: event.limit));
        emit(state.copyWith(visitors: Resettable(data), loading: false));
      } on ApiException catch (error) {
        emit(state.copyWith(error: Resettable(error), loading: false));
      }
    });
  }
}
