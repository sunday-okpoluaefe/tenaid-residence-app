import 'package:dio/dio.dart';

class ApiErrorParser {
  static ApiException parse(data) {
    if (data is DioException) {
      switch (data.type) {
        case DioExceptionType.connectionError:
        case DioExceptionType.sendTimeout:
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
          return NetworkError();
        case DioExceptionType.badResponse:
          return ApiError(message: data.response?.data['message'] ?? "");

        default:
          return UnKnownError();
      }
    } else {
      return NetworkError();
    }
  }
}

abstract class ApiException implements Exception {
  final String? message;

  ApiException({this.message});

  @override
  String toString() => message ?? "";
}

class NetworkError extends ApiException {
  NetworkError({super.message});
}

class UnKnownError extends ApiException {
  UnKnownError();
}

class ApiError extends ApiException {
  ApiError({super.message});
}
