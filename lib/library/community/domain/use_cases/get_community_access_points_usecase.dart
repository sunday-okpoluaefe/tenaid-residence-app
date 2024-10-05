import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/community/domain/community_repository.dart';
import 'package:tenaid_mobile/library/community/domain/entity/access_point_domain.dart';
import 'package:tenaid_mobile/utils/use_case.dart';

@injectable
class GetCommunityAccessPointsUseCase
    extends UseCase<String, List<AccessPointDomain>> {
  final CommunityRepository repository;

  GetCommunityAccessPointsUseCase(this.repository);

  @override
  Future<List<AccessPointDomain>> call(String args) async =>
      await repository.getCommunityAccessPoints(community: args);
}
