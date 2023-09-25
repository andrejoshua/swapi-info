import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter/scheduler.dart";
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
  final GlobalKey<AutoRouterState> innerKey = GlobalKey<AutoRouterState>();
  final CharacterDetailViewModel _vm = getIt<CharacterDetailViewModel>();

  @override
  void initState() {
    super.initState();

    _vm.setCallbacks(_showLoading, _hideLoading, _showError);
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: kSpaceMarginDefault),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void dispose() {
    _vm.destroy();
    super.dispose();
  }

  Widget _nameSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpaceMarginDefault),
      child: Observer(builder: (_) {
        return InfoItem(
            label: AppLocalizations.of(context)!.name, value: _vm.name);
      }),
    );
  }

  Widget _genderSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpaceMarginDefault),
      child: Observer(builder: (_) {
        return InfoItem(
            label: AppLocalizations.of(context)!.gender, value: _vm.gender);
      }),
    );
  }

  Widget _starshipSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kSpaceMarginDefault),
          child: Text(
            AppLocalizations.of(context)!.starship,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
        const SizedBox(
          height: kSpaceMarginSmall,
        ),
        Observer(builder: (_) {
          return Visibility(
            visible: _vm.starships.isNotEmpty,
            replacement: const Padding(
              padding: EdgeInsets.symmetric(horizontal: kSpaceMarginDefault),
              child: EmptyWidget(),
            ),
            child: LimitedBox(
              maxHeight: kSizeStarshipMax,
              child: ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: kSpaceMarginDefault),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
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
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  width: kSpaceMarginDefault,
                ),
              ),
            ),
          );
        })
      ],
    );
  }

  Widget _vehicleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kSpaceMarginDefault),
          child: Text(
            AppLocalizations.of(context)!.vehicle,
            style: Theme.of(context).textTheme.labelSmall,
          ),
        ),
        const SizedBox(
          height: kSpaceMarginSmall,
        ),
        Observer(builder: (_) {
          return Visibility(
            visible: _vm.vehicles.isNotEmpty,
            replacement: const Padding(
              padding: EdgeInsets.symmetric(horizontal: kSpaceMarginDefault),
              child: EmptyWidget(),
            ),
            child: LimitedBox(
              maxHeight: kSizeVehicleMax,
              child: ListView.separated(
                padding:
                    const EdgeInsets.symmetric(horizontal: kSpaceMarginDefault),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: _vm.vehicles.length,
                itemBuilder: (BuildContext context, int index) {
                  final Vehicle vehicle = _vm.vehicles[index];
                  return CardVehicle(
                      name: vehicle.name,
                      model: vehicle.model,
                      costInCredits:
                          _getCostInCreditsValue(vehicle.costInCredits));
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  width: kSpaceMarginDefault,
                ),
              ),
            ),
          );
        })
      ],
    );
  }

  Widget _homeworldSection() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kSpaceMarginDefault),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            AppLocalizations.of(context)!.homeworld,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          const SizedBox(
            height: kSpaceMarginSmall,
          ),
          Observer(builder: (_) {
            final Homeworld? homeworld = _vm.homeworld;
            return VisibilityDashWidget(
              isVisible: _vm.homeworld != null,
              contentWidget: SizedBox(
                width: double.infinity,
                child: CardHomeworld(
                    name: homeworld?.name ?? "",
                    population: homeworld?.population.toString() ?? "",
                    climate: homeworld?.climate ?? ""),
              ),
            );
          })
        ],
      ),
    );
  }

  String _getCostInCreditsValue(int? costInCredits) {
    return costInCredits?.toString() ?? AppLocalizations.of(context)!.unknown;
  }

  // Show loading, hide loading, and show error functions
  // Flutter & AutoRoute is still incapable of using GlobalKey
  // Also scheduler binding needs to be added in each screen
  // So in order to show modal, we need to use widget context
  void _showLoading() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (AutoRouter.of(context).navigatorKey.currentContext != null) {
        Loading.show(AutoRouter.of(context).navigatorKey.currentContext!);
      }
    });
  }

  void _hideLoading() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (AutoRouter.of(context).navigatorKey.currentContext != null) {
        Loading.dismiss(AutoRouter.of(context).navigatorKey.currentContext!);
      }
    });
  }

  void _showError(CustomExceptionType type, String? message) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (AutoRouter.of(context).navigatorKey.currentContext != null) {
        final BuildContext functionContext =
            AutoRouter.of(context).navigatorKey.currentContext!;
        Loading.dismiss(functionContext);
        Error.show(functionContext,
            message: type.getActualMessage(functionContext, message));
      }
    });
  }
}
