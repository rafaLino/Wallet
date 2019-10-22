import 'package:flutter/material.dart';
import 'Screens/Home/home.dart';

class Routes {
  static const String home = "home";
  static const String configuration = 'configuration';
  static const String graphic = 'graphic';

  Map<String, WidgetBuilder> initialize() {
    return <String, WidgetBuilder>{
      home: (BuildContext context) => Home(),
    };
  }
}
