import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wallet_rebalance/src/Utilities/PalleteColors.dart';
import 'package:wallet_rebalance/src/Utilities/constants.dart';
import 'package:wallet_rebalance/src/Utilities/localizations.dart';
import 'package:wallet_rebalance/src/bottomNavigation.dart';


void main() => runApp(App());

class App extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        DemoLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [Locale('en'), Locale('es'), Locale('pt')],
      localeResolutionCallback:
          (Locale locale, Iterable<Locale> supportedLocales) {
        return Language.english;
      },
      theme: ThemeData(
        scaffoldBackgroundColor: Pallete.kBlack,
        primaryColor: Pallete.kGreen,
        textTheme: TextTheme(bodyText2: TextStyle(color: Pallete.kWhite))
      ),
      home: BottomNavigation(),
    );
  }
}
