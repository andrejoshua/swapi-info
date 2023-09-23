import "package:flutter/material.dart";
import "package:flutter_gen/gen_l10n/dictionary.dart";
import "package:swapiinfo/design/design.dart";
import "package:swapiinfo/route/app_router.dart";

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AppRouter _router = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData.from(colorScheme: kSchemeLight, textTheme: kThemeText),
      routerConfig: _router.config(),
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.app_name,
    );
  }
}
