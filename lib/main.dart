import 'package:cash_counter/pages/new_count.dart';
import 'package:cash_counter/pages/previous_count.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.brown[900],
      ),
      debugShowCheckedModeBanner: false,
      title: 'CASH COUNTER',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    PreviousCount(),
    NewCount(),
    // Settings(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.file_copy_outlined),
            label: 'Previous',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'New Count',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.brown[900],
        onTap: _onItemTapped,
      ),
    ));
  }
}
