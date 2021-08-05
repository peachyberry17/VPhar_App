import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class PharmacyList extends StatefulWidget {

  @override
  _PharmacyListState createState() => _PharmacyListState();
}

class _PharmacyListState extends State<PharmacyList> {
 final db = FirebaseFirestore.instance;
 final userPref = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("DAFTAR OBAT FARMASI"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection('pharmacy').where('id farmasi', isEqualTo: (userPref.read('uidpref'))).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Text('Belum ada Data');
          } else
            return ListView(
              children: snapshot.data.docs.map((doc) {
                return Card(
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                    colors: <Color>[Colors.cyan, Color(0xFF13E3D2)],
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ListTile(
                    leading: Image.network(doc['foto']),
                    title: Text(doc['nama obat']),
                    subtitle: Text(doc['ketersediaan obat']),
                  ),
                ),
                );
              }).toList(),
            );
        },
      ),
    );
  }
}