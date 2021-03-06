import 'package:flutter/material.dart';
import 'package:witz/UI/HomePage.dart';
import 'package:witz/UI/MonteCarlo.dart';
import 'package:witz/UI/NewPort.dart';

class Navigation extends StatefulWidget {
  final currentIndex;

  const Navigation({Key key, this.currentIndex}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {

  int _currentIndex = 1;

  final List<Widget> _pages = [
    MonteCarloPage(),
    HomePage(),
    NewPortfolioPage(),
  ];

  void onTappedTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.currentIndex != null){
      _currentIndex = widget.currentIndex;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black54,
        body: _pages[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(

            backgroundColor: Colors.black54,
            currentIndex: _currentIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            selectedIconTheme: IconThemeData(
              size: 32,
            ),
            onTap: onTappedTab,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.stacked_line_chart,
                  color: Colors.white,
                ),
                label: "CAPM"
                ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                label: "Home"
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_circle_outline_outlined,
                    color: Colors.white),
                label: "New Portfolio"
              ),
            ])
    );
  }
}