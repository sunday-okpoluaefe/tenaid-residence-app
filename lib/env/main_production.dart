import 'package:flutter/material.dart';

import '../app.dart';
import 'config.dart';

// baseUrl
const _baseUrl = "https://www.bv-tenaid.ieapis.com/v1/";
const _baseSocketUrl = "https://www.bv-tenaid.ieapis.com";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Config.create(
      baseUrl: _baseUrl,
      baseSocketUrl: _baseSocketUrl,
      webBaseUrl: "",
      appName: "Tenaid");

  await run();
}
