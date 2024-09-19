import 'package:tenaid_mobile/library/community/domain/entity/community_domain.dart';
import 'package:tenaid_mobile/library/community/domain/entity/street_domain.dart';

class AccountCommunityDomain {
  final String? id;
  final CommunityDomain? community;
  final String? status;
  final String? code;
  final bool? isAdmin;
  final String? houseName;
  final String? apartment;
  final bool? isPrimary;
  final StreetDomain? street;

  AccountCommunityDomain(
      {required this.id,
      required this.isAdmin,
      required this.code,
      required this.status,
      required this.isPrimary,
      required this.community,
      required this.houseName,
      required this.apartment,
      required this.street});

  String get address {
    return isAdmin == true
        ? community?.address?.address ?? ""
        : '$apartment, $houseName - ${street?.name}';
  }
}
