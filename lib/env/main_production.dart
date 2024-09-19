import 'package:flutter/material.dart';

import '../app.dart';
import 'config.dart';

// baseUrl
const _baseUrl = "https://www.bv-tenaid.ieapis.com/v1/";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Config.create(baseUrl: _baseUrl, webBaseUrl: "", appName: "Tenaid");

  await run();
}
