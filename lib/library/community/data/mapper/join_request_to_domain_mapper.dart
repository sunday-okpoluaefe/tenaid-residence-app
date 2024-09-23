import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/account/data/mapper/account_to_domain_mapper.dart';
import 'package:tenaid_mobile/library/community/data/mapper/community_to_domain_mapper.dart';
import 'package:tenaid_mobile/library/community/data/mapper/street_to_domain_mapper.dart';
import 'package:tenaid_mobile/library/community/data/model/join_request.dart';
import 'package:tenaid_mobile/library/community/domain/entity/join_request_domain.dart';
import 'package:tenaid_mobile/utils/mapper.dart';

@injectable
class JoinRequestToDomainMapper extends Mapper<JoinRequest, JoinRequestDomain> {
  final CommunityToDomainMapper communityMapper;
  final AccountToDomainMapper accountMapper;
  final StreetToDomainMapper streetMapper;

  JoinRequestToDomainMapper(
      {required this.communityMapper,
      required this.accountMapper,
      required this.streetMapper});

  @override
  JoinRequestDomain map(JoinRequest from) => JoinRequestDomain(
      id: from.id,
      community:
          from.community != null ? communityMapper.map(from.community!) : null,
      street: from.path != null ? streetMapper.map(from.path!) : null,
      description: from.description,
      account: from.extra != null ? accountMapper.map(from.extra!) : null,
      point: from.point,
      code: from.code,
      status: from.status,
      createdAt: from.createdAt,
      updatedAt: from.updatedAt);
}
