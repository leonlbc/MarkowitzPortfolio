import 'package:flutter/material.dart';
import 'package:witz/UI/NewPort.dart';
import 'package:witz/UI/MonteCarlo.dart';
import 'package:witz/UI/Statistics.dart';
import 'package:witz/UI/Stock.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      appBar: AppBar(
        title: Text("Witz", style: TextStyle(fontSize: 25.0)),
        backgroundColor: Colors.black54,
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
                size: 35.0,
              ),
              onPressed: () {})
          // Falta definir a colocar a função do menu quando selecionado no onTap
        ],
      ),
      body: Padding(
          padding: EdgeInsets.fromLTRB(15.0, 10.0, 10.0, 10.0),
          child: Column(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text("Portfolio 1",
                        style: TextStyle(color: Colors.white, fontSize: 25.0)),
                    FloatingActionButton(
                        onPressed: () {},
                        child: Icon(Icons.keyboard_arrow_down,
                            color: Colors.white),
                        backgroundColor: Colors.black54)
                  ],
                ),
                Row(
                  children: <Widget>[
                    FloatingActionButton(
                        onPressed: () {},
                        child: Icon(Icons.edit, color: Colors.white),
                        backgroundColor: Colors.black54),
                    FloatingActionButton(
                        onPressed: () {},
                        child: Icon(Icons.more_vert, color: Colors.white),
                        backgroundColor: Colors.black54),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                FloatingActionButton(
                    onPressed: null,
                    backgroundColor: Colors.black54,
                    child: Text("Stocks")),
                FloatingActionButton(
                    onPressed: null,
                    backgroundColor: Colors.black54,
                    child: Text("Brief")),
                FloatingActionButton(
                  onPressed: null,
                  backgroundColor: Colors.black54,
                  child: Text("Markowitz"),
                )
              ],
            ),
            GestureDetector(
                child: Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                    child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7.5)),
                        color: Colors.purple[900],
                        child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      "$ticker",
                                      style: TextStyle(fontSize: 25.0),
                                    ),
                                    Text("$price",
                                        style: TextStyle(fontSize: 25.0))
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text("$name",
                                        style: TextStyle(fontSize: 20.0)),
                                    Text("$variation%",
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.red[900]))
                                  ],
                                ),
                              ],
                            )))),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StockPage()));
                })
          ])),
    );
  }
}
