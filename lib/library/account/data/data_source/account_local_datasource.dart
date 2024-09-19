import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/account/data/model/account.dart';
import 'package:tenaid_mobile/library/core/domain/cache.dart';

@injectable
class AccountLocalDataSource {
  final Cache cache;

  AccountLocalDataSource(this.cache);

  Future<Account> getAccount() async {
    final String data = await cache.getString(PREF_ACCOUNT_DETAILS, '');
    return Account.fromJson(jsonDecode(data));
  }

  Future<void> saveAccount(Account account) async {
    await cache.set(PREF_ACCOUNT_DETAILS, jsonEncode(account.toJson()));
  }

  Future<void> saveAuthorization(String token) async {
    await cache.set(PREF_AUTHORIZATION_, token);
  }

  Future<String> getAuthorization() async {
    return await cache.getString(PREF_AUTHORIZATION_, "");
  }

  Future<void> reset() async {
    return await cache.reset();
  }
}
