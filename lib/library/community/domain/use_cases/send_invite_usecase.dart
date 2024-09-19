import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/community/domain/community_repository.dart';
import 'package:tenaid_mobile/library/community/domain/entity/invite_param.dart';
import 'package:tenaid_mobile/utils/use_case.dart';

@injectable
class SendInviteUseCase extends UseCase<InviteParam, void> {
  final CommunityRepository repository;

  SendInviteUseCase(this.repository);

  @override
  Future<void> call(InviteParam args) async =>
      repository.sendInvite(param: args);
}
