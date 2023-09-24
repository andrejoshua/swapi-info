import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter/scheduler.dart";
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
  final FocusNode _searchNode = FocusNode();

  @override
  void initState() {
    super.initState();

    _vm.setCallbacks(_showLoading, _hideLoading, _showError);
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
      body: Padding(
        padding: const EdgeInsets.only(
            left: kSpaceMarginDefault,
            top: kSpaceMarginDefault,
            right: kSpaceMarginDefault),
        child: Column(
          children: <Widget>[
            SearchTextField(
              focusNode: _searchNode,
              onChanged: (String text) {
                _vm.setKeyword(text);
              },
            ),
            const SizedBox(
              height: kSpaceMarginDefault,
            ),
            Expanded(
              child: Observer(
                builder: (_) {
                  return ListView.separated(
                    padding: const EdgeInsets.only(bottom: kSpaceMarginDefault),
                    shrinkWrap: true,
                    itemCount: _vm.allCharacters.length,
                    itemBuilder: (BuildContext context, int index) {
                      final Character character = _vm.allCharacters[index];
                      return CardCharacter(
                        name: character.name,
                        onClick: () {
                          context.router
                              .push(CharacterDetailRoute(id: character.id));
                        },
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        const SizedBox(
                      height: kSpaceMarginDefault,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  @override
  void dispose() {
    _searchNode.dispose();
    _vm.destroy();
    super.dispose();
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
        _searchNode.requestFocus();
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
