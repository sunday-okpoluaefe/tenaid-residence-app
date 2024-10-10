import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

import '../model/community_message.dart';

late LazyBox CommunityMessageBox;

@injectable
class LocalMessageDataSource {
  Future<CommunityMessage?> getMessageAt(int index) async {
    String? json = await CommunityMessageBox.getAt(index);
    if (json?.isEmpty == true) return null;

    return CommunityMessage.fromJson(jsonDecode(json!));
  }

  Future<void> saveMessage(CommunityMessage message) async {
    await CommunityMessageBox.put(message.id, jsonEncode(message.toJson()));
  }
}
