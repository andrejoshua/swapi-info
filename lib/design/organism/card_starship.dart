import "package:flutter/material.dart";
import "package:flutter_gen/gen_l10n/dictionary.dart";
import "package:swapiinfo/design/colors.dart";
import "package:swapiinfo/design/display_sizes.dart";
import "package:swapiinfo/design/molecule/info_item.dart";

class CardStarship extends StatelessWidget {
  const CardStarship({
    required this.model,
    required this.starshipClass,
    required this.hyperdriveRating,
    required this.costInCredits,
    required this.manufacturer,
    super.key,
  });

  final String model;
  final String starshipClass;
  final String hyperdriveRating;
  final String costInCredits;
  final String manufacturer;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kSpaceMarginDefault),
      decoration: BoxDecoration(
        color: kColorStarshipBackground,
        borderRadius: BorderRadius.circular(kRadiusDefault),
      ),
      child: Column(
        children: <Widget>[
          Text(
            AppLocalizations.of(context)!.starship,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(
            height: kSpaceMarginMedium,
          ),
          InfoItem(label: AppLocalizations.of(context)!.model, value: model),
          const SizedBox(
            height: kSpaceMarginMedium,
          ),
          InfoItem(
              label: AppLocalizations.of(context)!.model_class,
              value: starshipClass),
          const SizedBox(
            height: kSpaceMarginMedium,
          ),
          InfoItem(
              label: AppLocalizations.of(context)!.hyperdrive_rating,
              value: hyperdriveRating),
          const SizedBox(
            height: kSpaceMarginMedium,
          ),
          InfoItem(
              label: AppLocalizations.of(context)!.cost_in_credits,
              value: costInCredits),
          const SizedBox(
            height: kSpaceMarginMedium,
          ),
          InfoItem(
              label: AppLocalizations.of(context)!.manufacturer,
              value: manufacturer),
        ],
      ),
    );
  }
}
