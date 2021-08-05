import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:start_trial/doctor/doctor_main.dart';
import 'package:start_trial/patient/patient_main.dart';
import 'package:start_trial/pharmacy/pharmacy_mainpage.dart';

class DoctorProfile extends StatefulWidget {

  @override
  _DoctorProfileState createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  
  String imagePath;
  String namas;
  User userData;
  final userPref = GetStorage();

  getUserData() async {
    userData = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance.collection("profileInfo").doc(userData.uid).snapshots().listen((event) {
      setState(() {
        namas = event.get('nama');
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getUserData();
    
  }

   @override
  Widget build(BuildContext context) {
    print(userPref.read('users'));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[ 
                Container(
                  margin: EdgeInsets.only(left:15, right:15),
                  height: MediaQuery.of(context).size.height/2.0,
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    image: DecorationImage(
                      image: AssetImage("assets/hello.jpg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Text(
                    'Halo ${userPref.read('users')}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Container(
                    width: 180.0,
                    height: 36.0,
                    child: RaisedButton(
                      onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PatMain()),);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0),
                      ),
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[Color(0xFF13E3D2), Color(0xFF5D74E2)],
                          ),
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'HALO!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}