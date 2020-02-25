import 'package:flutter/material.dart';
import 'package:wallet_rebalance/src/Components/stockCardItem.dart';

class StockCard extends StatefulWidget {
  @override
  _StockCardState createState() => _StockCardState();
}

class _StockCardState extends State<StockCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minWidth: 500, minHeight: 300),
      child: Card(
        elevation: 2,
        child: Container(
          padding: EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  StockCardItem(
                    name: 'Ativo',
                    readOnly: false,
                    inputType: TextInputType.text,
                  ),
                  StockCardItem(
                    name: 'Nota',
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  StockCardItem(
                    name: 'Preço',
                    readOnly: false,
                  ),
                  StockCardItem(name: 'Comprar/Aguardar')
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  StockCardItem(
                    name: 'Carteira atual',
                  ),
                  StockCardItem(
                    name: 'Carteira ideal',
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  StockCardItem(
                    name: 'Valor investido atual',
                    readOnly: false,
                  ),
                  StockCardItem(
                    name: 'Valor investido ideal',
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  StockCardItem(
                    name: 'Quanto falta (R\$)',
                  ),
                  StockCardItem(
                    name: 'Quantas cotas restam',
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
