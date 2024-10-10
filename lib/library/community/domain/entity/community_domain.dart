import 'package:tenaid_mobile/library/account/domain/entity/address_domain.dart';

class CommunityDomain {
  final String? id;
  final String? name;
  final String? description;
  final String? code;
  final num? members;
  final String? type;
  final List<dynamic> images;
  final AddressDomain? address;
  final String? createdAt;
  final String? updatedAt;

  CommunityDomain(
      {this.id,
      this.name,
      this.description,
      this.code,
      this.members,
      this.type,
      this.images = const [],
      this.address,
      this.createdAt,
      this.updatedAt});
}
