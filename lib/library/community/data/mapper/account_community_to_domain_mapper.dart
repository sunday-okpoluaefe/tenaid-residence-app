import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/community/data/mapper/community_to_domain_mapper.dart';
import 'package:tenaid_mobile/library/community/data/mapper/street_to_domain_mapper.dart';
import 'package:tenaid_mobile/library/community/data/model/account_community.dart';
import 'package:tenaid_mobile/library/community/domain/entity/account_community_domain.dart';
import 'package:tenaid_mobile/utils/mapper.dart';

@injectable
class AccountCommunityToDomainMapper
    extends Mapper<AccountCommunity, AccountCommunityDomain> {
  final CommunityToDomainMapper communityMapper;
  final StreetToDomainMapper streetMapper;

  AccountCommunityToDomainMapper(this.communityMapper, this.streetMapper);

  @override
  AccountCommunityDomain map(AccountCommunity from) => AccountCommunityDomain(
      id: from.id,
      status: from.status,
      code: from.code,
      isAdmin: from.isAdmin,
      isPrimary: from.isPrimary,
      community:
          from.community != null ? communityMapper.map(from.community!) : null,
      houseName: from.houseName,
      apartment: from.apartment,
      street: from.street != null ? streetMapper.map(from.street!) : null);
}
