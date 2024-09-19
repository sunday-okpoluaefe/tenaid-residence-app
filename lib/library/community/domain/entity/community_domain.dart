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
      {required this.id,
      required this.name,
      required this.description,
      required this.code,
      required this.members,
      required this.type,
      required this.images,
      required this.address,
      required this.createdAt,
      required this.updatedAt});
}
