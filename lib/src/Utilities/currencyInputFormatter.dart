import 'package:flutter/services.dart';
import 'package:wallet_rebalance/src/Utilities/Language.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.text.length == 0) {
      return newValue.copyWith(text: '');
    } else if (newValue.text.compareTo(oldValue.text) != 0) {
      int selectionIndexFromTheRight =
          newValue.text.length - newValue.selection.end;

      int num = int.parse(newValue.text
          .replaceAll(Language.defaultNumberFormatter.symbols.GROUP_SEP, ''));
      final newString = Language.defaultNumberFormatter.format(num);

      return new TextEditingValue(
        text: newString,
        selection: TextSelection.collapsed(
            offset: newString.length - selectionIndexFromTheRight),
      );
    } else {
      return newValue;
    }
  }
}
