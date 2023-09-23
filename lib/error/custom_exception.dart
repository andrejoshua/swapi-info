import "package:swapiinfo/error/custom_exception_type.dart";

class CustomException implements Exception {
  final String message;
  final CustomExceptionType type;

  CustomException({
    required this.type,
    this.message = "",
  });
}
