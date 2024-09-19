import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:tenaid_mobile/library/community/domain/entity/street_domain.dart';

part 'visitor_domain.g.dart';

@CopyWith(skipFields: true)
class VisitorDomain {
  VisitorDomain({
    this.id,
    this.street,
    this.name,
    this.photo,
    this.code,
    this.date,
    this.start,
    this.end,
    this.reason,
    this.status,
  });

  DateTime get startDate => DateTime.parse(start!).toLocal();

  DateTime get endDate => DateTime.parse(end!).toLocal();

  final String? id;
  final String? date;
  final StreetDomain? street;
  final String? name;
  final String? photo;
  final String? code;
  final String? start;
  final String? end;
  final String? reason;
  final String? status;
}
