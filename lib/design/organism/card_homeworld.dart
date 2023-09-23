import "package:flutter/material.dart";
import "package:flutter_gen/gen_l10n/dictionary.dart";
import "package:swapiinfo/design/colors.dart";
import "package:swapiinfo/design/display_sizes.dart";
import "package:swapiinfo/design/molecule/info_item.dart";

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
