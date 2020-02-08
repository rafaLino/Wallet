import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Language {
  static Locale brazil = Locale('pt', 'BR');
  static Locale english = Locale('en', 'US');
  static Locale spanish = Locale('es', 'US');

  static Map<Locale, String> _symbols = {
    brazil: 'R\$',
    english: '\$',
    spanish: '€'
  };

  NumberFormat _formatter;
  Language(Locale locale) {
    _formatter = NumberFormat.currency(
        locale: locale.languageCode,
        symbol: _symbols[locale],
        decimalDigits: 2);
  }

  NumberFormat get moneyFormatter {
    return _formatter;
  }

  static NumberFormat get defaultNumberFormatter {
    return NumberFormat('#,###');
  }
}
