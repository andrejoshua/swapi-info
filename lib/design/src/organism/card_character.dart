import "package:flutter/material.dart";
import "package:flutter_gen/gen_l10n/dictionary.dart";

import "../colors.dart";
import "../display_sizes.dart";
import "../molecule/info_item.dart";

/// Reusable [CardCharacter] item
/// Requires [name] to show the name of the character
/// All values are mandatory
class CardCharacter extends StatelessWidget {
  const CardCharacter({
    required this.name,
    this.onClick,
    super.key,
  });

  final String name;
  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onClick?.call();
      },
      child: Container(
        padding: const EdgeInsets.all(kSpaceMarginDefault),
        decoration: BoxDecoration(
          color: kColorCharacterBackground,
          borderRadius: BorderRadius.circular(kRadiusDefault),
        ),
        child: InfoItem(label: AppLocalizations.of(context)!.name, value: name),
      ),
    );
  }
}
