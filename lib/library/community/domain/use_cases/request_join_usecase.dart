import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/community/domain/community_repository.dart';
import 'package:tenaid_mobile/library/community/domain/entity/account_community_domain.dart';
import 'package:tenaid_mobile/library/community/domain/entity/request_join_param.dart';
import 'package:tenaid_mobile/utils/use_case.dart';

@injectable
class RequestJoinUseCase
    extends UseCase<RequestJoinParam, AccountCommunityDomain> {
  final CommunityRepository repository;

  RequestJoinUseCase(this.repository);

  @override
  Future<AccountCommunityDomain> call(RequestJoinParam args) async {
    return await repository.requestJoin(args);
  }
}
