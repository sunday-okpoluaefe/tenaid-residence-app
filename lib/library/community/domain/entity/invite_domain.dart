import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:tenaid_mobile/feature/visitor/invite_visitor/bloc/invite_visitor_screen_bloc.dart';
import 'package:tenaid_mobile/library/community/domain/entity/account_community_domain.dart';

part 'invite_domain.g.dart';

@CopyWith(skipFields: true)
class InviteDomain {
  final AccountCommunityDomain community;
  final String code;
  final String name;
  final bool exitOnly;
  final String? purpose;
  final DateTime startDate;
  final DateTime endDate;
  final String status;
  final InviteType type;

  InviteDomain(
      {required this.community,
      required this.code,
      required this.exitOnly,
      required this.type,
      required this.name,
      required this.purpose,
      required this.startDate,
      required this.endDate,
      required this.status});
}
