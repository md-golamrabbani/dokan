import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dokan/app/config/url.dart';
import 'package:dokan/app/controllers/app_controller.dart';
import 'package:dokan/app/exceptions/api_exception.dart';
import 'package:dokan/app/services/connectivity_service.dart';
import 'package:dokan/utils/snakbar.dart';
import 'package:flutter/foundation.dart';

class API {
  static final _options = BaseOptions(
    baseUrl: URL.baseURL,
    connectTimeout: URL.connectionTimeout,
    receiveTimeout: URL.receiveTimeout,
    responseType: ResponseType.json,
  );

  // dio instance
  static final Dio _dio = Dio(_options)..interceptors.add(LogInterceptor());

  // GET request
  static Future get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    // final token = await Authentication.fcmToken();
    try {
      if (await ConnectivityServices.check()) {
        final Response response = await _dio.get(
          url,
          queryParameters: queryParameters,
          options: Options(
            headers: {
              "Content-Type": "application/x-www-form-urlencoded",
              // "Authorization": "Bearer $token",
            },
          ),
          cancelToken: cancelToken,
          onReceiveProgress: onReceiveProgress,
        );
        if (kDebugMode) {
          print("----------------GET Response----------------");
          print(json.decode(response.data));
          print("----------------GET Response----------------");
        }
        return json.decode(response.data);
      } else {
        SnackBars.showErrorSnackbar(
          text: 'Connection error!',
        );
      }
    } on DioException catch (e) {
      if (AppController.isLoading.value) {
        AppController.loaderDismiss();
      }
      SnackBars.showErrorSnackbar(
        text: ApiException.fromDioError(e),
      );
    }
  }

  // POST request
  static Future post(
    String url, {
    dynamic data,
    isLoading = true,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    // final token = await Authentication.fcmToken();
    try {
      if (await ConnectivityServices.check()) {
        if (isLoading) {
          AppController.loaderShow();
        }
        final Response response = await _dio.post(
          url,
          data: data,
          options: Options(
            headers: {
              "Content-Type": "application/x-www-form-urlencoded",
            },
          ),
          cancelToken: cancelToken,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress,
        );
        if (kDebugMode) {
          print("----------------POST Response----------------");
          print(json.decode(response.data));
          print("----------------POST Response----------------");
        }
        if (isLoading) {
          AppController.loaderDismiss();
        }
        return json.decode(response.data);
      } else {
        if (AppController.isLoading.value) {
          AppController.loaderDismiss();
        }
        SnackBars.showErrorSnackbar(
          text: 'Connection error!',
        );
      }
    } on DioException catch (e) {
      if (AppController.isLoading.value) {
        AppController.loaderDismiss();
      }
      SnackBars.showErrorSnackbar(
        text: ApiException.fromDioError(e),
      );
    }
  }

  // PUT request
  static Future put(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on DioException catch (e) {
      if (AppController.isLoading.value) {
        AppController.loaderDismiss();
      }
      SnackBars.showErrorSnackbar(
        text: ApiException.fromDioError(e),
      );
    }
  }

  // DELETE request
  static Future delete(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on DioException catch (e) {
      if (AppController.isLoading.value) {
        AppController.loaderDismiss();
      }
      SnackBars.showErrorSnackbar(
        text: ApiException.fromDioError(e),
      );
    }
  }
}
