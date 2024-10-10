import 'package:flutter/cupertino.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:tenaid_mobile/env/config.dart';

late final InternetConnection internetConnection;

class NetworkUtil {
  static Future<bool> hasConnectivity() async =>
      await internetConnection.hasInternetAccess;
}

ValueNotifier<bool> networkNotifier = ValueNotifier<bool>(false);

void setupNetworkNotifier() {
  internetConnection = InternetConnection.createInstance(
    customCheckOptions: [
      InternetCheckOption(
          uri: Uri.parse('${Config.shared.baseUrl}health/status')),
    ],
  );

  internetConnection.onStatusChange.listen((InternetStatus status) {
    networkNotifier.value = status == InternetStatus.connected;
  });
}
