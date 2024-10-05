import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/community/domain/community_repository.dart';
import 'package:tenaid_mobile/library/community/domain/entity/paginate_param.dart';
import 'package:tenaid_mobile/utils/use_case.dart';

import '../../../../utils/pair.dart';
import '../../../core/domain/entity/paginated_result.dart';
import '../entity/invite_activity_domain.dart';

@injectable
class GetInviteActivitiesUseCase
    extends UseCase<PaginateParam, Pair<InviteDomain, PaginatedResult>> {
  final CommunityRepository repository;

  GetInviteActivitiesUseCase(this.repository);

  @override
  Future<Pair<InviteDomain, PaginatedResult>> call(PaginateParam args) async =>
      await repository.getInviteActivities(
          invite: args.query as String, page: args.page, limit: args.limit);
}
