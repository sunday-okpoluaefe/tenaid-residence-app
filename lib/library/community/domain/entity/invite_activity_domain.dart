import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:tenaid_mobile/library/community/domain/entity/access_point_domain.dart';

part 'invite_activity_domain.g.dart';

@CopyWith(skipFields: true)
class InviteActivityDomain {
  InviteActivityDomain({
    this.id,
    this.accessPoint,
    this.code,
    this.date,
    this.type,
  });

  String? id;
  AccessPointDomain? accessPoint;
  String? code;
  String? date;
  String? type;

  DateTime get createdAt => DateTime.parse(date!).toLocal();
}

@CopyWith(skipFields: true)
class InviteDomain {
  InviteDomain({
    this.id,
    this.name,
    this.type,
    this.photo,
    this.date,
    this.code,
    this.start,
    this.end,
    this.reason,
  });

  String? id;
  String? name;
  String? date;
  String? type;
  String? photo;
  String? code;
  String? start;
  String? end;
  String? reason;

  DateTime get createdAt => DateTime.parse(date!).toLocal();

  DateTime get startDate => DateTime.parse(start!).toLocal();

  DateTime get endDate => DateTime.parse(end!).toLocal();
}
