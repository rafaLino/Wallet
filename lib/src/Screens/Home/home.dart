import 'package:flutter/material.dart';
import 'package:wallet_rebalance/src/Components/stockCard.dart';
import 'package:wallet_rebalance/src/Utilities/Language.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.white),
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
                color: Colors.white,
                onPressed: () => {},
              ),
            ],
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Text(Language(Localizations.localeOf(context)).moneyFormatter.format(12000))
                ),
                Center(child: StockCard()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
