import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/community/domain/community_repository.dart';
import 'package:tenaid_mobile/library/community/domain/entity/paginate_param.dart';
import 'package:tenaid_mobile/library/core/domain/entity/paginated_result.dart';
import 'package:tenaid_mobile/utils/use_case.dart';

@injectable
class GetJoinRequestsUseCase extends UseCase<PaginateParam, PaginatedResult> {
  final CommunityRepository repository;

  GetJoinRequestsUseCase(this.repository);

  @override
  Future<PaginatedResult> call(PaginateParam args) async => await repository
      .getCommunityJoinRequests(page: args.page, limit: args.limit);
}
