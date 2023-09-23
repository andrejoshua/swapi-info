import "package:flutter/cupertino.dart";
import "package:flutter_gen/gen_l10n/dictionary.dart";
import "package:swapiinfo/error/custom_exception_type.dart";

extension CustomExceptionTypeExt on CustomExceptionType {
  String getActualMessage(BuildContext context, String? message) {
    switch (this) {
      case CustomExceptionType.api:
        return message ?? AppLocalizations.of(context)!.unknown_error;
      case CustomExceptionType.runtime:
        return AppLocalizations.of(context)!.runtime_error;
      case CustomExceptionType.unknown:
        return AppLocalizations.of(context)!.unknown_error;
    }
  }
}
