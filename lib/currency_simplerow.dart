import 'package:crypto_cap/currency.dart';
import 'package:flutter/material.dart';

class CurrencySimpleRow extends StatelessWidget {
  final Currency currency;

  CurrencySimpleRow(this.currency);

  @override
  Widget build(BuildContext context) {
    return new Container(
      padding: const EdgeInsets.all(16.0),
      child: new Row(
        children: [
          new Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: new Text(currency.rank + ".")),
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                new Container(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: new Text(
                    currency.name,
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                new ValueChangeLayout(
                    currency.change1h, currency.change24h, currency.change7d)
              ],
            ),
          ),
          new Text("\$ " + currency.priceUsd),
        ],
      ),
    );
  }
}

class ValueChangeLayout extends StatelessWidget {
  final String percentage1h;
  final String percentage24h;
  final String percentage7d;

  // Wow, that thing is ugly ^^. Refactor
  ValueChangeLayout(this.percentage1h, this.percentage24h, this.percentage7d);
  @override
  Widget build(BuildContext context) {
    var down1 = "-" == percentage1h[0];
    var down24 = "-" == percentage24h[0];
    var down7 = "-" == percentage7d[0];
    var percentage1Cleaned;
    var percentage24Cleaned;
    var percentage7Cleaned;
    var icon1;
    var icon24;
    var icon7;
    if (down1) {
      icon1 = new Icon(
        Icons.arrow_downward,
        color: Colors.red,
      );
      percentage1Cleaned = percentage1h.substring(1, percentage1h.length) + "%";
    } else {
      icon1 = new Icon(
        Icons.arrow_upward,
        color: Colors.lightGreen,
      );
      percentage1Cleaned = percentage1h + "%";
    }
    if (down7) {
      icon7 = new Icon(
        Icons.arrow_downward,
        color: Colors.red,
      );
      percentage7Cleaned = percentage7d.substring(1, percentage7d.length) + "%";
    } else {
      icon7 = new Icon(
        Icons.arrow_upward,
        color: Colors.lightGreen,
      );
      percentage7Cleaned = percentage7d + "%";
    }
    if (down24) {
      icon24 = new Icon(
        Icons.arrow_downward,
        color: Colors.red,
      );
      percentage24Cleaned = percentage24h.substring(1, percentage7d.length) + "%";
    } else {
      icon24 = new Icon(
        Icons.arrow_upward,
        color: Colors.lightGreen,
      );
      percentage24Cleaned = percentage24h+ "%";
    }
    return new Row(
      children: <Widget>[
        new Text("1h:", style: new TextStyle(fontStyle: FontStyle.italic)),
        icon1,
        new Text(percentage1Cleaned),
        new Padding(
            padding: EdgeInsets.only(left: 6.0),
            child: new Text("24h:",
                style: new TextStyle(fontStyle: FontStyle.italic))),
        icon24,
        new Text(percentage24Cleaned),
        new Padding(
            padding: EdgeInsets.only(left: 6.0),
            child: new Text("7d:",
                style: new TextStyle(fontStyle: FontStyle.italic))),
        icon7,
        new Text(percentage7Cleaned),
      ],
    );
  }
}
