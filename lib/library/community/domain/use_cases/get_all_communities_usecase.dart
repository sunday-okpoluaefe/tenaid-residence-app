import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/community/domain/community_repository.dart';
import 'package:tenaid_mobile/library/community/domain/entity/account_community_domain.dart';
import 'package:tenaid_mobile/utils/use_case.dart';

@injectable
class GetAllCommunitiesUseCase
    extends UseCase<bool, List<AccountCommunityDomain>> {
  final CommunityRepository repository;

  GetAllCommunitiesUseCase(this.repository);

  @override
  Future<List<AccountCommunityDomain>> call(bool args) async =>
      repository.getAllCommunities(refresh: args);
}
