import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_gen/gen_l10n/dictionary.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:swapiinfo/design/design.dart";
import "package:swapiinfo/di.dart";
import "package:swapiinfo/domain/models/homeworld.dart";
import "package:swapiinfo/domain/models/starship.dart";
import "package:swapiinfo/domain/models/vehicle.dart";
import "package:swapiinfo/error/custom_exception_type.dart";
import "package:swapiinfo/ui/character_detail/vm.dart";
import "package:swapiinfo/util/error_extensions.dart";

@RoutePage()
class CharacterDetailPage extends StatefulWidget {
  const CharacterDetailPage({required this.id, super.key});

  final String id;

  @override
  State<StatefulWidget> createState() => _CharacterDetailPageState();
}

class _CharacterDetailPageState extends State<CharacterDetailPage> {
  final CharacterDetailViewModel _vm = getIt<CharacterDetailViewModel>();
  final PageController _controller = PageController();

  @override
  void initState() {
    super.initState();

    _vm.setCallbacks(() {
      Loading.show(context);
    }, () {
      Loading.dismiss(context);
    }, (CustomExceptionType type, String? message) {
      Loading.dismiss(context);
      Error.show(context, message: type.getActualMessage(context, message));
    });

    _vm.load(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(AppLocalizations.of(context)!.character),
      ),
      body: Padding(
        padding: const EdgeInsets.all(kSpaceMarginDefault),
        child: Column(
          children: <Widget>[
            _nameSection(),
            const SizedBox(
              height: kSpaceMarginDefault,
            ),
            _genderSection(),
            const SizedBox(
              height: kSpaceMarginDefault,
            ),
            _starshipSection(),
            const SizedBox(
              height: kSpaceMarginDefault,
            ),
            _vehicleSection(),
            const SizedBox(
              height: kSpaceMarginDefault,
            ),
            _homeworldSection(),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _vm.destroy();
    super.dispose();
  }

  Widget _nameSection() {
    return Observer(builder: (_) {
      return InfoItem(
          label: AppLocalizations.of(context)!.name, value: _vm.name);
    });
  }

  Widget _genderSection() {
    return Observer(builder: (_) {
      return InfoItem(
          label: AppLocalizations.of(context)!.gender, value: _vm.gender);
    });
  }

  Widget _starshipSection() {
    return Column(
      children: <Widget>[
        Text(
          AppLocalizations.of(context)!.starship,
          style: Theme.of(context).textTheme.labelSmall,
        ),
        const SizedBox(
          height: kSpaceMarginSmall,
        ),
        Observer(builder: (_) {
          if (_vm.starships.isEmpty) {
            // TODO(Andre): Avoid using string if possible
            return Text(
              "-",
              style: Theme.of(context).textTheme.bodyLarge,
            );
          } else {
            return PageView.builder(
              controller: _controller,
              itemCount: _vm.starships.length,
              itemBuilder: (BuildContext context, int index) {
                final Starship starship = _vm.starships[index];
                return CardStarship(
                    model: starship.model,
                    starshipClass: starship.starshipClass,
                    hyperdriveRating: starship.hyperdriveRating.toString(),
                    costInCredits:
                        _getCostInCreditsValue(starship.costInCredits),
                    manufacturer: starship.manufacturer);
              },
            );
          }
        })
      ],
    );
  }

  Widget _vehicleSection() {
    return Column(
      children: <Widget>[
        Text(
          AppLocalizations.of(context)!.vehicle,
          style: Theme.of(context).textTheme.labelSmall,
        ),
        const SizedBox(
          height: kSpaceMarginSmall,
        ),
        Observer(builder: (_) {
          if (_vm.vehicles.isEmpty) {
            // TODO(Andre): Avoid using string if possible
            return Text(
              "-",
              style: Theme.of(context).textTheme.bodyLarge,
            );
          } else {
            return PageView.builder(
              controller: _controller,
              itemCount: _vm.vehicles.length,
              itemBuilder: (BuildContext context, int index) {
                final Vehicle vehicle = _vm.vehicles[index];
                return CardVehicle(
                    name: vehicle.name,
                    model: vehicle.model,
                    costInCredits:
                        _getCostInCreditsValue(vehicle.costInCredits));
              },
            );
          }
        })
      ],
    );
  }

  Widget _homeworldSection() {
    return Column(
      children: <Widget>[
        Text(
          AppLocalizations.of(context)!.homeworld,
          style: Theme.of(context).textTheme.labelSmall,
        ),
        const SizedBox(
          height: kSpaceMarginSmall,
        ),
        Observer(builder: (_) {
          if (_vm.homeworld != null) {
            // TODO(Andre): Avoid using string if possible
            return Text(
              "-",
              style: Theme.of(context).textTheme.bodyLarge,
            );
          } else {
            final Homeworld homeworld = _vm.homeworld!;
            return CardHomeworld(
                name: homeworld.name,
                population: homeworld.population.toString(),
                climate: homeworld.climate);
          }
        })
      ],
    );
  }

  String _getCostInCreditsValue(int? costInCredits) {
    return costInCredits?.toString() ?? AppLocalizations.of(context)!.unknown;
  }
}
