import "package:dio/dio.dart";
import "package:freezed_annotation/freezed_annotation.dart";
import "package:swapiinfo/error/custom_exception.dart";
import "package:swapiinfo/error/custom_exception_type.dart";
import "package:swapiinfo/logger/logger.dart";

// Single source of exception handling
extension StreamExt<T> on Stream<T> {
  Stream<T> handleGenericError(void Function(CustomException) onError) {
    return handleError((Object err, StackTrace stacktrace) {
      if (err is FormatException) {
        final CustomException error = CustomException(
            type: CustomExceptionType.runtime, message: err.message);
        Logger.get().error(error);
        onError.call(error);
        return error;
      }
      if (err is MissingRequiredKeysException) {
        final CustomException error = CustomException(
            type: CustomExceptionType.runtime, message: err.message);
        Logger.get().error(error);
        onError.call(error);
        return error;
      }

      if (err is NoSuchMethodError) {
        final CustomException error =
            CustomException(type: CustomExceptionType.runtime);
        Logger.get().error(error);
        onError.call(error);
        return error;
      }
      if (err is TypeError) {
        final CustomException error =
            CustomException(type: CustomExceptionType.runtime);
        Logger.get().error(error);
        onError.call(error);
        return error;
      }

      if (err is DioException) {
        switch (err.type) {
          case DioExceptionType.connectionTimeout:
          case DioExceptionType.badCertificate:
          case DioExceptionType.connectionError:
          case DioExceptionType.sendTimeout:
          case DioExceptionType.receiveTimeout:
          case DioExceptionType.cancel:
            onError.call(CustomException(
                type: CustomExceptionType.api, message: err.message ?? ""));
            return err;
          case DioExceptionType.badResponse:
            if (_containsResponseData(err.response)) {
              final String message;
              if (err.response!.data is String) {
                message = err.response!.data as String;
              } else {
                message = err.response!.data.toString();
              }
              onError.call(CustomException(
                  type: CustomExceptionType.api, message: message));
              return err;
            }

            onError.call(CustomException(
                type: CustomExceptionType.api, message: err.message ?? ""));
            return err;
          case DioExceptionType.unknown:
          default:
            onError.call(CustomException(
                type: CustomExceptionType.unknown, message: err.message ?? ""));
            return err;
        }
      }

      onError.call(CustomException(type: CustomExceptionType.unknown));
      return err;
    });
  }

  bool _containsResponseData(Response<dynamic>? response) {
    return response != null &&
        response.statusCode != null &&
        response.data != null;
  }
}
