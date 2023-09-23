import "package:flutter/material.dart";
import "package:flutter_gen/gen_l10n/dictionary.dart";

import "../colors.dart";
import "../display_sizes.dart";
import "../molecule/info_item.dart";

class CardCharacter extends StatelessWidget {
  const CardCharacter({
    required this.name,
    super.key,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kSpaceMarginDefault),
      decoration: BoxDecoration(
        color: kColorCharacterBackground,
        borderRadius: BorderRadius.circular(kRadiusDefault),
      ),
      child: InfoItem(label: AppLocalizations.of(context)!.name, value: name),
    );
  }
}
