import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/core/domain/entity/paginated_result.dart';

import '../../../../utils/use_case.dart';
import '../community_repository.dart';
import '../entity/paginate_param.dart';

@injectable
class GetRecentVisitorsUseCase extends UseCase<PaginateParam, PaginatedResult> {
  final CommunityRepository repository;

  GetRecentVisitorsUseCase(this.repository);

  @override
  Future<PaginatedResult> call(PaginateParam args) async =>
      await repository.getRecentVisitors(page: args.page, limit: args.limit);
}
