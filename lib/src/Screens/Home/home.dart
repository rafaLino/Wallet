import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:wallet_rebalance/src/Components/stockCard.dart';
import 'package:wallet_rebalance/src/Screens/Home/style.dart';
import 'package:wallet_rebalance/src/Utilities/Language.dart';
import 'package:wallet_rebalance/src/Utilities/PalleteColors.dart';
import 'package:wallet_rebalance/src/Utilities/currencyInputFormatter.dart';
import 'package:wallet_rebalance/src/Utilities/localizations.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {
  List<Widget> _itens = [StockCard(), StockCard(), StockCard()];
  int _selectedStockIndex = 0;
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: 200,
                    padding: EdgeInsets.only(bottom: 24),
                    child: TextFormField(
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(16),
                        CurrencyInputFormatter()
                      ],
                      initialValue:
                          Language.defaultNumberFormatter.format(16000),
                      textAlign: TextAlign.right,
                      enabled: true,
                      decoration: InputDecoration(
                        suffixIcon: Icon(Icons.monetization_on),
                        prefix: Text(_formatter.currencySymbol),
                        labelText:
                            DemoLocalizations.of(context).amount_invested,
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        fillColor: Pallete.kWhite,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  Container(
                    child: Expanded(
                      child: GestureDetector(
                        onHorizontalDragStart: (behave) {
                          print('drag start $_selectedStockIndex');
                        },
                        onDoubleTap: (){
                          print('double tap! $_selectedStockIndex');
                        },
                        child: ListWheelScrollView(
                          itemExtent: 330,
                          diameterRatio: 1.5,
                          onSelectedItemChanged: (index){
                            _selectedStockIndex = index;
                          },
                          children: _itens,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
