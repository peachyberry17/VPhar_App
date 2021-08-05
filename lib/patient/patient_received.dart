import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:start_trial/model/prescription.dart';
import 'package:start_trial/patient/patient_presdetail.dart';
import 'package:start_trial/patient/patient_profile.dart';

class PatReceived extends StatefulWidget {
  @override
  _PatReceived createState() => _PatReceived();
}

class _PatReceived extends State<PatReceived> {
  User user;
  User userData;
  QuerySnapshot snapshot;
  List<Prescription>_prescription = [];

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  getUserData() async {
    userData = FirebaseAuth.instance.currentUser;
    snapshot = await FirebaseFirestore.instance.collection('prescription').get();
    snapshot.docs.forEach((document) {
      Prescription medicine = Prescription.fromJson (document.data());
      setState(() {
        if(userData.uid == medicine.idPasien){
          _prescription.add(medicine);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: Text("APOTECH"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.account_circle), 
            onPressed:() {
              Navigator.push(context, MaterialPageRoute(builder: (context) => PatProfile()),);
            },
          ),
        ],
      ),
      body: Container(
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: _prescription.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>   
                  PatDetail(prescription:_prescription[index])),); //To get prescription detail for the patient
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                    colors: <Color>[Color(0xFF13E3D2), Colors.orangeAccent],
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
                              child: Text('${_prescription[index].namaDokter}',
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
      ),
    );
  }
}