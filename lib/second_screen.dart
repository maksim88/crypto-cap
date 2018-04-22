import 'package:crypto_cap/currency.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final Currency currency;

  SecondScreen(this.currency);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(currency.name),
      ),
      body: new Center(child: new Text(currency.priceUsd)),
    );
  }
}
