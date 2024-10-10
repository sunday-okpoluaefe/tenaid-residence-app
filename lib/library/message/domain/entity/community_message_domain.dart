import 'package:tenaid_mobile/library/community/domain/entity/community_domain.dart';

class CommunityMessageDomain {
  final String? id;
  final CommunityDomain? community;
  final AuthorDomain? author;
  final String? messageId;
  final CommunityMessageDomain? repliedTo;
  final String? body;
  final String? type;
  final String? description;
  final String? date;

  CommunityMessageDomain(
      {required this.id,
      required this.community,
      required this.author,
      required this.description,
      required this.messageId,
      required this.repliedTo,
      required this.body,
      required this.type,
      required this.date});

  int? get createAt => date != null
      ? DateTime.parse(this.date!).toLocal().millisecondsSinceEpoch
      : null;
}

class AuthorDomain {
  final String? id;
  final String? firstName;
  final String? lastName;
  final bool isAdmin;
  final String? photo;

  String get name => '$firstName $lastName';

  AuthorDomain(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.isAdmin,
      required this.photo});
}
