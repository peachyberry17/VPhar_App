import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchPatient extends StatefulWidget {

  @override
  _SearchPatientState createState() => _SearchPatientState();
}

class _SearchPatientState extends State<SearchPatient> {

 final db = FirebaseFirestore.instance;

 final TextEditingController _searchController = TextEditingController();

 @override
 void initState(){
   super.initState();
   _searchController.addListener(_onSearchChanged);
 }

 @override
 void dispose() {
   _searchController.removeListener(_onSearchChanged());
   _searchController.dispose();
   super.dispose();
 }

 _onSearchChanged(){
   print(_searchController.text);
   setState(() {
      });
 }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Cari Nama Pasien',
            hintStyle: TextStyle(color: Colors.white),
          ),
          onChanged: (text){
          },
        ),
        actions: <Widget> [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
            },
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection('profileInfo').where('status', isEqualTo: 'Pasien').snapshots(),
        builder: (context, snapshot){
          if(!snapshot.hasData){
            return Text('Belum Ada Data');
          } else{
            List<Map> patientList = [];
            snapshot.data.docs.forEach((doc){
                Map data = doc.data();
                if(_searchController.text == '' || data['nama'].contains(_searchController.text)){
                  patientList.add(doc.data());
                }
              }
            );
            return ListView(
              children: patientList.map((doc){
                return Card(
                  child: ListTile(
                    title: Text(doc['nama']),
                    subtitle: Text(doc['status']),
                    onTap: () {
                        Navigator.pop(context, doc);
                    }
                  ),
                );
              }
             )
             .toList()
            );
          }
        },
      )  
    );
  }
}
