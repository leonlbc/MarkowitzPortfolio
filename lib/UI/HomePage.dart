import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:witz/UI/TabStock.dart';
import 'package:witz/models/model.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String dropdownValue;
  List portfolioList;

  final List<Tab> tabs = <Tab>[
    Tab(text: "Stock"),
    Tab(text: "Brief"),
    Tab(text: "Markowitz")
  ];

  getAllPortfolios() async {
    var portfolios = await Portfoliostock().select().toList();
    return portfolios;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          backgroundColor: Colors.black45,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            actions: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.menu_outlined,
                    color: Colors.white,
                    size: 35.0,
                  ),
                  onPressed: () {

                  })
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
                                  FutureBuilder(
                                    future: getAllPortfolios(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        portfolioList.addAll(snapshot.data);
                                        return DropdownButton(
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
                                            items: portfolioList.map<DropdownMenuItem<String>>((value) {
                                              return DropdownMenuItem<String>(
                                                value: value,
                                                child: Text(value),
                                              );
                                            }).toList()
                                        );
                                      }
                                      return null;
                                    },
                                  ),
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
