import "dart:async";

import "package:another_flushbar/flushbar.dart";
import "package:auto_route/auto_route.dart";
import "package:flutter/material.dart";
import "package:flutter_gen/gen_l10n/dictionary.dart";
import "package:internet_connection_checker/internet_connection_checker.dart";
import "package:swapiinfo/design/design.dart";
import "package:swapiinfo/route/app_router.dart";
import "package:swapiinfo/util/constants.dart";

// This widget is the root of your application.
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<AutoRouterState> innerKey = GlobalKey<AutoRouterState>();

  final AppRouter _router = AppRouter();

  late StreamSubscription<InternetConnectionStatus> _connectivityListener;

  @override
  void initState() {
    super.initState();

    _connectivityListener = InternetConnectionChecker.createInstance(
            checkInterval: const Duration(seconds: 1))
        .onStatusChange
        .listen((InternetConnectionStatus event) {
      if (event == InternetConnectionStatus.disconnected) {
        Flushbar<dynamic>(
          message: AppLocalizations.of(context)!.internet_disconnected,
          duration: kDurationSnackbar,
        ).show(context);
      }
    });
  }

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

  @override
  void dispose() {
    _connectivityListener.cancel();
    super.dispose();
  }
}
