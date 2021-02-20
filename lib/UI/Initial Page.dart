import 'package:flutter/material.dart';
import 'package:witz/UI/HomePage.dart';
import 'package:witz/UI/MonteCarlo.dart';
import 'package:witz/UI/NewPort.dart';

class testPage extends StatefulWidget {
  @override
  _testPageState createState() => _testPageState();
}

class _testPageState extends State<testPage> {

  int _indexStart = 1;

  final List<Widget> _telas = [
    MonteCarloPage(),
    HomePage(),
    HomePage0(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      body: _telas[_indexStart],
        bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black54,
            currentIndex: _indexStart,
            onTap: onTappedTab,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.stacked_line_chart,
                  color: Colors.white,
                ),
                title:
                Text("Monte-Carlo", style: TextStyle(color: Colors.white)),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                title: Text("Home", style: TextStyle(color: Colors.white)),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_circle_outline_outlined,
                    color: Colors.white),
                title: Text("New portfolio",
                    style: TextStyle(color: Colors.white)),
              ),
            ])
    );
  }
  void onTappedTab(int index) {
    setState(() {
      _indexStart = index;
    });
  }
}
