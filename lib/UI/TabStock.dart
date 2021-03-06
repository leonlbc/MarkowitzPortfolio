import 'package:flutter/material.dart';
import 'package:witz/UI/StockInfo.dart';

import 'NewPort.dart';

class TabStock extends StatefulWidget {
  @override
  _TabStockState createState() => _TabStockState();
}

class _TabStockState extends State<TabStock> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: GestureDetector(
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
                                Text("", style: TextStyle(
                                    fontSize: 25.0),),
                                Text("", style: TextStyle(
                                    fontSize: 25.0))
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .spaceBetween,
                              children: <Widget>[
                                Text("", style: TextStyle(
                                    fontSize: 20.0)),
                                Text("",
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
          }) ,
    );
  }
}
