import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/community/data/mapper/access_point_to_domain_mapper.dart';
import 'package:tenaid_mobile/library/community/data/model/invite_activity.dart';
import 'package:tenaid_mobile/library/community/domain/entity/invite_activity_domain.dart';
import 'package:tenaid_mobile/utils/mapper.dart';

@injectable
class InviteActivityToDomainMapper
    extends Mapper<InviteActivity, InviteActivityDomain> {
  final AccessPointToDomainMapper accessPointMapper;

  InviteActivityToDomainMapper(this.accessPointMapper);

  @override
  InviteActivityDomain map(InviteActivity from) => InviteActivityDomain(
      id: from.id,
      accessPoint: from.accessPoint != null
          ? accessPointMapper.map(from.accessPoint!)
          : null,
      code: from.code,
      date: from.date,
      type: from.type);
}

@injectable
class InviteToDomainMapper extends Mapper<Invite, InviteDomain> {
  @override
  InviteDomain map(Invite from) => InviteDomain(
      id: from.id,
      name: from.name,
      date: from.date,
      type: from.type,
      code: from.code,
      start: from.start,
      end: from.end,
      reason: from.reason);
}
