import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/core/domain/cache.dart';
import 'package:tenaid_mobile/library/core/domain/entity/paginated_result.dart';
import 'package:tenaid_mobile/library/message/data/model/community_message.dart';
import 'package:tenaid_mobile/library/message/domain/entity/community_message_domain.dart';

import '../domain/message_respository.dart';
import 'datasource/local_message_datasource.dart';
import 'datasource/remote_message_datasource.dart';
import 'mapper/community_message_mapper.dart';

@Injectable(as: MessageRepository)
class MessageRepositoryImpl implements MessageRepository {
  final Cache localCache;
  final LocalMessageDataSource localMessageDataSource;
  final RemoteMessageDataSource remoteMessageDataSource;
  final CommunityMessageMapper messageMapper;

  MessageRepositoryImpl(this.messageMapper, this.localCache,
      this.localMessageDataSource, this.remoteMessageDataSource);

  @override
  Future<List<CommunityMessageDomain>> getMessages() async {
    List<CommunityMessageDomain> messages = [];
    int length = await CommunityMessageBox.length;
    for (int i = 0; i < length; i++) {
      CommunityMessage? message = await localMessageDataSource.getMessageAt(i);
      if (message != null) messages.add(messageMapper.map(message));
    }
    return messages;
  }

  @override
  Future<void> saveMessage(CommunityMessage message) async {
    await this.localMessageDataSource.saveMessage(message);
    await saveLastMessageDate(date: message.date);
  }

  @override
  Future<PaginatedResult> getUnreadMessages(String community,
      {int page = 1, int limit = 10, String? date}) async {
    PaginatedResult result = await remoteMessageDataSource
        .getMessages(community, page: page, limit: limit, date: date);

    for (CommunityMessage message in result.data as List<CommunityMessage>) {
      await saveMessage(message);
    }

    return result.copyWith(
        data: List<CommunityMessageDomain>.from(result.data
            .map((data) => messageMapper.map(data as CommunityMessage))));
  }

  @override
  Future<String> getLastMessageDate() async =>
      await localCache.getString(PREF_LAST_MESSAGE_FETCHED_, '');

  @override
  Future<void> saveLastMessageDate({required String? date}) async =>
      await localCache.set(PREF_LAST_MESSAGE_FETCHED_, date ?? '');
}
