import 'package:crypto_cap/currency.dart';
import 'package:flutter/material.dart';

class CurrencySimpleRow extends StatelessWidget {
  final Currency currency;

  CurrencySimpleRow(this.currency);

  @override
  Widget build(BuildContext context) {
    var currenciesMap = {
      "1h": currency.change1h,
      "24h": currency.change24h,
      "7d": currency.change7d,
    };

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
                // new ValueChangeLayout(
                //     currency.change1h, currency.change24h, currency.change7d)
                new CurrencyUpDownLayout(currenciesMap)
              ],
            ),
          ),
          new Text("\$ " + currency.priceUsd),
        ],
      ),
    );
  }
}

class CurrencyUpDownLayout extends StatelessWidget {
  final Map<String, String> percentages;

  CurrencyUpDownLayout(this.percentages);

  @override
  Widget build(BuildContext context) {
    var list = <Widget>[];
    for (var item in percentages.entries) {
      var down = "-" == item.value[0];
      var finalPercentage;
      var icon;
      if (down) {
        finalPercentage = item.value.substring(1, item.value.length);
        icon = new Icon(
          Icons.arrow_downward,
          color: Colors.red,
          size: 12.0,
        );
      } else {
        icon = new Icon(
          Icons.arrow_upward,
          color: Colors.lightGreen,
          size: 12.0,
        );
        finalPercentage = item.value;
      }
      list.add(new Text(item.key,
          style: new TextStyle(fontStyle: FontStyle.italic)));
      list.add(icon);
      list.add(new Padding(
          padding: new EdgeInsets.only(right: 6.0),
          child: new Text(finalPercentage + "%")));
    }
    return new Row(children: list);
  }
}
