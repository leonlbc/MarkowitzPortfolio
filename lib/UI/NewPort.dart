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

class HomePage0 extends StatefulWidget {
  @override
  _HomePage0State createState() => _HomePage0State();
}

class _HomePage0State extends State<HomePage0> {
  Helper helper = Helper();


  @override
  void initState() {
    super.initState();
  }

  Future<Map> getData() async {
    http.Response response = await http.get(
        "https://api.hgbrasil.com/finance/stock_price?key=aeedac9c&symbol=$_search");
    return (json.decode(response.body));
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
          // Falta definir a colocar a função do menu quando selecionado no onTap
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
                  onSubmitted: (text) {
                    setState(() {
                      _search = text;
                    });
                  })),
          _addStock()
        ],
      ),
    );
  }


  /*_creatingCards(){
    Widget build (BuildContext context){
      return Scaffold(
        body: FutureBuilder<List<Stock>>(
          future: helper.getAllStocks(),
          builder: (BuildContext context, AsyncSnapshot <List<Stock>> snapshot){
            if (snapshot.hasData){
              return ListView.builder(itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index){
                    Stock item = snapshot.data[index];
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
                                    Text(item.ticker, style: TextStyle(
                                        fontSize: 25.0)),
                                    Text(item.price, style: TextStyle(
                                        fontSize: 25.0))
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(item.name, style: TextStyle(
                                        fontSize: 25.0)),
                                    Text(item.variation, style: TextStyle(
                                        fontSize: 25.0))
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }
              );
            } else {
              return Column(
                children: <Widget>[
                  Text("Error", style: TextStyle(color: Colors.white))
                ],
              );
            }
          }
        ),
      );
    }
  }*/


  _addStock() {
    if (_search != null) {
      return FutureBuilder<Map>(
          future: getData(),
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
                  ticker = snapshot.data["results"]["$_search"]["symbol"];
                  name = snapshot.data["results"]["$_search"]["company_name"];
                  price = snapshot.data["results"]["$_search"]["price"];
                  variation =
                      snapshot.data["results"]["$_search"]["change_percent"];
                 /* helper.newStock(Stock(
                      ticker: ticker,
                      name: name,
                      price: price,
                      variation: variation));*/
                  return null;
                }
            }
          });
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
