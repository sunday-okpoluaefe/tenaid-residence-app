import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/account/data/model/account.dart';
import 'package:tenaid_mobile/library/account/domain/entity/account_type_domain.dart';
import 'package:tenaid_mobile/library/account/domain/entity/address_domain.dart';
import 'package:tenaid_mobile/library/account/domain/entity/dashboard_flag_domain.dart';
import 'package:tenaid_mobile/library/account/domain/entity/email_domain.dart';
import 'package:tenaid_mobile/library/account/domain/entity/kyc.domain.dart';
import 'package:tenaid_mobile/utils/mapper.dart';

import '../../domain/entity/account_domain.dart';

@injectable
class AccountToDomainMapper implements Mapper<Account, AccountDomain> {
  @override
  AccountDomain map(Account from) => AccountDomain(
      id: from.id,
      country: from.country,
      lastName: from.lastName,
      firstName: from.firstName,
      kycCompleted: from.kycCompleted,
      primaryAccountType: from.primaryAccountType,
      accountTypes: from.accountTypes
          ?.map((t) => AccountTypeDomain(type: t.type, approved: t.approved))
          .toList(),
      phone: from.phone,
      photo: from.photo,
      dob: from.dob,
      flags: DashboardFlagDomain(
          welcome: from.flags?.welcome,
          joinCommunity: from.flags?.joinCommunity,
          createCommunity: from.flags?.createCommunity,
          quickActions: from.flags?.quickActions),
      proofOfId: from.proofOfId,
      email:
          EmailDomain(value: from.email?.value, verified: from.email?.verified),
      address: AddressDomain(
          address: from.address?.address,
          city: from.address?.city,
          country: from.address?.country,
          postalCode: from.address?.postalCode,
          proofOfAddress: from.address?.proofOfAddress),
      kyc: KycDomain(
          profileCompleted: from.kyc?.profileCompleted,
          addressCompleted: from.kyc?.addressCompleted,
          bankingCompleted: from.kyc?.bankingCompleted));
}
