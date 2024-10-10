import 'dart:io';

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';
import 'package:tenaid_mobile/library/message/data/model/community_message.dart';
import 'package:tenaid_mobile/library/message/domain/entity/community_message_domain.dart';
import 'package:tenaid_mobile/library/message/domain/entity/message_param.dart';

import '../env/config.dart';
import '../library/message/data/mapper/community_message_mapper.dart';
import '../library/message/domain/message_respository.dart';
import 'notification_service/notification_config.dart';

IO.Socket? socket;

@injectable
class MessageService {
  static String EVENT_NAME = 'community-message';
  final CommunityMessageMapper messageMapper = GetIt.instance.get();
  final MessageRepository repository = GetIt.instance.get();

  Future<void> connect(
      {required String token,
      required String community,
      required String member,
      required Function() onConnected,
      required Function() onDisConnected}) async {
    if (socket != null) return;

    String? pushToken = await getDeviceToken();

    socket = IO.io(
        '${Config.shared.baseSocketUrl}/chat',
        OptionBuilder().setTransports(['websocket']).setAuth(
            {'authorization': 'Bearer $token'}).setExtraHeaders({
          'community': community,
          'member': member,
          'token': pushToken,
          'device': Platform.operatingSystem
        }).build());

    socket!.onConnect((_) {
      onConnected();
    });

    socket!.onDisconnect((_) {
      onDisConnected();
    });
  }

  void subscribe(
      {required String event,
      required Function(CommunityMessageDomain) onEvent}) {
    if (socket != null)
      socket!.on(EVENT_NAME, (data) {
        CommunityMessage message = CommunityMessage.fromJson(data);
        // save incoming message
        repository.saveMessage(message).then((_) {
          onEvent(messageMapper.map(message));
        });
      });
  }

  void sendMessage(MessageParam message) {
    if (socket == null) return;
    socket!.emit(EVENT_NAME, message.toJson());
  }
}
