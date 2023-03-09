import 'package:ayur_app/HomePage.dart';
import 'package:ayur_app/about.dart';
import 'package:ayur_app/tips.dart';
import 'package:ayur_app/tutorials.dart';
import 'package:flutter/material.dart';

class NavigationBarScreen extends StatefulWidget {
  const NavigationBarScreen({Key? key}) : super(key: key);

  @override
  _NavigationBarScreenState createState() => _NavigationBarScreenState();
}

class _NavigationBarScreenState extends State<NavigationBarScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Tutorials(),
    Tips(),
    about(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library),
            label: 'Tutorials',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.lightbulb),
            label: 'Tips',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 80, 160, 105),
        unselectedItemColor: const Color.fromARGB(255, 110, 42, 2),
        selectedIconTheme: const IconThemeData(
          color: Color.fromARGB(255, 3, 113, 31),
        ),
        unselectedIconTheme: const IconThemeData(
          color: Color.fromARGB(255, 91, 47, 3),
        ),
        selectedLabelStyle: const TextStyle(
          color: Color.fromARGB(255, 3, 113, 31),
        ),
        unselectedLabelStyle: const TextStyle(
          color: Color.fromARGB(255, 91, 47, 3),
        ),
        onTap: _onItemTapped,
      ),
    );
  }
}
