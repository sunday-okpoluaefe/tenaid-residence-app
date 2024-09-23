import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/community/domain/community_repository.dart';
import 'package:tenaid_mobile/utils/use_case.dart';

import '../entity/join_request_status_param.dart';

@injectable
class SetJoinRequestStatusUseCase
    extends UseCase<JoinRequestStatusParam, void> {
  final CommunityRepository repository;

  SetJoinRequestStatusUseCase(this.repository);

  @override
  Future<void> call(JoinRequestStatusParam args) async =>
      await repository.setCommunityJoinRequestStatus(
          request: args.request, status: args.status, comment: args.comment);
}
