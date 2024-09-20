import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/community/domain/entity/community_domain.dart';
import 'package:tenaid_mobile/utils/mapper.dart';

import '../../../account/domain/entity/address_domain.dart';
import '../model/community.dart';

@injectable
class CommunityToDomainMapper extends Mapper<Community, CommunityDomain> {
  @override
  CommunityDomain map(Community from) => CommunityDomain(
      id: from.id,
      name: from.name,
      description: from.description,
      code: from.code,
      members: from.members,
      type: from.type,
      images: from.images ?? [],
      address: AddressDomain(
          latitude: from.address?.latitude,
          longitude: from.address?.longitude,
          address: from.address?.address,
          city: from.address?.city,
          country: from.address?.country,
          postalCode: from.address?.postalCode,
          proofOfAddress: from.address?.proofOfAddress),
      createdAt: from.createdAt,
      updatedAt: from.updatedAt);
}
