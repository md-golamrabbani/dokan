import 'package:dio/dio.dart';

class ApiException implements Exception {
  static String handleError(int? statusCode, dynamic error) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return error['error'];
      case 500:
        return 'Internal server error';
      case 502:
        return 'Bad gateway';
      default:
        return 'Oops something went wrong';
    }
  }

  static String fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timeout!';
      case DioExceptionType.sendTimeout:
        return 'Send timeout!';
      case DioExceptionType.receiveTimeout:
        return 'Receive timeout!';
      case DioExceptionType.badCertificate:
        return 'Bad certificate!';
      case DioExceptionType.badResponse:
        return 'Bad response!';
      case DioExceptionType.cancel:
        return 'Request cancelled!';
      case DioExceptionType.connectionError:
        return 'Connection error!';
      case DioExceptionType.unknown:
        return 'Unknown error!';
      default:
        return 'Unknown error!';
    }
  }
}
