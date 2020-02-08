import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wallet_rebalance/src/Utilities/PalleteColors.dart';
import 'package:wallet_rebalance/src/Utilities/Language.dart';
import 'package:wallet_rebalance/src/Utilities/localizations.dart';
import 'package:wallet_rebalance/src/bottomNavigation.dart';


void main() => runApp(App());

class App extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        DemoLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [Locale('en'), Locale('es'), Locale('pt')],
      localeResolutionCallback:
          (Locale locale, Iterable<Locale> supportedLocales) {
        return Language.brazil;
      },
      theme: ThemeData(
        scaffoldBackgroundColor: Pallete.kWhite,
        primaryColor: Pallete.kGreen,
        textTheme: TextTheme(bodyText2: TextStyle(color: Pallete.kBlack))
      ),
      home: BottomNavigation(),
    );
  }
}


