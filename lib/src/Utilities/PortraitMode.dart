import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

mixin PortraitMode on StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _portraitModeOnly();
    return null;
  }

  void _portraitModeOnly() {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }
}