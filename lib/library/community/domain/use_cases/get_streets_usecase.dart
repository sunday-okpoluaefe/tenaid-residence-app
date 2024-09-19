import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/community/domain/community_repository.dart';
import 'package:tenaid_mobile/library/community/domain/entity/street_domain.dart';
import 'package:tenaid_mobile/utils/use_case.dart';

@injectable
class GetStreetsUseCase implements UseCase<String, List<StreetDomain>> {
  final CommunityRepository _communityRepository;

  GetStreetsUseCase(this._communityRepository);

  @override
  Future<List<StreetDomain>> call(String args) =>
      _communityRepository.getAllCommunityStreets(args);
}
