import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_gen/gen_l10n/dictionary.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:swapiinfo/design/design.dart";
import "package:swapiinfo/di.dart";
import "package:swapiinfo/domain/models/character.dart";
import "package:swapiinfo/error/custom_exception_type.dart";
import "package:swapiinfo/route/app_router.gr.dart";
import "package:swapiinfo/ui/characters/vm.dart";
import "package:swapiinfo/util/error_extensions.dart";

@RoutePage()
class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  @override
  State<StatefulWidget> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  final CharactersViewModel _vm = getIt<CharactersViewModel>();

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

    _vm.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(AppLocalizations.of(context)!.characters),
      ),
      body: Observer(
        builder: (_) {
          return ListView.separated(
            padding:
                const EdgeInsets.symmetric(horizontal: kSpaceMarginDefault),
            shrinkWrap: true,
            itemCount: _vm.allCharacters.length,
            itemBuilder: (BuildContext context, int index) {
              final Character character = _vm.allCharacters[index];
              return CardCharacter(
                name: character.name,
                onClick: () {
                  context.router.push(CharacterDetailRoute(id: character.id));
                },
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const SizedBox(
              height: kSpaceMarginDefault,
            ),
          );
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void dispose() {
    _vm.destroy();
    super.dispose();
  }
}
