import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:start_trial/model/Recap.dart';
import 'package:start_trial/patient/patient_profile.dart';
import 'package:start_trial/pharmacy/pharmacy_presdetail.dart';
import 'package:start_trial/pharmacy/pharmacy_profile.dart';

class PharReceived extends StatefulWidget {
  @override
  _PharReceived createState() => _PharReceived();
}

class _PharReceived extends State<PharReceived> {
  User user;
  User userData;
  QuerySnapshot snapshot;
  List<Recap>_recap = [];

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  getUserData() async {
    userData = FirebaseAuth.instance.currentUser;
    snapshot = await FirebaseFirestore.instance.collection('recap').get();
    snapshot.docs.forEach((document) {
      Recap presc = Recap.fromJson (document.data());
      setState(() {
        if(userData.uid == presc.pharmacyId){
          _recap.add(presc);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text("APOTECH"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.account_circle), 
            onPressed:() {
              Navigator.push(context, MaterialPageRoute(builder: (context) => PharProfile()),);
            },
          ),
        ],
      ),
      body:  ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: _recap.length,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>   
                  PharDetail(recap: _recap[index])),); //To get prescription detail for the patient
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                    colors: <Color>[Color(0xFF13E3D2), Colors.cyan],
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
                              child: Text('${_recap[index].patientName}',
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
                              child: Text('${_recap[index].date}',
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
    );
  }
}