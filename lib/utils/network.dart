import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';

class NetworkUtil {
  static Future<bool> hasConnectivity() async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    return (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.vpn));
  }
}

ValueNotifier<bool> networkNotifier = ValueNotifier<bool>(false);

void setupNetworkNotifier() {
  Connectivity()
      .onConnectivityChanged
      .listen((List<ConnectivityResult> result) {
    networkNotifier.value = result.contains(ConnectivityResult.wifi) ||
        result.contains(ConnectivityResult.mobile) ||
        result.contains(ConnectivityResult.vpn);
  });
}
