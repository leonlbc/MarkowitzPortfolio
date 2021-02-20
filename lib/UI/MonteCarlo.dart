import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MonteCarloPage extends StatefulWidget {
  @override
  _MonteCarloPageState createState() => _MonteCarloPageState();
}

class _MonteCarloPageState extends State<MonteCarloPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: Text("MC Simulations", style: TextStyle(fontSize: 25.0), textAlign: TextAlign.center),
        centerTitle: true,
      ),
      body: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Container(
                height: 50.0,
                child: Card(
                  color: Colors.purple[900],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.5)),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          icon: Icon(Icons.search, color: Colors.white),
                          labelText: "Search Tickers",
                          labelStyle: TextStyle(color: Colors.white)
                      ),
                    ),
                  ) ,
                ),
              ),
               Card(
                    color: Colors.purple[900],
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.5)),
                    elevation: 5.0,
                    child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child:  Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Select a period", style: TextStyle(color: Colors.white),
                            ),
                            Icon(Icons.keyboard_arrow_down)
                          ],
                        )
                )
              ),
               Card(
                  color: Colors.purple[900],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.5)),
                  elevation: 5.0,
                  child: Padding(padding: EdgeInsets.all(10.0),
                    child: Container(
                      alignment: Alignment.center,
                      height: 150.0,
                      child: Text("Inser Graphic Here"),
                    ),
              ),
              ),
               Card(
                  color: Colors.purple[900],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.5)),
                  elevation: 5.0,
                  child: Padding(padding: EdgeInsets.all(10.0),
                    child:Row(
                      children: <Widget>[
                        Text("Information Here")
                      ],
                    ),
                ) ,
              ),
              Card(
                color: Colors.purple[900],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.5)),
                elevation: 5.0,
                child: Padding(padding: EdgeInsets.all(10.0),
                  child:Row(
                    children: <Widget>[
                      Text("Information Here")
                    ],
                  ),
                ) ,
              ),
              Card(
                color: Colors.purple[900],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.5)),
                elevation: 5.0,
                child: Padding(padding: EdgeInsets.all(10.0),
                  child:Row(
                    children: <Widget>[
                      Text("Information Here")
                    ],
                  ),
                ) ,
              ),
              Card(
                color: Colors.purple[900],
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7.5)),
                elevation: 5.0,
                child: Padding(padding: EdgeInsets.all(10.0),
                  child:Row(
                    children: <Widget>[
                      Text("Information Here")
                    ],
                  ),
                ) ,
              )
            ],
          ),),
    );
  }
}
