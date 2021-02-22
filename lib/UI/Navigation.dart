import 'package:flutter/material.dart';
import 'package:witz/UI/HomePage.dart';
import 'package:witz/UI/MonteCarlo.dart';
import 'package:witz/UI/NewPort.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {

  int _indexStart = 1;

  final List<Widget> _telas = [
    MonteCarloPage(),
    HomePage(),
    NewPortfolioPage(),
  ];

  void onTappedTab(int index) {
    setState(() {
      _indexStart = index;
    });
  }

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
}