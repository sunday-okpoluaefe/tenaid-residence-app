import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/community/domain/community_repository.dart';
import 'package:tenaid_mobile/library/community/domain/entity/paginate_param.dart';
import 'package:tenaid_mobile/utils/use_case.dart';

import '../../../core/domain/entity/paginated_result.dart';

@injectable
class GetAllVisitorsUseCase extends UseCase<PaginateParam, PaginatedResult> {
  final CommunityRepository repository;

  GetAllVisitorsUseCase(this.repository);

  @override
  Future<PaginatedResult> call(PaginateParam args) async =>
      repository.getAllVisitors(page: args.page, limit: args.limit);
}
