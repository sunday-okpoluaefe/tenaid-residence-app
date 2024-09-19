import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:tenaid_mobile/core/network/api_error_parser.dart';
import 'package:tenaid_mobile/core/network/http_client.dart';
import 'package:tenaid_mobile/library/core/domain/cache.dart';

import 'network_response.dart';

enum RequestType { get, post, put, patch, delete }

@Singleton()
class Api {
  late Dio _dio;

  Api(Cache cache) {
    _dio = dioClient(cache);
  }

  Future<NetworkResponse> call(
      {required String url,
      required RequestType requestType,
      Map<String, dynamic>? params,
      Object? body}) async {
    try {
      late Response response;
      switch (requestType) {
        case RequestType.get:
          response = await _dio.get(url, queryParameters: params);
        case RequestType.post:
          response = await _dio.post(url, queryParameters: params, data: body);
        case RequestType.put:
          response = await _dio.put(url, queryParameters: params, data: body);
        case RequestType.patch:
          response = await _dio.patch(url, queryParameters: params, data: body);
        case RequestType.delete:
          response =
              await _dio.delete(url, queryParameters: params, data: body);
      }

      return NetworkResponse.fromJson(response.data);
    } catch (error) {
      throw ApiErrorParser.parse(error);
    }
  }
}
