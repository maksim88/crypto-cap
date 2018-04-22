import 'dart:async';
import 'dart:convert';

import 'package:crypto_cap/currency.dart';
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

class _CurrencyPageState extends State<CurrencyPageBody> {

  List<Currency> currencies;

  _CurrencyPageState(this.currencies);

  void _addCurrencies(List<Currency> newCurrencies) {
      setState(() {
        currencies.clear();
        currencies.addAll(newCurrencies);
        });
    }

    Future<Null> _onRefresh() {
      Completer<Null> completer = new Completer<Null>();
      fetchCurrenciesFromInternet().then((cur) => _addCurrencies(cur));
      completer.complete();
      return completer.future;
    }
  @override
  Widget build(BuildContext context) {
   return new RefreshIndicator(
      child: new ListView.builder(
        itemBuilder: (context, index) => new CurrencySimpleRow(currencies[index]),
        itemCount: currencies.length,
      ), onRefresh: () {
        return _onRefresh();
      },
    );
  }
}


class CurrencyPageBody extends StatefulWidget {

  final List<Currency> currencies;

  CurrencyPageBody(this.currencies);
  
  @override
  State<StatefulWidget> createState() {
    return new _CurrencyPageState(currencies);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Crypto Cap',
      theme: new ThemeData(
        primarySwatch: Colors.blueGrey,
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
                return CurrencyPageBody(snapshots.data);
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
