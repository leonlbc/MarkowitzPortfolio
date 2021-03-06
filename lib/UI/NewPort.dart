import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:witz/UI/Navigation.dart';
import 'package:witz/models/model.dart';
import 'package:witz/glitch/VerificationException.dart';
import 'package:witz/models/StockApi.dart';

class NewPortfolioPage extends StatefulWidget {
  @override
  _NewPortfolioPageState createState() => _NewPortfolioPageState();
}

class _NewPortfolioPageState extends State<NewPortfolioPage> {
  final api = StockApi();

  String portfolioName;
  TextEditingController portfolioNameController = TextEditingController();
  final _portfolioNameFormKey = GlobalKey<FormState>();

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
                _prepareToSave(api.stockList, portfolioName);
                _moveToHome(context);
              }),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
            child: Form(
              key: _portfolioNameFormKey,
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
                    api.search = text.toUpperCase();
                  });
                  if (api.search != null) {
                    api.getData(api.search);
                  }
                }),
          ),
          Expanded(
              child: FutureBuilder<Map>(
                  future: api.getData(api.search),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done) {
                      return ListView.builder(
                          itemCount: api.stockList.length,
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
                                                  api.stockList[index].name,
                                                  style:
                                                      TextStyle(fontSize: 15.0),
                                                ),
                                                Text(
                                                    api.stockList[index]
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
                                                Text(api.stockList[index].ticker,
                                                    style: TextStyle(
                                                        fontSize: 15.0)),
                                                Text(
                                                  api.stockList[index]
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
                        api.saveStockFields(snapshot);
                        _buildStock(api.stockList);
                      }
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                      //substituir por alert
                    }
                    return ListView.builder(
                        itemCount: api.stockList.length,
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
                                                api.stockList[index].name,
                                                style:
                                                    TextStyle(fontSize: 15.0),
                                              ),
                                              Text(
                                                  api.stockList[index]
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
                                              Text(api.stockList[index].ticker,
                                                  style: TextStyle(
                                                      fontSize: 15.0)),
                                              Text(
                                                  api.stockList[index]
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


  _buildStock(stockList) {
    var stock = Stock.withFields(api.ticker, api.name, api.price, api.variation);
    bool exists = api.stockList.any((stock) => stock.ticker == api.ticker);
    if (exists == false &&
        stock.price != null &&
        stock.variation != null &&
        stock.ticker != null) {
      api.stockList.add(stock);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("This stock was already added"),
      ),);
    }
  }

  _prepareToSave(List stockList, String portfolioName) {
    if (_portfolioNameFormKey.currentState.validate()) {
    try {
      if (api.stockList.length == 0) {
        throw VerificationException("Add at least one stock");
      }
       else {
        _saveToDb(portfolioName, api.stockList);
      }
    } catch (e) {
      return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(e.toString()),
      ),);
    }
    }
  }

  _saveToDb(String pName, List stockList) async {
    await Portfolio.withFields(pName).save().then((newPortfolioId) {
      print("Saved Portfolio $portfolioName");
      api.stockList.forEach((stock) async {
        await stock.save().then((stockId) async {
          print("Saved ${stock.ticker} to $portfolioName");
          await Portfoliostock.withFields(newPortfolioId, stockId).save();
        });
      });
    });
  }

   _moveToHome(context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Navigation()));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Created Portfolio"),
    ),);
  }
}
