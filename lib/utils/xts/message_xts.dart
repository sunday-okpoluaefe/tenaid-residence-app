import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

import '../../library/message/domain/entity/community_message_domain.dart';

extension ListMXT on List<CommunityMessageDomain> {
  List<types.Message> get toUiMessages {
    return List<types.Message>.from(
        this.map((message) => message.toUiMessage()));
  }

  List<CommunityMessageDomain> sorted() {
    this.sort(
        (b, a) => DateTime.parse(a.date!).compareTo(DateTime.parse(b.date!)));
    return this;
  }
}

extension MXT on CommunityMessageDomain {
  types.Message toUiMessage() {
    switch (this.type!) {
      case 'file':
        return types.FileMessage(
            author: this.author!.toUiUser(community: this.community?.name),
            repliedMessage:
                this.repliedTo != null ? this.repliedTo!.toUiMessage() : null,
            id: this.messageId ?? '',
            createdAt: this.createAt,
            remoteId: this.id ?? '',
            type: types.MessageType.file,
            name: this.description ?? '',
            size: 40,
            uri: this.body ?? '');

      case 'image':
        return types.ImageMessage(
            author: this.author!.toUiUser(community: this.community?.name),
            repliedMessage:
                this.repliedTo != null ? this.repliedTo!.toUiMessage() : null,
            id: this.messageId ?? '',
            type: types.MessageType.image,
            createdAt: this.createAt,
            remoteId: this.id ?? '',
            name: this.description ?? '',
            size: 40,
            uri: this.body ?? '');

      default:
        return types.TextMessage(
            author: this.author!.toUiUser(community: this.community?.name),
            repliedMessage:
                this.repliedTo != null ? this.repliedTo!.toUiMessage() : null,
            type: types.MessageType.text,
            id: this.messageId ?? '',
            createdAt: this.createAt,
            remoteId: this.id ?? '',
            text: this.body ?? '');
    }
  }
}

extension AuthorExt on AuthorDomain? {
  types.User toUiUser({String? community}) {
    return types.User(
        id: this?.id ?? '',
        firstName: this?.isAdmin == true ? community : this?.firstName,
        lastName: this?.isAdmin == true ? '' : this?.lastName,
        role: this?.isAdmin == true ? types.Role.admin : types.Role.user,
        imageUrl: this?.photo);
  }
}
