import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_gen/gen_l10n/dictionary.dart";

@RoutePage()
class CharacterDetailPage extends StatefulWidget {
  const CharacterDetailPage({required this.id, super.key});

  final String id;

  @override
  State<StatefulWidget> createState() => _CharacterDetailPageState();
}

class _CharacterDetailPageState extends State<CharacterDetailPage>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(AppLocalizations.of(context)!.characters),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Text("Hello"),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
