import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/message/domain/entity/community_message_domain.dart';
import 'package:tenaid_mobile/library/message/domain/message_respository.dart';
import 'package:tenaid_mobile/utils/use_case.dart';

@injectable
class GetMessagesUseCase extends UseCase<void, List<CommunityMessageDomain>> {
  final MessageRepository repository;

  GetMessagesUseCase(this.repository);

  @override
  Future<List<CommunityMessageDomain>> call(void args) async =>
      await repository.getMessages();
}
