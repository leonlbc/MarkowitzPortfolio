import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../helpers.dart';
import 'stock.dart';

String _search;
dynamic ticker;
dynamic name;
dynamic price;
dynamic variation;
var x;

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {





  @override
  void initState() {
    super.initState();
  }

  Future<Map> getData(_x) async {
    http.Response response = await http.get(
        "https://api.hgbrasil.com/finance/stock_price?key=aeedac9c&symbol=$_x");
    return (json.decode(response.body));
  }

  List _tickers = [];
  final _controller = TextEditingController();

  void newStock() {
    setState(() {
      _tickers.add(_controller.text);
      _controller.text = "";
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: Text("New Portfolio", style: TextStyle(fontSize: 25.0)),
        backgroundColor: Colors.black54,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.check,
                color: Colors.white,
                size: 35.0,
              ),
              onPressed: () {}),
          // Falta definir a colocar a function do menu quando selecionado no onTap
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
            child: TextField(
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                  labelText: "Portfolio name",
                  labelStyle: TextStyle(
                      color: Colors.white, backgroundColor: Colors.black)),
            ),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
              child: TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    icon: Icon(Icons.search, color: Colors.white),
                    labelText: "Search tickers",
                    labelStyle: TextStyle(color: Colors.white),
                    fillColor: Colors.white),
                controller: _controller,
              )),
          _addStock()
        ],
      ),
    );
  }

  _addStock() {
    if (_tickers != null) {
      for (x in _tickers) {
        return FutureBuilder<Map>(
            future: getData(x),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.waiting:
                case ConnectionState.none:
                  return Center(
                    child: Text("Carregando dados...",
                        style: TextStyle(color: Colors.white, fontSize: 25.0),
                        textAlign: TextAlign.center),
                  );
                default:
                  if (snapshot.hasError) {
                    return Center(
                      child: Text("Erro ao carregar dados!",
                          style: TextStyle(color: Colors.white, fontSize: 25.0),
                          textAlign: TextAlign.center),
                    );
                  } else {
                    ticker = snapshot.data["results"]["$x"]["symbol"];
                    name = snapshot.data["results"]["$x"]["company_name"];
                    price = snapshot.data["results"]["$x"]["price"];
                    variation =
                    snapshot.data["results"]["$x"]["change_percent"];
                    /* helper.newStock(Stock(
                      ticker: ticker,
                      name: name,
                      price: price,
                      variation: variation));*/
                    return ListView.builder(
                        itemCount: _tickers.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                              child: Padding(
                              padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                          child: Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.5)),
                          color: Colors.purple[900],
                          child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                          Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                          Text(ticker, style: TextStyle(
                          fontSize: 25.0)),
                          Text(price, style: TextStyle(
                          fontSize: 25.0))
                          ],
                          ),
                          Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                          Text(name, style: TextStyle(
                          fontSize: 25.0)),
                          Text(variation, style: TextStyle(
                          fontSize: 25.0))
                          ],
                          ),
                          ],
                          ),
                          )
                          ,
                          )
                          ,
                          ));
                        }
                    );
                  }
              }
            });
      }
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Testando",
            style: TextStyle(color: Colors.white, fontSize: 25.0),
          )
        ],
      );
    }
  }
}
