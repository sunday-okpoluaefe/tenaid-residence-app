import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/community/domain/community_repository.dart';
import 'package:tenaid_mobile/library/community/domain/entity/paginate_param.dart';
import 'package:tenaid_mobile/library/core/domain/entity/paginated_result.dart';
import 'package:tenaid_mobile/utils/use_case.dart';

@injectable
class GetStreetsUseCase implements UseCase<PaginateParam, PaginatedResult> {
  final CommunityRepository _communityRepository;

  GetStreetsUseCase(this._communityRepository);

  @override
  Future<PaginatedResult> call(PaginateParam args) =>
      _communityRepository.getAllCommunityStreets(
          community: args.query as String, page: args.page, limit: args.limit);
}
