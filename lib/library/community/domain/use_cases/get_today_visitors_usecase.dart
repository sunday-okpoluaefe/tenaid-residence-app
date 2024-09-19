import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/community/domain/community_repository.dart';
import 'package:tenaid_mobile/utils/use_case.dart';

import '../../../core/domain/entity/paginated_result.dart';
import '../entity/paginate_param.dart';

@injectable
class GetTodayVisitorsUseCase extends UseCase<PaginateParam, PaginatedResult> {
  final CommunityRepository repository;

  GetTodayVisitorsUseCase(this.repository);

  @override
  Future<PaginatedResult> call(PaginateParam args) async =>
      await repository.getTodayVisitors(page: args.page, limit: args.limit);
}
