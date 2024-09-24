import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/community/domain/community_repository.dart';
import 'package:tenaid_mobile/library/community/domain/entity/access_point_domain.dart';
import 'package:tenaid_mobile/library/community/domain/entity/create_access_point_param.dart';
import 'package:tenaid_mobile/utils/use_case.dart';

@injectable
class CreateAccessPointUseCase
    extends UseCase<CreateAccessPointParam, AccessPointDomain> {
  final CommunityRepository repository;

  CreateAccessPointUseCase(this.repository);

  @override
  Future<AccessPointDomain> call(CreateAccessPointParam args) async =>
      await repository.createCommunityAccessPoints(param: args);
}
