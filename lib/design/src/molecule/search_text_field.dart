import "package:flutter/material.dart";
import "package:flutter_gen/gen_l10n/dictionary.dart";

import "../colors.dart";
import "../display_sizes.dart";

/// [TextField] specialized for standard input types.
/// For phone input, please refer to [UVPhoneTextField].
class SearchTextField extends StatelessWidget {
  const SearchTextField({
    this.focusNode,
    this.onChanged,
    Key? key,
  }) : super(key: key);

  /// Defaults to null, [focusNode] is used input focus.
  final FocusNode? focusNode;

  /// Callback for every text field input
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Container(
        decoration: BoxDecoration(
          color: kColorBackground,
          borderRadius: const BorderRadius.all(
            Radius.circular(kRadiusSearch),
          ),
          border: Border.all(color: kColorText),
        ),
        alignment: Alignment.centerLeft,
        child: TextField(
          textAlignVertical: TextAlignVertical.top,
          focusNode: focusNode,
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.text,
          obscureText: false,
          enableSuggestions: false,
          autocorrect: false,
          readOnly: false,
          maxLines: 1,
          minLines: 1,
          onChanged: onChanged,
          style: Theme.of(context).textTheme.bodySmall,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(
              kSpaceMarginDefault,
            ),
            border: InputBorder.none,
            hintText: AppLocalizations.of(context)!.placeholder_search,
            hintStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontStyle: FontStyle.italic,
                  color: kColorDarkGray,
                ),
            hintMaxLines: 1,
          ),
        ),
      ),
    );
  }
}
