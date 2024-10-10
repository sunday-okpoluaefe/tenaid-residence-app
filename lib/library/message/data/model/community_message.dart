import 'package:tenaid_mobile/library/community/data/model/community.dart';

class CommunityMessage {
  CommunityMessage({
    this.id,
    this.community,
    this.author,
    this.description,
    this.messageId,
    this.repliedTo,
    this.body,
    this.type,
    this.date,
  });

  CommunityMessage.fromJson(dynamic json) {
    id = json['_id'];
    community = json['community'] != null
        ? Community.fromJson(json['community'])
        : null;
    description = json['description'];
    author = json['author'] != null ? Author.fromJson(json['author']) : null;
    messageId = json['messageId'];
    repliedTo = json['repliedTo'] != null
        ? CommunityMessage.fromJson(json['repliedTo'])
        : null;
    body = json['body'];
    type = json['type'];
    date = json['date'];
  }

  String? id;
  Community? community;
  String? description;
  Author? author;
  String? messageId;
  CommunityMessage? repliedTo;
  String? body;
  String? type;
  String? date;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['community'] = community != null ? community!.toJson() : null;
    if (author != null) {
      map['author'] = author?.toJson();
    }
    map['messageId'] = messageId;
    map['description'] = description;
    map['repliedTo'] = repliedTo != null ? repliedTo!.toJson() : null;
    map['body'] = body;
    map['type'] = type;
    map['date'] = date;
    return map;
  }
}

class Author {
  Author({
    this.id,
    this.extra,
    this.isAdmin,
  });

  Author.fromJson(dynamic json) {
    id = json['_id'];
    extra = json['extra'] != null ? Extra.fromJson(json['extra']) : null;
    isAdmin = json['isAdmin'];
  }

  String? id;
  Extra? extra;
  bool? isAdmin;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    if (extra != null) {
      map['extra'] = extra?.toJson();
    }
    map['isAdmin'] = isAdmin;
    return map;
  }
}

class Extra {
  Extra({
    this.firstName,
    this.lastName,
    this.photo,
  });

  Extra.fromJson(dynamic json) {
    firstName = json['firstName'];
    lastName = json['lastName'];
    photo = json['photo'];
  }

  String? firstName;
  String? lastName;
  String? photo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['photo'] = photo;
    return map;
  }
}
