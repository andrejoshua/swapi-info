import "package:flutter/material.dart";
import "package:flutter_gen/gen_l10n/dictionary.dart";
import "package:swapiinfo/design/design.dart";

class Error {
  static BuildContext? _dialogContext;

  /// Showing default [AlertDialog] for information error.
  /// Use [message] to show alert message.
  static void show(
    BuildContext context, {
    required String message,
    bool isDismissible = true,
  }) {
    final AlertDialog dialog = AlertDialog(
      title: Text(
        AppLocalizations.of(context)!.error,
        style: Theme.of(context).textTheme.displayMedium,
      ),
      content: Text(
        message,
        style: Theme.of(context).textTheme.bodyMedium,
        maxLines: 2,
      ),
      actionsAlignment: MainAxisAlignment.end,
      actions: <Widget>[
        TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(kColorText),
          ),
          onPressed: () {
            Error.dismiss();
          },
          child: Text(AppLocalizations.of(context)!.exit.toUpperCase()),
        ),
      ],
    );

    final Widget scope = WillPopScope(
      onWillPop: () async {
        if (isDismissible) {
          return false;
        } else {
          Error.dismiss();
          return true;
        }
      },
      child: dialog,
    );

    showDialog<void>(
      context: context,
      barrierDismissible: isDismissible,
      builder: (BuildContext context) {
        _dialogContext = context;
        return scope;
      },
    );
  }

  static void dismiss({BuildContext? context}) {
    _dialogContext != null
        ? Navigator.pop(_dialogContext!)
        : Navigator.pop(context!);
  }
}
