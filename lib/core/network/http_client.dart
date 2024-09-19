import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../env/config.dart';
import '../../library/core/domain/cache.dart';
import 'network_interceptor.dart';

final logger = PrettyDioLogger(
    requestHeader: true,
    requestBody: true,
    responseBody: true,
    responseHeader: true,
    compact: false);

Dio dioClient(Cache cache) {
  Dio dio = Dio(BaseOptions(baseUrl: Config.shared.baseUrl));
  cache.set(PREF_BASE_URL_, Config.shared.baseUrl);

  MemCacheStore cacheStore =
      MemCacheStore(maxSize: 10485760, maxEntrySize: 1048576);
  CacheOptions cacheOptions = CacheOptions(
    store: cacheStore,
    priority: CachePriority.high,
    maxStale: const Duration(minutes: 10),
    policy: CachePolicy.request,
    hitCacheOnErrorExcept: const [403, 401], // for offline behaviour
  );

  dio.interceptors.add(DioCacheInterceptor(options: cacheOptions));
  dio.interceptors.add(NetworkInterceptor(cache));

  if (Config.shared.flavor == Flavor.development) {
    dio.interceptors.add(logger);
  }

  return dio;
}
