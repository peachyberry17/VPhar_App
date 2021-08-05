import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:start_trial/get_started.dart';
import 'package:start_trial/model/Recap.dart';
import 'package:start_trial/patient/patient_presdetail.dart';
import 'package:start_trial/patient/patient_recapdetail.dart';

class PatSent extends StatefulWidget {
  @override
  _PatSent createState() => _PatSent();
}

class _PatSent extends State<PatSent> {
  User user;
  User userData;
  String uid ; //Added uid variable
  var value;
  List<Recap>_recap = [];
  Map<int, bool> itemsSelectedValue = Map();
  QuerySnapshot snapshot;
  final userPref = GetStorage();

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  getUserData() async {
    userData = FirebaseAuth.instance.currentUser;
     snapshot = await FirebaseFirestore.instance.collection('recap').get();
    snapshot.docs.forEach((document) {
      Recap presc = Recap.fromJson(document.data());
      setState(() {
        if(userData.uid == presc.patientId){
          _recap.add(presc);
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
            itemCount: _recap.length,
            itemBuilder: (BuildContext context, int index) {
              bool isCurrentIndexSelected = itemsSelectedValue[index] == null
                  ? false
                  : itemsSelectedValue[index];
              return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RecapDetail(recap:_recap[index])),);
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
                              child: Text('${_recap[index].pharmacyName}',
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
      )
    );
  }
}
