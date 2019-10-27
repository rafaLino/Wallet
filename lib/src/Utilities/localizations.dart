// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// A simple example of localizing a Flutter app written with the
// Dart intl package (see https://pub.dartlang.org/packages/intl).
//
// Spanish and English (locale language codes 'en' and 'es') are
// supported.

// The pubspec.yaml file must include flutter_localizations and the
// Dart intl packages in its dependencies section. For example:
//
// dependencies:
//   flutter:
//   sdk: flutter
//  flutter_localizations:
//    sdk: flutter
//  intl: 0.15.1
//  intl_translation: 0.15.0

// If you run this app with the device's locale set to anything but
// English or Spanish, the app's locale will be English. If you
// set the device's locale to Spanish, the app's locale will be
// Spanish.

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// This file was generated in two steps, using the Dart intl tools. With the
// app's root directory (the one that contains pubspec.yaml) as the current
// directory:
//
// flutter pub get
// flutter pub pub run intl_translation:extract_to_arb --output-dir=lib/assets/l10n lib/src/Utilities/localizations.dart
// flutter pub pub run intl_translation:generate_from_arb --output-dir=lib/assets/l10n --no-use-deferred-loading lib/src/Utilities/localizations.dart lib/assets/l10n/intl_en.arb lib/assets/l10n/intl_pt.arb lib/assets/l10n/intl_es.arb

// The second command generates intl_messages.arb and the third generates
// messages_all.dart. There's more about this process in
// https://pub.dev/packages/intl.
import '../../assets/l10n/messages_all.dart';

// ignore_for_file: non_constant_identifier_names
class DemoLocalizations {
  static Future<DemoLocalizations> load(Locale locale) {
    final String name =
        locale.countryCode.isEmpty ? locale.languageCode : locale.toString();
    final String localeName = Intl.canonicalizedLocale(name);

    return initializeMessages(localeName).then((bool _) {
      Intl.defaultLocale = localeName;
      return DemoLocalizations();
    });
  }

  static DemoLocalizations of(BuildContext context) {
    return Localizations.of<DemoLocalizations>(context, DemoLocalizations);
  }

  String get title {
    return Intl.message('title',
        name: 'title', desc: 'Title for the Demo application');
  }

  String get home_BottomNavigationBarItem_Text_Search =>
      Intl.message("home_BottomNavigationBarItem_Text_Search");

  String get home_BottomNavigationBarItem_Text_Home =>
      Intl.message("home_BottomNavigationBarItem_Text_Home");

  String get home_BottomNavigationBarItem_Text_Settings =>
      Intl.message("home_BottomNavigationBarItem_Text_Settings");

  String get home_BottomNavigationBarItem_Text_Graphics =>
      Intl.message('home_BottomNavigationBarItem_Text_Graphics');
}

class DemoLocalizationsDelegate
    extends LocalizationsDelegate<DemoLocalizations> {
  const DemoLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['en', 'es', 'pt'].contains(locale.languageCode);

  @override
  Future<DemoLocalizations> load(Locale locale) =>
      DemoLocalizations.load(locale);

  @override
  bool shouldReload(DemoLocalizationsDelegate old) => false;
}
