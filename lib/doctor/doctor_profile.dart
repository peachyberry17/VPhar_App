import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DocProfile extends StatefulWidget {
  @override
  _DocProfileState createState() => _DocProfileState();
}

class _DocProfileState extends State<DocProfile> {
  User user;
  User userData;
  String emails;
  String agencies;
  String namas;
  String bpjsnum;
  String sianum;
  String sipnum;
  String number;
  String jobs;
  String places;
  String uidnum;

  // To get current user data
  getUserData() async {
    userData = FirebaseAuth.instance.currentUser;
    print('x');
    print(userData);
    print('y');
    print(userData.uid);
    FirebaseFirestore.instance.collection("profileInfo").doc(userData.uid).snapshots().listen((event) {
      setState(() {
        emails = event.get('email');
        agencies = event.get('instansi pelayanan');
        namas = event.get('nama');
        bpjsnum = event.get ('nomor bpjs');
        sianum = event.get('nomor sia');
        sipnum = event.get('nomor sip');
        number = event.get('nomor telepon');
        jobs = event.get('pekerjaan');
        places = event.get('tempat praktik');
      }
    );
  });
}

@override
void initState() {
  super.initState();
  getUserData();
}

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Column(
    children: <Widget> [
      Container(
        width: MediaQuery.of(context).size.width,
        height: 210.0,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[Color(0xFF5D74E2), Color(0xFF13E3D2)],
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40.0),
            bottomRight: Radius.circular(40.0)
          )
        ),
          padding: EdgeInsets.all(30.0),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage("assets/patprofile.jpg"),
                fit: BoxFit.contain
          ),
        ),
      ),
    ),
      SizedBox(height: 10.0),
      Padding(padding: EdgeInsets.only(left:10.0, right:10.0, top:5.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.lightBlue.shade300,
            borderRadius: BorderRadius.all(Radius.circular(8)
            ),
          ),
          child: Center(
            child: TextField(
              enabled: false,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.card_membership,
                color: Colors.black),
                labelText: 'Nama: $namas',
                labelStyle: TextStyle(color: Colors.black, fontSize: 16),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
      Padding(padding: EdgeInsets.only(left:10.0, right:10.0, top:5.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.lightBlue.shade300,
            borderRadius: BorderRadius.all(Radius.circular(8))
          ),
          child: Center(
            child: TextField(
              enabled: false,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.format_list_numbered,
                color: Colors.black,),
                labelText: 'Nomor SIP: $sipnum',
                labelStyle: TextStyle(color: Colors.black, fontSize: 16),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
      Padding(padding: EdgeInsets.only(left:10.0, right:10.0, top:5.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.lightBlue.shade300,
            borderRadius: BorderRadius.all(Radius.circular(8))
          ),
          child: Center(
            child: TextField(
              enabled: false,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.local_hospital,
                color: Colors.black,),
                labelText: 'Praktik: $places',
                labelStyle: TextStyle(color: Colors.black, fontSize: 16),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
      Padding(padding: EdgeInsets.only(left:10.0, right:10.0, top:5.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.lightBlue.shade300,
            borderRadius: BorderRadius.all(Radius.circular(8))
          ),
          child: Center(
            child: TextField(
              enabled: false,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.call,
                color: Colors.black,),
                labelText: 'Nomor Telepon: $number',
                labelStyle: TextStyle(color: Colors.black, fontSize: 16),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
      Padding(padding: EdgeInsets.only(left:10.0, right:10.0, top:5.0),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.lightBlue.shade300,
            borderRadius: BorderRadius.all(Radius.circular(8))
          ),
          child: Center(
            child: TextField(
              enabled: false,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email,
                color: Colors.black,),
                labelText: 'Alamat Email: $emails',
                labelStyle: TextStyle(color: Colors.black, fontSize: 16),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.all(20.0),
        child: RaisedButton(
        onPressed: (){
            Navigator.pop(context);
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
          constraints: const BoxConstraints(
            minWidth: 150.0, 
            minHeight: 36.0,
          ),
          alignment: Alignment.center,
          child: const Text(
            'Selesai',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),)
    ],
  ),
);
}
}