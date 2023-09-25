import "package:animated_text_kit/animated_text_kit.dart";
import "package:flutter/material.dart";
import "package:flutter_gen/gen_l10n/dictionary.dart";
import "package:swapiinfo/design/design.dart";
import "package:swapiinfo/design/src/constants.dart";

/// Loading section
/// Used to show Loading popup
class Loading {
  static BuildContext? _alertContext;
  static bool _isShowing = false;

  /// Showing default [Dialog] for information error.
  /// View [context] is mandatory to show the loading
  /// [isDismissible] is used to enforce loading to keep showing in order to lock user action while operation is running
  static void show(BuildContext context, {bool isDismissible = false}) {
    if (!_isShowing) {
      _isShowing = true;
      showDialog(
        context: context,
        barrierDismissible: isDismissible,
        builder: (BuildContext context) {
          _alertContext = context;
          return _buildLoadingDialog(context, isDismissible: isDismissible);
        },
      );
    }
  }

  /// Dismiss Dialog
  static void dismiss(BuildContext context) {
    final String? name = ModalRoute.of(context)?.settings.name;
    if (name != null) {
      Navigator.popUntil(context, ModalRoute.withName(name));
    } else {
      Navigator.pop(_alertContext!);
    }
    _alertContext = null;
    _isShowing = false;
  }

  static Widget _buildLoadingDialog(BuildContext context,
      {required bool isDismissible}) {
    return WillPopScope(
      onWillPop: () async {
        if (isDismissible) {
          return false;
        } else {
          Loading.dismiss(context);
          return true;
        }
      },
      child: Dialog(
        insetPadding: const EdgeInsets.symmetric(horizontal: kInsetLoading),
        backgroundColor: Colors.transparent,
        child: Container(
          height: kSizeLoading,
          width: kSizeLoading,
          decoration: BoxDecoration(
            color: kColorBackground,
            borderRadius: BorderRadius.circular(kRadiusLoading),
          ),
          child: Center(
            child: _buildLoadingContent(context),
          ),
        ),
      ),
    );
  }

  static Widget _buildLoadingContent(BuildContext context) {
    return AnimatedTextKit(
      animatedTexts: <AnimatedText>[
        TyperAnimatedText(
          AppLocalizations.of(context)!.loading,
          textStyle: Theme.of(context).textTheme.labelLarge,
          speed: kDurationAnimationSpeed,
        ),
      ],
      pause: kDurationAnimationPause,
      repeatForever: true,
    );
  }
}
