import "package:dio/dio.dart";
import "package:flutter/foundation.dart";
import "package:injectable/injectable.dart";

import "constants.dart";
import "status_code_ext.dart";

@module
abstract class ApiPreModule {

  @injectable
  Dio getDio() {
    final BaseOptions options = BaseOptions(
      baseUrl: kBaseUrl,
      followRedirects: false,
      validateStatus: (int? status) => status.isSuccess,
      contentType: "application/json; charset=utf-8",
      connectTimeout: kDefaultConnectTimeout,
      receiveTimeout: kDefaultReceiveTimeout,
      sendTimeout: kDefaultSendTimeout,
    );
    final Dio dio = Dio(options);

    if (kDebugMode) {
      dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
    }

    return dio;
  }
}
