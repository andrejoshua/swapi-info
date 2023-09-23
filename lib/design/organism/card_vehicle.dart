import "package:flutter/material.dart";
import "package:flutter_gen/gen_l10n/dictionary.dart";
import "package:swapiinfo/design/colors.dart";
import "package:swapiinfo/design/display_sizes.dart";
import "package:swapiinfo/design/molecule/info_item.dart";

class CardVehicle extends StatelessWidget {
  const CardVehicle({
    required this.name,
    required this.model,
    required this.costInCredits,
    super.key,
  });

  final String name;
  final String model;
  final String costInCredits;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kSpaceMarginDefault),
      decoration: BoxDecoration(
        color: kColorVehicleBackground,
        borderRadius: BorderRadius.circular(kRadiusDefault),
      ),
      child: Column(
        children: <Widget>[
          Text(
            AppLocalizations.of(context)!.vehicle,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(
            height: kSpaceMarginMedium,
          ),
          InfoItem(label: AppLocalizations.of(context)!.name, value: name),
          const SizedBox(
            height: kSpaceMarginMedium,
          ),
          InfoItem(label: AppLocalizations.of(context)!.model, value: model),
          const SizedBox(
            height: kSpaceMarginMedium,
          ),
          InfoItem(
              label: AppLocalizations.of(context)!.cost_in_credits,
              value: costInCredits),
        ],
      ),
    );
  }
}
