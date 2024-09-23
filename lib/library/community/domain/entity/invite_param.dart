import 'package:copy_with_extension/copy_with_extension.dart';

part 'invite_param.g.dart';

@CopyWith(skipFields: true)
class InviteParam {
  final String? start;
  final String? end;
  final String? date;
  final String? name;
  final String? code;
  final String? community;
  final String? member;
  final String? photo;
  final String? reason;
  final String? type;
  final DateTime? startDate;
  final DateTime? endDate;

  InviteParam(
      {this.start,
      this.end,
      this.startDate,
      this.endDate,
      this.date,
      this.name,
      this.code,
      this.community,
      this.member,
      this.photo,
      this.reason,
      this.type});
}
