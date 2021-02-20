import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'NewPort.dart';
class StockPage extends StatefulWidget {
  @override
  _StockPageState createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text(ticker, style: TextStyle(fontSize: 25.0, color: Colors.white))
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              height: 50.0,
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.5)),
                elevation: 5.0,
                color: Colors.purple[900],
                child: Padding(padding: EdgeInsets.all(10.0),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text("Select a period", style: TextStyle(fontSize: 23.0),),
                      Icon(Icons.keyboard_arrow_down_sharp)
                  ],
                )
                )
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.5)),
              elevation: 5.0,
              color: Colors.purple[900],
              child: Container(
                height: 307.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      height: 62.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text("Closing Price:", style: TextStyle(fontSize: 25.0)),
                                Text("R\$ $price", style: TextStyle(fontSize: 25.0)),
                            ],
                          )),
                          Padding(padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 0.0),
                           child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text("Variation:", style: TextStyle(fontSize: 20.0, color: Colors.black87)),
                              Text("$variation %", style: TextStyle(fontSize: 20.0, color: Colors.red[900]))
                            ],
                          ))
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 245.0,
                      child: Text("Insert graphic here"),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: 170.0,
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.5)),
                elevation: 5.0,
                color: Colors.purple[900],
                child: Padding(padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("CAPM Indicators",
                          style: TextStyle(fontSize: 23.0), textAlign: TextAlign.center,)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Beta",
                            style: TextStyle(fontSize: 23.0)),
                        Text("1.04",
                            style: TextStyle(fontSize: 23.0))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Alpha",
                            style: TextStyle(fontSize: 23.0)),
                        Text("XX",
                            style: TextStyle(fontSize: 23.0))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Sharpe Ratio",
                            style: TextStyle(fontSize: 23.0)),
                        Text("37.85%",
                            style: TextStyle(fontSize: 23.0))
                      ],
                    )
                  ],
                )
                )
              ),
            )
          ],
        ),
      ),
      );
  }
}

// Falta adicionar as linhas que separam os indicadores de CAPM




