import 'package:flutter/material.dart';
import 'package:start_trial/patient/patient_received.dart';
import 'package:start_trial/patient/patient_sent.dart';

class PatMain extends StatefulWidget {

  @override
  _PatMainState createState() => _PatMainState();
}

class _PatMainState extends State<PatMain> {

  int _selectedIndex = 0;

  final List<Widget> _pages = <Widget>[
    PatReceived(),
    PatSent()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Kotak Masuk'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.create),
            label: 'Kotak Pesan Terkirim'
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        fixedColor: Colors.orangeAccent,
      ),
    );
  }
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
}
