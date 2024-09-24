import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/community/domain/community_repository.dart';
import 'package:tenaid_mobile/library/community/domain/entity/account_community_domain.dart';
import 'package:tenaid_mobile/utils/use_case.dart';

@injectable
class SetPrimaryCommunityUseCase
    extends UseCase<String, AccountCommunityDomain> {
  final CommunityRepository repository;

  SetPrimaryCommunityUseCase(this.repository);

  @override
  Future<AccountCommunityDomain> call(String args) async =>
      await repository.setPrimaryCommunity(args);
}
