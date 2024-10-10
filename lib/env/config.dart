enum Flavor { development, production }

class Config {
  String appName = "";
  String baseUrl = "";
  String baseSocketUrl = "";
  String webBaseUrl = "";
  Flavor flavor = Flavor.development;

  static Config shared = Config.create();

  factory Config.create(
      {String baseUrl = "",
      String appName = "",
      String webBaseUrl = "",
      String baseSocketUrl = "",
      Flavor flavor = Flavor.development}) {
    return shared = Config(
        appName: appName,
        baseSocketUrl: baseSocketUrl,
        flavor: flavor,
        webBaseUrl: webBaseUrl,
        baseUrl: baseUrl);
  }

  Config(
      {required this.flavor,
      required this.webBaseUrl,
      required this.baseUrl,
      required this.baseSocketUrl,
      required this.appName});
}
