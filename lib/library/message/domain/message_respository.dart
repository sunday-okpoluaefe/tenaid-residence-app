import 'package:tenaid_mobile/library/core/domain/entity/paginated_result.dart';
import 'package:tenaid_mobile/library/message/data/model/community_message.dart';
import 'package:tenaid_mobile/library/message/domain/entity/community_message_domain.dart';

abstract class MessageRepository {
  Future<List<CommunityMessageDomain>> getMessages();

  Future<PaginatedResult> getUnreadMessages(String community,
      {int page = 1, int limit = 10, String? date});

  Future<void> saveMessage(CommunityMessage message);

  Future<String> getLastMessageDate();

  Future<void> saveLastMessageDate({required String? date});
}
