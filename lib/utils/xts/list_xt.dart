import 'package:tenaid_mobile/library/community/data/model/account_community.dart';
import 'package:tenaid_mobile/library/community/domain/entity/account_community_domain.dart';

extension ListXt on List<AccountCommunityDomain>? {
  AccountCommunityDomain? get pendingJoin {
    if (this?.isNotEmpty != true) return null;
    return this
        ?.firstOrNullWhere((d) => d.status == 'pending' && d.isAdmin == false);
  }

  AccountCommunityDomain? get primary {
    if (this?.isNotEmpty != true) return null;

    AccountCommunityDomain? priority = this?.firstOrNullWhere(
        (d) => d.isPrimary == true && d.status == 'approved');

    if (priority != null) return priority;

    return this?.firstOrNullWhere((d) => d.status == 'pending');
  }

  AccountCommunityDomain? get active {
    if (this?.isNotEmpty != true) return null;

    return this?.firstOrNullWhere(
        (d) => d.isPrimary == true && d.status == 'approved');
  }

  AccountCommunityDomain? get pendingCreate {
    if (this?.isNotEmpty != true) return null;
    return this
        ?.firstOrNullWhere((d) => d.status == 'pending' && d.isAdmin == true);
  }
}

extension AccountCommunityExt on List<AccountCommunity> {
  AccountCommunity? get active {
    if (isNotEmpty != true) return null;

    return firstOrNullWhere(
        (d) => d.isPrimary == true && d.status == 'approved');
  }
}

extension ListExt<T> on List<T>? {
  T? firstOrNullWhere(bool Function(T element) test) {
    if (this == null || this!.isEmpty) return null;

    for (T element in this!) {
      if (test(element)) return element;
    }

    return null;
  }
}
