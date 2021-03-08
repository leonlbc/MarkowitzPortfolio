import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:witz/UI/TabStock.dart';
import 'package:witz/controllers/DatabaseController.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final dbController = DatabaseController();
  var getPortfolios;

  TabController _tabController;
  var dropdownValue;

  @override
  void initState() {
    _tabController = new TabController(length: 3, vsync: this);
    getPortfolios = dbController.getAllPortfolios();
    super.initState();
  }

  final List<Tab> tabs = <Tab>[
    Tab(text: "Stock"),
    Tab(text: "Brief"),
    Tab(text: "Markowitz")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black45,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.menu_outlined,
                  color: Colors.white,
                  size: 30.0,
                ),
                onPressed: () {})
          ],
          title: Text("Witz", style: TextStyle(fontSize: 25.0)),
          backgroundColor: Colors.black87,
          toolbarHeight: 50.0,
        ),
        body: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(15,20,0,20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    StreamBuilder(
                      stream: getPortfolios,
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          return DropdownButton(
                              value: dropdownValue,
                              icon: Icon(Icons.keyboard_arrow_down),
                              iconSize: 30.0,
                              elevation: 1,
                              style:
                              TextStyle(color: Colors.white, fontSize: 20.0),
                              dropdownColor: Colors.grey[900],
                              underline: Container(
                                height: 2,
                                color: Colors.purple[900],
                              ),
                              onChanged: (newValue) {
                                setState(() {
                                  dropdownValue = newValue;
                                });
                              },
                              items: snapshot.data
                                  .map<DropdownMenuItem>((value) {
                                return DropdownMenuItem(
                                  value: value.id,
                                  child: Text(value.name),
                                );
                              }).toList());
                        } else {
                          return DropdownButton(items: null);
                        }
                      },
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: null,
                          icon: Icon(Icons.edit),
                          iconSize: 30,
                          color: Colors.white70,
                          disabledColor: Colors.white70,
                        ),
                        IconButton(
                          onPressed: null,
                          icon: Icon(Icons.more_vert),
                          iconSize: 30,
                          color: Colors.white70,
                          disabledColor: Colors.white70,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              TabBar(
                    tabs: tabs,
                    controller: _tabController,
                  ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[
                    TabStock(portfolioId: dropdownValue),
                    Container(
                      color: Colors.greenAccent,
                    ),
                    Container(
                      color: Colors.orange,
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
