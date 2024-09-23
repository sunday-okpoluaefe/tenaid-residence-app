import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/community/domain/community_repository.dart';
import 'package:tenaid_mobile/library/community/domain/entity/account_community_domain.dart';
import 'package:tenaid_mobile/utils/use_case.dart';

@injectable
class GetPrimaryAccountCommunityUseCase
    extends UseCase<void, AccountCommunityDomain?> {
  final CommunityRepository repository;

  GetPrimaryAccountCommunityUseCase(this.repository);

  @override
  Future<AccountCommunityDomain?> call(_) async =>
      repository.getPrimaryAccountCommunity();
}
