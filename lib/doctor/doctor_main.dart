import 'package:flutter/material.dart';
import 'package:start_trial/doctor/doctor_prescription.dart';
import 'package:start_trial/doctor/doctor_sent.dart';

class DoctorMain extends StatefulWidget {

  @override
  _DoctorMainState createState() => _DoctorMainState();
}

class _DoctorMainState extends State<DoctorMain> {

  int _selectedIndex = 0;

  final List<Widget> _pages = <Widget>[
    DocPresc(),
    DocSent()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items:[
          BottomNavigationBarItem(
            icon: Icon(Icons.create),
            label: 'Resep Obat'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Kotak Resep Terkirim'
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
}
