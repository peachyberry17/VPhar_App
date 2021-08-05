import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:start_trial/doctor/doctor_presdetail.dart';
import 'package:start_trial/get_started.dart';
import 'package:start_trial/model/prescription.dart';

class DocSent extends StatefulWidget {
  @override
  _DocSent createState() => _DocSent();
}

class _DocSent extends State<DocSent> {
  User user;
  User userData;
  List<Prescription>_prescription = [];
  Map<int, bool> itemsSelectedValue = Map();
  QuerySnapshot snapshot;

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  getUserData() async {
    userData = FirebaseAuth.instance.currentUser;
     snapshot = await FirebaseFirestore.instance.collection('prescription').orderBy('tanggal', descending: true).get();
    snapshot.docs.forEach((document) {
      Prescription medicine = Prescription.fromJson(document.data());
      setState(() {
        if(userData.uid == medicine.idDokter){
          _prescription.add(medicine);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("APOTECH"),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.logout),
            onPressed:() {
              Navigator.push(context, MaterialPageRoute(builder: (context) => GetStarted()),);
            },
          ),
        ],
      ),
      body: Container(
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: _prescription.length,
          itemBuilder: (BuildContext context, int index) {
            bool isCurrentIndexSelected = itemsSelectedValue[index] == null
                ? false
                : itemsSelectedValue[index];
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => DocDetail(prescription:_prescription[index])),);
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                    colors: <Color>[Color(0xFF13E3D2), Color(0xFF5D74E2)],
                  ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 50,
                        child:  Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('${_prescription[index].namaPasien}',
                              style: TextStyle(
                              fontWeight: FontWeight.bold),)
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        child:  Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('${_prescription[index].tanggal}',
                              style: TextStyle(
                              fontWeight: FontWeight.bold),
                            )
                          ),
                          ),
                        ),
                      Icon(
                        Icons.check,
                        color: Colors.white,
                        size: 30.0,
                      ),
                    ],
                  ),
                ),
              ),
              ),
            );
          }
        ),
      )
    );
  }
}
