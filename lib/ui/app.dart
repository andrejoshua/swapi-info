import "package:another_flushbar/flushbar.dart";
import "package:flutter/material.dart";
import "package:flutter_gen/gen_l10n/dictionary.dart";
import "package:internet_connection_checker/internet_connection_checker.dart";
import "package:rxdart_ext/rxdart_ext.dart";
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
  final AppRouter _router = AppRouter();

  final CompositeSubscription _subscription = CompositeSubscription();

  @override
  void initState() {
    super.initState();

    // Delay before listening to connection status
    // The reason is to let the MaterialApp create the route first
    Single<void>.fromCallable(() {})
        .delay(kDurationInternetConnectionDelay)
        .flatMap((Object? value) {
      return InternetConnectionChecker.createInstance(
              checkInterval: const Duration(seconds: 1))
          .onStatusChange;
    }).listen((InternetConnectionStatus event) {
      if (event == InternetConnectionStatus.disconnected) {
        final BuildContext? innerContext =
            _router.navigatorKey.currentState?.overlay?.context;
        if (innerContext != null) {
          final String word =
              AppLocalizations.of(innerContext)!.internet_disconnected;
          Flushbar<dynamic>(
            message: word,
            duration: kDurationSnackbar,
          ).show(innerContext);
        }
      }
    }).addTo(_subscription);
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
    _subscription.dispose();
    super.dispose();
  }
}
