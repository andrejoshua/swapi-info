import "dart:io";

import "package:dio/dio.dart";
import "package:dio_cache_interceptor/dio_cache_interceptor.dart";
import "package:dio_cache_interceptor_file_store/dio_cache_interceptor_file_store.dart";
import "package:flutter/foundation.dart";
import "package:injectable/injectable.dart";
import "package:path_provider/path_provider.dart";

import "constants.dart";
import "status_code_ext.dart";

@module
abstract class ApiPreModule {
  @preResolve
  @Named(kScopeTemporaryDir)
  Future<String> getCacheDirectoryPath() {
    return getTemporaryDirectory().then((Directory value) => value.path);
  }

  @injectable
  DioCacheInterceptor getCacheInterceptor(
      @Named(kScopeTemporaryDir) String cacheDirectoryPath) {
    // Global options
    final CacheOptions options = CacheOptions(
      // Uses file cache store, since the cache makes more sense to be saved in temporary storage
      // There is another option, using MemCacheStore, but it's saved on runtime, which will be wiped out once the app is terminated
      store: FileCacheStore(cacheDirectoryPath),
      // Standard policy
      policy: CachePolicy.request,
      // Overrides any HTTP directive to delete entry past this duration.
      // Useful only when origin server has no cache config or custom behaviour is desired.
      maxStale: const Duration(days: 7),
      // Allows 3 cache sets and ease cleanup.
      priority: CachePriority.normal,
      // Body and headers encryption with your own algorithm.
      cipher: null,
      // Key builder to retrieve requests.
      keyBuilder: CacheOptions.defaultCacheKeyBuilder,
      // Allows to cache POST requests.
      // Overriding [keyBuilder] is strongly recommended when [true].
      allowPostMethod: false,
    );
    return DioCacheInterceptor(options: options);
  }

  @lazySingleton
  Dio getDio(DioCacheInterceptor cacheInterceptor) {
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
    dio.interceptors.add(cacheInterceptor);

    if (kDebugMode) {
      dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
    }

    return dio;
  }
}
