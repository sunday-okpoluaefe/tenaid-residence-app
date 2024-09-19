import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/utils/xts/string.xts.dart';

import '../domain/cache.dart';

@Injectable(as: Cache)
class LocalCache implements Cache {
  FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  @override
  Future<void> set(String key, Object value) {
    return secureStorage.write(key: key, value: value.toString());
  }

  @override
  Future<void> delete(String key) async => await secureStorage.delete(key: key);

  @override
  Future<void> reset() => secureStorage.deleteAll();

  @override
  Future<int> getInt(String key, int def) async {
    String? res = await secureStorage.read(key: key);
    if (res == null) return def;

    return res.isDigits ? int.parse(res) : def;
  }

  @override
  Future<String> getString(String key, String def) async {
    String? res = await secureStorage.read(key: key);
    return res ?? def;
  }

  @override
  Future<bool> getBool(String key, bool def) async {
    String? res = await secureStorage.read(key: key);
    if (res == null) return def;

    if (res.isBoolean) {
      return res.toLowerCase() == 'true' ? true : false;
    } else {
      return def;
    }
  }

  @override
  Future<double> getDouble(String key, double def) async {
    String? res = await secureStorage.read(key: key);
    if (res == null) return def;

    return res.isDigits ? double.parse(res) : def;
  }
}
