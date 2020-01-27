import 'package:flutter/material.dart';
import 'package:wallet_rebalance/src/Screens/Graphic/graphic.dart';
import 'package:wallet_rebalance/src/Screens/Home/home.dart';
import 'package:wallet_rebalance/src/Screens/Setting/setting.dart';

class Routes {
  Map<String, Widget> _routes;
  static const String home = 'home';
  static const String setting = 'setting';
  static const String graphic = 'graphic';

  Routes() {
    _routes = <String, Widget>{
      setting: GraphicScreen(),
      home: HomeScreen(),
      graphic: SettingScreen(),
    };
  }

  Map<String, Widget> initialize() {
    return _routes;
  }

  List<String> getRouteNames() {
    return _routes.keys;
  }

  String getRouteName(int index) {
    return _routes.keys.elementAt(index);
  }

  Widget navigate(String key) {
    return _routes[key];
  }
}
