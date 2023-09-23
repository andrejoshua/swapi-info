import "package:flutter/material.dart";
import "package:flutter_gen/gen_l10n/dictionary.dart";

import "../colors.dart";
import "../display_sizes.dart";
import "../molecule/info_item.dart";

/// Reusable [CardHomeworld] specifically built to show Homeworld data
/// Requires [name] to show homeworld name
/// Requires [population] to show homeworld population
/// Requires [climate] to show homeworld climate
/// All of those values are required, and does not affect any state of each labels
/// If there is an empty value, its own label will keep showing
class CardHomeworld extends StatelessWidget {
  const CardHomeworld({
    required this.name,
    required this.population,
    required this.climate,
    super.key,
  });

  final String name;
  final String population;
  final String climate;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kSpaceMarginDefault),
      decoration: BoxDecoration(
        color: kColorHomeworldBackground,
        borderRadius: BorderRadius.circular(kRadiusDefault),
      ),
      child: Column(
        children: <Widget>[
          Text(
            AppLocalizations.of(context)!.homeworld,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(
            height: kSpaceMarginMedium,
          ),
          InfoItem(label: AppLocalizations.of(context)!.name, value: name),
          const SizedBox(
            height: kSpaceMarginMedium,
          ),
          InfoItem(
              label: AppLocalizations.of(context)!.population,
              value: population),
          const SizedBox(
            height: kSpaceMarginMedium,
          ),
          InfoItem(
              label: AppLocalizations.of(context)!.climate, value: climate),
        ],
      ),
    );
  }
}
