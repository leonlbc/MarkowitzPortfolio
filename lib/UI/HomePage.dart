import 'package:flutter/material.dart';
import 'package:witz/UI/NewPort.dart';
import 'package:witz/UI/MonteCarlo.dart';
import 'package:witz/UI/statistics.dart';
import 'package:witz/UI/stock.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String dropdownValue = "Portfolio 1";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text("Witz", style: TextStyle(fontSize: 25.0)),
        backgroundColor: Colors.black54,
      ),
      body: Padding(
          padding: EdgeInsets.fromLTRB(15.0, 10.0, 10.0, 10.0),
          child: Column(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    DropdownButton <String> (
                      value: dropdownValue,
                      icon: Icon(Icons.keyboard_arrow_down),
                      iconSize: 30.0,
                      elevation: 16,
                      style: TextStyle(color: Colors.white, fontSize: 25.0),
                      dropdownColor: Colors.grey[900],
                      underline: Container(
                        height: 2,
                        color: Colors.purple[900],
                      ),
                      onChanged: (String newValue){
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                      items: <String>["Portfolio 1", "Portfolio 2", "Portfolio 3", "Portfolio 4", "Minha Carteira"]
                          .map<DropdownMenuItem<String>>((String value){
                        return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value));
                      }).toList(),
                    )
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
            GestureDetector(
                child: Padding(padding: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
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

                                    Text("$ticker", style: TextStyle(
                                        fontSize: 25.0),),
                                    Text("$price", style: TextStyle(
                                        fontSize: 25.0))

                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: <Widget>[

                                    Text("$name", style: TextStyle(
                                        fontSize: 20.0)),
                                    Text("$variation%",
                                        style: TextStyle(
                                            fontSize: 20.0,
                                            color: Colors.red[900]))
                                  ],
                                ),
                              ],
                            )
                        )
                    )
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StockPage()));
                })
          ])),
    );
  }
}
