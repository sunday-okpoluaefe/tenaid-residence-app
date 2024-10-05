import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/community/domain/community_repository.dart';
import 'package:tenaid_mobile/library/community/domain/entity/create_street_param.dart';
import 'package:tenaid_mobile/library/community/domain/entity/street_domain.dart';
import 'package:tenaid_mobile/utils/use_case.dart';

@injectable
class CreateCommunityStreetUseCase
    extends UseCase<CreateStreetParam, StreetDomain> {
  final CommunityRepository repository;

  CreateCommunityStreetUseCase(this.repository);

  @override
  Future<StreetDomain> call(CreateStreetParam args) async =>
      await repository.createCommunityStreet(args);
}
