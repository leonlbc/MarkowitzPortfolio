import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:witz/models/model.dart';
import 'HomePage.dart';
import 'package:witz/verification_exception.dart';

class NewPortfolioPage extends StatefulWidget {
  @override
  _NewPortfolioPageState createState() => _NewPortfolioPageState();
}

class _NewPortfolioPageState extends State<NewPortfolioPage> {
  String portfolioName;
  TextEditingController portfolioNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  dynamic _search;
  dynamic name;
  dynamic ticker;
  dynamic price;
  dynamic variation;
  var stockList = List<Stock>();

  Future<Map> getData() async {
    if (_search != null && _search.toString().isNotEmpty) {
      print(_search);
      http.Response response = await http.get(
          "https://api.hgbrasil.com/finance/stock_price?key=aeedac9c&symbol=$_search");
      return json.decode(response.body);
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        title: Text(
          "New Portfolio",
          style: TextStyle(fontSize: 25.0),
        ),
        backgroundColor: Colors.black54,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.check,
                color: Colors.white,
                size: 35.0,
              ),
              onPressed: () {
                portfolioName = portfolioNameController.text;
                _prepareToSave(stockList, portfolioName);
                _moveToHome(context);
              }),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
            child: Form(
              key: _formKey,
              child: Column(children: <Widget>[
                TextFormField(
                  controller: portfolioNameController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Portfolio Name',
                    filled: true,
                    fillColor: Colors.grey,
                    contentPadding: const EdgeInsets.only(
                        left: 14.0, bottom: 6.0, top: 8.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueAccent),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please name your Portfolio';
                    }
                    return null;
                  },
                ),
              ]),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
            child: TextField(
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: Colors.white),
                  labelText: "Search stocks",
                  labelStyle: TextStyle(color: Colors.white),
                  fillColor: Colors.white,
                ),
                onSubmitted: (text) {
                  setState(() {
                    _search = text.toUpperCase();
                  });
                  if (_search != null) {
                    //Rever essa condicional
                    getData();
                  }
                }),
          ),
          Expanded(
              child: FutureBuilder<Map>(
                  future: getData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done) {
                      return ListView.builder(
                          itemCount: stockList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                                padding:
                                    EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                                child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(7.5)),
                                    color: Colors.purple[900],
                                    child: Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                  stockList[index].name,
                                                  style:
                                                      TextStyle(fontSize: 15.0),
                                                ),
                                                Text(
                                                    stockList[index]
                                                        .price
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 15.0)),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: <Widget>[
                                                Text(stockList[index].ticker,
                                                    style: TextStyle(
                                                        fontSize: 15.0)),
                                                Text(
                                                  stockList[index]
                                                      .variation
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 15.0,
                                                      color: Colors.red[900]),
                                                )
                                              ],
                                            ),
                                          ],
                                        ))));
                          });
                    } else if (snapshot.hasData) {
                      print(snapshot.data);
                      if (snapshot.data != null) {
                        _saveStockFields(snapshot);
                        _buildStock(stockList);
                      }
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                      //substituir por alert

                    }
                    return ListView.builder(
                        itemCount: stockList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding:
                                  EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                              child: Card(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7.5)),
                                  color: Colors.purple[900],
                                  child: Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text(
                                                stockList[index].name,
                                                style:
                                                    TextStyle(fontSize: 15.0),
                                              ),
                                              Text(
                                                  stockList[index]
                                                      .price
                                                      .toString(),
                                                  style:
                                                      TextStyle(fontSize: 15.0))
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Text(stockList[index].ticker,
                                                  style: TextStyle(
                                                      fontSize: 15.0)),
                                              Text(
                                                  stockList[index]
                                                      .variation
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 15.0,
                                                      color: Colors.red[900]))
                                            ],
                                          ),
                                        ],
                                      ))));
                        });
                  }))
        ],
      ),
    );
  }

  _saveStockFields(snapshot) {
    name = snapshot.data["results"]["$_search"]["name"];
    ticker = snapshot.data["results"]["$_search"]["symbol"];
    price = snapshot.data["results"]["$_search"]["price"];
    variation = snapshot.data["results"]["$_search"]["change_percent"];
  }

  _buildStock(stockList) {
    var stock = Stock.withFields(ticker, name, price, variation);
    bool exists = stockList.any((stock) => stock.ticker == ticker);
    //Check if stock is dupe => com essa API usamos o stock.price p/ identificar erro
    if (exists == false &&
        stock.price != null &&
        stock.variation != null &&
        stock.ticker != null) {
      stockList.add(stock);
    } else {
      //FIX
      return Text(
        "The stock was already added",
        style: TextStyle(color: Colors.white),
      );
    }
  }

  _prepareToSave(List stockList, String portfolioName) {
    if (_formKey.currentState.validate()) {
    try {
      if (stockList.length == 0) {
        throw VerificationException("Add at least one stock");
      }
       else {
        _saveToDb(portfolioName, stockList);
      }
    } catch (e) {
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            bool manuallyClosed = false;
            Future.delayed(Duration(seconds: 3)).then((_) {
              if (!manuallyClosed) {
                Navigator.of(context).pop();
              }
            });
            return AlertDialog(
              title: Text(e.toString()),
            );
          });
    }
    }
  }

  _saveToDb(String pName, List stockList) async {
    await Portfolio.withFields(pName).save().then((newPortfolioId) {
      print("Saved Portfolio $portfolioName");
      stockList.forEach((stock) async {
        await stock.save().then((stockId) async {
          print("Saved ${stock.ticker} to $portfolioName");
          await Portfoliostock.withFields(newPortfolioId, stockId).save();
        });
      });
    });
  }

  //FIX
  Future _moveToHome(context) async {
    //Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
    return AlertDialog(
      title: Text("Portfolio Saved"),
    );
  }
}
