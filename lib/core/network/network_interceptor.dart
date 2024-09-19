import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/library/community/data/data_source/community_local_datasource.dart';
import 'package:tenaid_mobile/library/core/domain/cache.dart';

import '../../feature/account/account_navigator.dart';
import '../../library/account/data/data_source/account_local_datasource.dart';

@injectable
class NetworkInterceptor extends Interceptor {
  final Cache cache;
  final AccountLocalDataSource accountLocalDataSource = GetIt.instance.get();
  final CommunityLocalDataSource communityLocalDataSource =
      GetIt.instance.get();
  final AccountNavigator accountNavigator = GetIt.instance.get();

  NetworkInterceptor(this.cache);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      await accountLocalDataSource.reset();
      await communityLocalDataSource.reset();
      await accountNavigator.toLogin();
    }
    super.onError(err, handler);
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    String token = await cache.getString(PREF_AUTHORIZATION_, "");

    options.headers.addAll({
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'platform': Platform.isAndroid ? 'android' : 'ios',
      'Authorization': 'Bearer ${token.trim()}'
    });

    options.receiveTimeout = const Duration(seconds: 10);
    options.sendTimeout = const Duration(seconds: 10);

    return super.onRequest(options, handler);
  }
}
