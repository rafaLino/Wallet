import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallet_rebalance/src/Utilities/PalleteColors.dart';
import 'package:wallet_rebalance/src/Utilities/currencyInputFormatter.dart';

class StockCardItem extends StatelessWidget {
  final String name;
  final TextInputType inputType;
  final bool readOnly;
  final int value;

  StockCardItem(
      {
      @required this.name,
      this.inputType = TextInputType.number,
      this.readOnly = true,
      this.value = 0,
      });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        child: TextFormField(
          initialValue: this.value.toString(),
          readOnly: false,
          inputFormatters: [
            LengthLimitingTextInputFormatter(16),
            CurrencyInputFormatter(),
          ],
          enableSuggestions: false,
          enableInteractiveSelection: false,
          textInputAction: TextInputAction.done,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 36, vertical: 8),
            suffixIcon: Tooltip(
                message: this.name, child: Icon(Icons.help_outline)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25)),
              borderSide: BorderSide(color: Pallete.kGrey, width: 1)
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(25)),
              borderSide: BorderSide(color: Pallete.kGreen,width: 2)
            ),
          ),
          keyboardType: this.inputType,
          style: TextStyle(
            fontFamily: 'Poppins',
          ),
        ),
      ),
    );
  }
}
