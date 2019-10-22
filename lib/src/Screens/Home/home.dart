import 'package:flutter/material.dart';
import 'package:wallet_rebalance/src/Utilities/localizations.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        child: Center(
          child: Text(DemoLocalizations.of(context).title),
        ),
      ),
    );
  }
}
