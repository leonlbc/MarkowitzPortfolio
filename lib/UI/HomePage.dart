import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:witz/UI/NewPort.dart';
import 'package:witz/UI/MonteCarlo.dart';
import 'package:witz/UI/TabStock.dart';
import 'package:witz/UI/statistics.dart';
import 'package:witz/UI/stock.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String dropdownValue = "Portfolio 1";

  final List<Tab> tabs = <Tab>[
    Tab(text: "Stock"),
    Tab(text: "Brief"),
    Tab(text: "Markowitz")
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          backgroundColor: Colors.black45,
          appBar: AppBar(
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
            title: Container(child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Text("Witz", style: TextStyle(fontSize: 25.0)),
                  ],
                ),
                Row(children: <Widget>[
                    Padding(padding: EdgeInsets.fromLTRB(7.0, 5.0, 5.0, 5.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  DropdownButton(
                                      value: dropdownValue,
                                      icon: Icon(Icons.keyboard_arrow_down),
                                      iconSize: 30.0,
                                      elevation: 16,
                                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                                      dropdownColor: Colors.grey[900],
                                      underline: Container(
                                        height: 2,
                                        color: Colors.purple[900],
                                      ),
                                      onChanged: (String newValue) {
                                        setState(() {
                                          dropdownValue = newValue;
                                        });
                                      },
                                      items: <String>[
                                        "Portfolio 1",
                                        "Portfolio 2",
                                        "Portfolio 3",
                                        "Portfolio 4",
                                        "Minha Carteira"
                                      ].map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                            value: value, child: Text(value));
                                      }).toList()
                                  )
                                ],
                              ),
                              Row(
                                  children: <Widget>[
                                    ButtonBar(children: <Widget>[
                                      FlatButton.icon(
                                          onPressed: null,
                                          icon: Icon(Icons.edit),
                                          label: Text("1")),
                                      FlatButton.icon(
                                          onPressed: null,
                                          icon: Icon(Icons.more_vert),
                                          label: Text("2"))
                                    ]),
                                  ]
                              )
                            ],
                          )
                        ],
                      ),)
                ])
              ],
            )
            ),
            backgroundColor: Colors.black54,
            bottom: TabBar(tabs: tabs),
            toolbarHeight: 150.0,
          ),
          body: TabBarView(
            children: <Widget>[
              TabStock(),
              Container(
                color: Colors.greenAccent,
              ),
              Container(
                color: Colors.orange,
              )
            ],
          )
        ));
  }
}
