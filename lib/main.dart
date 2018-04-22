import 'dart:async';
import 'dart:convert';

import 'package:crypto_cap/currency.dart';
import 'package:crypto_cap/currency_row.dart';
import 'package:crypto_cap/currency_simplerow.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<Currency>> fetchCurrenciesFromInternet() async {
  final response = await http.get('https://api.coinmarketcap.com/v1/ticker/');
  final responseJson = json.decode(response.body);
  final responseList = List<Currency>();
  for (var item in responseJson) {
    responseList.add(new Currency.fromJson(item));
  }
  return responseList;
}

void main() => runApp(new MyApp());

class HomePageBody extends StatelessWidget {
  final List<Currency> currencies;

  HomePageBody(this.currencies);

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new ListView.builder(
        itemBuilder: (context, index) => new CurrencyRow(currencies[index]),
        itemCount: currencies.length,
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Crypto Cap',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Crypto Cap'),
        ),
        body: new Center(
          child: new FutureBuilder<List<Currency>>(
            future: fetchCurrenciesFromInternet(),
            builder: (context, snapshots) {
              if (snapshots.hasData) {
                return new ListView.builder(
                  itemBuilder: (context, index) =>
                      new CurrencySimpleRow(snapshots.data[index]),
                  itemCount: snapshots.data.length,
                );
              } else if (snapshots.hasError) {
                return new Text("${snapshots.error}");
              }
              // default: show spinner
              return new CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
