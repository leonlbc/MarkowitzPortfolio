import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatisticsPage extends StatefulWidget {
  @override
  _StatisticsPageState createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black54,
        appBar: AppBar(
          title: Text("Witz", style: TextStyle(fontSize: 25.0)),
          backgroundColor: Colors.black54,
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.menu_outlined,
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
                          style:
                              TextStyle(color: Colors.white, fontSize: 25.0)),
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
                  FloatingActionButton(onPressed: null, child: Text("Stocks")),
                  FloatingActionButton(
                    onPressed: null,
                    child: Text("Brief"),
                  ),
                  FloatingActionButton(
                    onPressed: null,
                    child: Text("Markowitz"),
                  )
                ],
              ),
              Container(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(7.5)),
                          color: Colors.purple[900],
                          child: Column(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.center,
                                child: Text("Graphic Here"),
                              ),
                              Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7.5)),
                                color: Colors.grey,
                                child: Row(),
                              ),
                              Card(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7.5)),
                                color: Colors.grey,
                                child: Row(),
                              )
                            ],
                          )),
                    ],
                  ),
                ),
              )
            ])));
  }
}
