import 'package:copy_with_extension/copy_with_extension.dart';

part 'message_param.g.dart';

enum MessageType { text, file, image }

@CopyWith(skipFields: true)
class MessageParam {
  final String messageId;
  final String body;
  final String? description;
  final String type;
  final String? repliedTo;
  final String community;
  final String author;
  final String date;

  MessageParam(
      {required this.messageId,
      required this.body,
      required this.date,
      required this.description,
      required this.type,
      required this.repliedTo,
      required this.community,
      required this.author});

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map = Map();
    map['body'] = body;
    map['date'] = date;
    map['type'] = type;
    map['community'] = community;
    map['messageId'] = messageId;
    if (description?.isNotEmpty == true) map['description'] = description;

    map['author'] = author;
    if (repliedTo?.isNotEmpty == true) map['repliedTo'] = repliedTo;
    return map;
  }
}
