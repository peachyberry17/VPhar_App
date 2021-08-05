import 'package:flutter/material.dart';
import 'package:start_trial/pharmacy/medicine_list.dart';
import 'package:start_trial/pharmacy/pharmacy_list.dart';
import 'package:start_trial/pharmacy/pharmacy_received.dart';

class PharMain extends StatefulWidget {

  @override
  _PharMainState createState() => _PharMainState();
}

class _PharMainState extends State<PharMain> {

  int _selectedIndex = 0;

  final List<Widget> _pages = <Widget>[
    MedicineList(), 
    PharmacyList(),
    PharReceived(),
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
            icon: Icon(Icons.list),
            label: 'Daftar Obat Nasional'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.data_usage),
            label: 'Daftar Obat Farmasi'),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Kotak Masuk'
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        fixedColor: Colors.cyan,
      ),
    );
  }
  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
}
