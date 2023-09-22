import "dart:convert";

import "package:dio/dio.dart";
import "package:injectable/injectable.dart";

/// API client bridge between API service and Dio
/// May be used by different API library (could be Dio/GraphQL)
@injectable
class ApiClient {
  final Dio _dio;

  ApiClient(this._dio);

  /// Request GET method
  /// [path] is URL path
  /// [queryParams] to set parameters in the URL as [Map], will be built in this function
  /// Returns map as Future function (to allow API implementation separation)
  Future<Map<String, dynamic>> get(
    String path, {
    Map<String, dynamic>? queryParams,
  }) {
    // Add additional function to throw if response value is null
    // May implement custom exception next
    return _dio.get<String>(path, queryParameters: queryParams).then(
        (Response<String> value) =>
            jsonDecode(value.data!) as Map<String, dynamic>);
  }
}
