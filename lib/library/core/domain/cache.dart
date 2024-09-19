const String PREF_AUTHORIZATION_ = "PREF_AUTHORIZATION_";
const String PREF_JOIN_REQUEST_COMMUNITY_ = "PREF_JOIN_REQUEST_COMMUNITY_";
const String PREF_CREATE_REQUEST_COMMUNITY_ = "PREF_CREATE_REQUEST_COMMUNITY_";
const String PREF_SYNC_COMPLETED_ = "PREF_SYNC_COMPLETED_";
const String PREF_ACCOUNT_DETAILS = "PREF_ACCOUNT_DETAILS";
const String PREF_PRIMARY_ACCOUNT_COMMUNITY = "PREF_PRIMARY_ACCOUNT_COMMUNITY";
const String PREF_ONBOARDING = "PREF_ONBOARDING";
const String PREF_BASE_URL_ = "PREF_BASE_URL_";

abstract class Cache {
  Future<void> set(String key, Object value);

  Future<void> delete(String key);

  Future<void> reset();

  Future<int> getInt(String key, int def);

  Future<String> getString(String key, String def);

  Future<bool> getBool(String key, bool def);

  Future<double> getDouble(String key, double def);
}
