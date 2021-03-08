import 'package:flutter/material.dart';
import 'package:witz/UI/StockInfo.dart';
import 'package:witz/controllers/DatabaseController.dart';

class TabStock extends StatefulWidget {
  final portfolioId;

  const TabStock({Key key, @required this.portfolioId}) : super(key: key);

  @override
  _TabStockState createState() => _TabStockState();
}

class _TabStockState extends State<TabStock> {
  final dbController = DatabaseController();
  var getStocks;

  @override
  void initState() {
    getStocks = dbController.getStocksFromPortfolio;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: StreamBuilder(
          stream: getStocks(widget.portfolioId),
          builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done && snapshot.data != null) {
            var list = snapshot.data;
            return ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
              return GestureDetector(
                  child: Padding(padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                      child: Container(
                          height: 80.0,
                          child: Card(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.5)),
                              color: Colors.purple[900],
                              child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: <Widget>[
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        children: <Widget>[
                                          Text(list[index].name, style: TextStyle(
                                              fontSize: 25.0),),
                                          Text(list[index].price.toString(), style: TextStyle(
                                              fontSize: 25.0))
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        children: <Widget>[
                                          Text(list[index].ticker, style: TextStyle(
                                              fontSize: 20.0)),
                                          Text(list[index].variation.toString(),
                                              style: TextStyle(
                                                  fontSize: 20.0,
                                                  color: Colors.red[900]))
                                        ],
                                      ),
                                    ],
                                  )
                              )
                          )
                      )
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => StockPage()));
                  });
            });
          }
          else {
            return Container();
          }
      })
    );
  }
}
