import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:wallet_rebalance/src/Components/stockCard.dart';
import 'package:wallet_rebalance/src/Screens/Home/style.dart';
import 'package:wallet_rebalance/src/Utilities/Language.dart';
import 'package:wallet_rebalance/src/Utilities/PalleteColors.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final NumberFormat _formatter =
        Language(Localizations.localeOf(context)).moneyFormatter;
    return Container(
      margin: EdgeInsets.all(HomeStyle.containerMargin),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Pallete.kWhite),
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.playlist_add),
                tooltip: 'New stock',
                color: Pallete.kBlack,
                onPressed: () => {},
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  SafeArea(
                    child: Container(
                      width: 200,
                      padding: EdgeInsets.only(bottom: 24),
                      child: TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(16),
                            TextInputFormatter.withFunction(
                                (oldValue, newValue) {
                              if (newValue.text.length == 0) {
                                return newValue.copyWith(text: '');
                              } else if (newValue.text
                                      .compareTo(oldValue.text) !=
                                  0) {
                                int selectionIndexFromTheRight =
                                    newValue.text.length -
                                        newValue.selection.end;

                                int num = int.parse(newValue.text.replaceAll(
                                    Language.defaultNumberFormatter.symbols
                                        .GROUP_SEP,
                                    ''));
                                final newString =
                                    Language.defaultNumberFormatter.format(num);

                                return new TextEditingValue(
                                  text: newString,
                                  selection: TextSelection.collapsed(
                                      offset: newString.length -
                                          selectionIndexFromTheRight),
                                );
                              } else {
                                return newValue;
                              }
                            })
                          ],
                          initialValue:
                              Language.defaultNumberFormatter.format(15000),
                          textAlign: TextAlign.right,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.monetization_on),
                            prefix: Text(_formatter.currencySymbol),
                            labelText: 'Valor investido',
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            fillColor: Pallete.kWhite,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                            fontFamily: 'Poppins',
                          )),
                    ),
                  ),
                  SafeArea(child: Center(child: StockCard())),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
