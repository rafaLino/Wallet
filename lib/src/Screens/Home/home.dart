import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return  Container(
        child: Center(
          child: Text('Home'),
        ),
      );
  }
}
