
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallet_rebalance/src/Utilities/localizations.dart';
import 'package:wallet_rebalance/src/routes.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
 Routes _routes = Routes();
 int _selected = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _routes.navigate(_routes.getRouteName(_selected)),
            bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.pie_chart),
              title: Text(DemoLocalizations.of(context).navigationBarSubtitle_graphics)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text(DemoLocalizations.of(context).navigationBarSubtitle_home)
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text(DemoLocalizations.of(context).navigationBarSubtitle_settings)
          ),
        ],
        currentIndex: _selected,
        onTap:_onTapped,
      ),
    );
  }

  void _onTapped(int index) {
    setState(() {
      _selected = index;
    });
  }
}
