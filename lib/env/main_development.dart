import 'package:flutter/material.dart';

import '../app.dart';
import 'config.dart';

// baseUrl
const _baseUrl = "http://192.168.1.181:4000/v1/";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Config.create(baseUrl: _baseUrl, webBaseUrl: "", appName: "Tenaid-Debug");

  await run();
}
