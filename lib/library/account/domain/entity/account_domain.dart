import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:tenaid_mobile/library/account/domain/entity/account_type_domain.dart';
import 'package:tenaid_mobile/library/account/domain/entity/dashboard_flag_domain.dart';
import 'package:tenaid_mobile/library/account/domain/entity/kyc.domain.dart';

import 'address_domain.dart';
import 'email_domain.dart';

part 'account_domain.g.dart';

@CopyWith(skipFields: true)
class AccountDomain {
  final String? id;
  final String? lastName;
  final String? firstName;
  final String? country;
  final EmailDomain? email;
  final AddressDomain? address;
  final KycDomain? kyc;
  final String? primaryAccountType;
  final List<AccountTypeDomain>? accountTypes;
  final bool? kycCompleted;
  final String? phone;
  final DashboardFlagDomain? flags;
  final String? photo;
  final String? dob;
  final String? proofOfId;

  AccountDomain(
      {this.id,
      this.lastName,
      this.flags,
      this.firstName,
      this.country,
      this.email,
      this.address,
      this.kyc,
      this.primaryAccountType,
      this.accountTypes,
      this.kycCompleted,
      this.phone,
      this.photo,
      this.dob,
      this.proofOfId});
}
