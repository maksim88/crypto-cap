import 'package:crypto_cap/currency.dart';
import 'package:flutter/material.dart';

class CurrencyRow extends StatelessWidget {
  final Currency currency;

  CurrencyRow(this.currency);

  @override
  Widget build(BuildContext context) {
    Widget _currencyValue({String value, String image}) {
      return new Row(children: <Widget>[
        new Container(width: 8.0),
        new Text(
          currency.name,
        ),
      ]);
    }

    final currencyCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(height: 4.0),
          new Text(
            currency.name,
          ),
          new Container(height: 10.0),
          new Text(
            currency.rank,
          ),
          new Container(
              margin: new EdgeInsets.symmetric(vertical: 8.0),
              height: 2.0,
              width: 18.0,
              color: new Color(0xff00c6ff)),
          new Row(
            children: <Widget>[
              new Expanded(child: _currencyValue(value: currency.name)),
              new Expanded(child: _currencyValue(value: currency.name))
            ],
          ),
        ],
      ),
    );

    final currencyCard = new Container(
      child: currencyCardContent,
      height: 124.0,
      margin: new EdgeInsets.only(left: 46.0),
      decoration: new BoxDecoration(
        color: new Color(0xFF333366),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0),
          ),
        ],
      ),
    );
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      child: new Stack(
        children: <Widget>[
          currencyCard,
        ],
      ),
    );
  }
}
