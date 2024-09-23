import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:tenaid_mobile/library/account/domain/entity/account_domain.dart';
import 'package:tenaid_mobile/library/community/domain/entity/community_domain.dart';
import 'package:tenaid_mobile/library/community/domain/entity/street_domain.dart';

part 'join_request_domain.g.dart';

@CopyWith(skipFields: true)
class JoinRequestDomain {
  final String? id;
  final CommunityDomain? community;
  final StreetDomain? street;
  final String? description;
  final AccountDomain? account;
  final String? point;
  final String? code;
  final String? status;
  final String? createdAt;
  final String? updatedAt;

  JoinRequestDomain(
      {this.id,
      this.community,
      this.street,
      this.description,
      this.account,
      this.point,
      this.code,
      this.status,
      this.createdAt,
      this.updatedAt});

  String get address => '$description, $point - ${street?.name}';
}
