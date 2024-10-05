import 'dart:io';

import 'package:dio/dio.dart';
import 'package:tenaid_mobile/library/core/data/local_cache.dart';
import 'package:uuid/uuid.dart';
import 'package:workmanager/workmanager.dart';

import '../library/core/domain/cache.dart';

String uniqueId() => Uuid().v4();

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    LocalCache cache = LocalCache();
    String baseUrl = await cache.getString(PREF_BASE_URL_, "");
    String token = await cache.getString(PREF_AUTHORIZATION_, "");

    // setup dio - no DI here
    Dio dio = Dio(BaseOptions(baseUrl: baseUrl, headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'platform': Platform.isAndroid ? 'android' : 'ios',
      'Authorization': 'Bearer ${token.trim()}'
    }));

    String path = inputData != null ? inputData['path'] : '';

    try {
      await dio.post(path, data: inputData);
      return Future.value(true);
    } catch (_) {
      // manual schedule for IOS
      return Future.value(false);
    }
  });
}

Future<void> registerInviteWorker({required Map<String, dynamic> data}) async =>
    Workmanager().registerOneOffTask(
        uniqueId(), 'invite-data-sync - ${uniqueId()}',
        inputData: data,
        constraints: Constraints(networkType: NetworkType.connected));
