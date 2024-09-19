import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/community/domain/community_repository.dart';
import 'package:tenaid_mobile/library/community/domain/entity/community_domain.dart';
import 'package:tenaid_mobile/utils/use_case.dart';

@injectable
class SearchCommunityUseCase extends UseCase<String, List<CommunityDomain>> {
  final CommunityRepository _communityRepository;

  SearchCommunityUseCase(this._communityRepository);

  @override
  Future<List<CommunityDomain>> call(String args) async =>
      await _communityRepository.searchCommunity(args);
}
