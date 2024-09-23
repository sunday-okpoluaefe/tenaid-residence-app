import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/community/domain/community_repository.dart';
import 'package:tenaid_mobile/library/community/domain/entity/join_request_domain.dart';
import 'package:tenaid_mobile/utils/use_case.dart';

@injectable
class GetJoinRequestUseCase extends UseCase<String, JoinRequestDomain> {
  final CommunityRepository repository;

  GetJoinRequestUseCase(this.repository);

  @override
  Future<JoinRequestDomain> call(String args) async =>
      await repository.getCommunityJoinRequest(request: args);
}
