import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wallet_rebalance/src/routes.dart';

import '0 - Presentation/PortraitMode.dart';
import '2 - Domain/Models/language.dart';
import '2 - Domain/Services/localizations.dart';

class App extends StatelessWidget with PortraitMode {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MaterialApp(
        localizationsDelegates: [
          DemoLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        supportedLocales: [
          Locale('en'),
          Locale('es'),
          Locale('pt')
        ],
        localeResolutionCallback:
            (Locale locale, Iterable<Locale> supportedLocales) {
          return Language.brazil;
        },
        theme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: Colors.black,
            primaryIconTheme: IconThemeData(color: Colors.black),
            primaryTextTheme: TextTheme(
                title: TextStyle(color: Colors.black, fontFamily: "Aveny")),
            textTheme: TextTheme(title: TextStyle(color: Colors.black))),
        initialRoute: Routes.home,
        routes: Routes().initialize());
  }
}
