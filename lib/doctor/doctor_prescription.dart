import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:start_trial/doctor/doctor_search.dart';

import 'doctor_profile.dart';

class DocPresc extends StatefulWidget {
  @override
  _DocPrescState createState() => _DocPrescState();
}

class _DocPrescState extends State<DocPresc> {
  User user;
  User userData;
  String namas;
  String sipnum;
  String uidnum;
  String patientName = 'Cari Nama Pasien';
  String patientId = ' ';

  getUserData() async {
    userData = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance.collection("profileInfo").doc(userData.uid).snapshots().listen((event) {
      setState(() {
        namas = event.get('nama');
        sipnum = event.get('nomor sip');
        uidnum = event.get('nomor uid');
      });
    });
  }

  var selectedMedicine = ' ';
  var selectedMedicine1 = ' ';
  var selectedMedicine2 = ' ';
  var selectedMedicine3 = ' ';
  var selectedMedicine4 = ' ';
  // var selectedMedicine5 = ' ';
  // var selectedMedicine6 = ' ';
  // var selectedMedicine7 = ' ';
  // var selectedMedicine8 = ' ';
  // var selectedMedicine9 = ' ';

  TextEditingController _qtymed1Controller = new TextEditingController();
  TextEditingController _qtymed2Controller = new TextEditingController();
  TextEditingController _qtymed3Controller = new TextEditingController();
  TextEditingController _qtymed4Controller = new TextEditingController();
  TextEditingController _qtymed5Controller = new TextEditingController();
  // TextEditingController _qtymed6Controller = new TextEditingController();
  // TextEditingController _qtymed7Controller = new TextEditingController();
  // TextEditingController _qtymed8Controller = new TextEditingController();
  // TextEditingController _qtymed9Controller = new TextEditingController();
  // TextEditingController _qtymed10Controller = new TextEditingController();

  @override
  void initState() {
    super.initState();
    getUserData();
    _qtymed1Controller.addListener(() {});
    _qtymed2Controller.addListener(() {});
    _qtymed4Controller.addListener(() {});
    _qtymed5Controller.addListener(() {});
    // _qtymed6Controller.addListener(() {});
    // _qtymed7Controller.addListener(() {});
    // _qtymed8Controller.addListener(() {});
    // _qtymed9Controller.addListener(() {});
    // _qtymed10Controller.addListener(() {});

  }

  @override 
  void dispose(){
    super.dispose();
    _qtymed1Controller.dispose();
    _qtymed2Controller.dispose();
    _qtymed3Controller.dispose();
    _qtymed4Controller.dispose();
    _qtymed5Controller.dispose();
    // _qtymed6Controller.dispose();
    // _qtymed7Controller.dispose();
    // _qtymed8Controller.dispose();
    // _qtymed9Controller.dispose();
    // _qtymed10Controller.dispose();
  }

Widget _buildSearchField(){
  return TextFormField(
    readOnly: true,
      decoration: InputDecoration(
        prefixIcon: IconButton(
          color: Colors.white,
          icon: Icon(Icons.search),
          iconSize: 25.0,
          onPressed: () async {
            final data = await Navigator.push( context, MaterialPageRoute(builder: (context) => SearchPatient()),);
            setState((){
              patientName = data['nama'];
              patientId = data['nomor uid'];
            }
          );
        }),
        contentPadding: EdgeInsets.only(left:25.0),
        hintText: patientName,
        hintStyle: TextStyle(color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        labelStyle: TextStyle(
        color: Colors.white)
    ),
  );
}

@override
Widget build(BuildContext context) {

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference prescription = firestore.collection('prescription');

  return Scaffold(
    body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
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
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top:50.0, left: 50.0, right: 50.0),
                  child: Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("$namas",
                          style: TextStyle(color: Colors.white,
                          fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 7.0),
                            child: Text("Nomor SIP: $sipnum",
                            style: TextStyle(color: Colors.white,
                            fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(Icons.account_circle), 
                        color: Colors.white,
                        iconSize: 45.0,
                        onPressed:() {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => DocProfile()),);
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.0, left:18.0, right: 18.0),
                  child: _buildSearchField(),)
              ],
            ),
          ),
          SizedBox(height: 20.0,),
            Padding(
              padding: EdgeInsets.only(left: 120.0),
              child: Row(
                children: <Widget>[
                  Text("Resep Obat",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                  textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 10.0),
              child: Text('Silahkan Mengisi Resep Dengan BENAR', 
              textAlign: TextAlign.center)
            ),
          //Medicine dropdown and quantity text field in prescription on doctor page
          SizedBox(height: 20.0,),
            Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0),
              child: FutureBuilder<QuerySnapshot> (
                future: FirebaseFirestore.instance.collection("medicine").get(),
                builder: (context,snapshot) {
                  List<DropdownMenuItem> medicineItems=[];
                  List dataObat = [];
                if(snapshot.hasData) {
                  for (var item in snapshot.data.docs) {
                    dataObat.add(item);
                }
                for(int i=0; i<dataObat.length;i++) {
                  var snap = dataObat[i]['nama'];
                  medicineItems.add(
                    DropdownMenuItem(
                      child: Text(
                        snap.toString(),
                        style: TextStyle(color: Colors.lightBlue
                        ),
                      ),
                      value: snap.toString(),
                    )
                  );
                }
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(Icons.medical_services, size:25.0, color: Colors.blue),
                    SizedBox(width:10.0),
                      DropdownButton(
                        items: medicineItems,
                        onChanged:(medicineValue){
                          final snackBar = SnackBar(
                            content: 
                              Text('Obat pertama yang terpilih adalah $medicineValue', 
                              style: TextStyle(color: Colors.white),
                              ),
                            backgroundColor: Colors.blue,
                          );
                          setState(() {
                            selectedMedicine = medicineValue;
                          });
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        value: selectedMedicine,
                        isExpanded:false,
                        hint: new Text("Pilih Obat", 
                        style:TextStyle(color: Colors.black)
                        ),
                      ),
                      Spacer(),
                      Expanded(
                      child: TextField(
                        controller: _qtymed1Controller,
                        maxLines: 1,
                        keyboardType: TextInputType.text,
                        autofocus: false,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Qty',
                          )
                        ),
                      ),
                    ],
                  );
                } 
                else {
                  return Center(child: CircularProgressIndicator(),);
                }
              },
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20.0, right: 20.0),
            child: FutureBuilder<QuerySnapshot> (
              future: FirebaseFirestore.instance.collection("medicine").get(),
              builder: (context,snapshot) {
                List<DropdownMenuItem> medicineItems=[];
                List dataObat = [];
              if(snapshot.hasData) {
                for (var item in snapshot.data.docs) {
                  dataObat.add(item);
              }
              for(int i=0; i<dataObat.length;i++) {
                var snap = dataObat[i]['nama'];
                medicineItems.add(
                  DropdownMenuItem(
                    child: Text(
                      snap.toString(),
                      style: TextStyle(color: Colors.lightBlue
                      ),
                    ),
                    value: snap.toString(),
                  )
                );
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.medical_services, size:25.0, color: Colors.blue),
                  SizedBox(width:10.0),
                    DropdownButton(
                      items: medicineItems,
                      onChanged:(medicineValue){
                        final snackBar = SnackBar(
                          content: 
                            Text('Obat kedua yang terpilih adalah $medicineValue', 
                            style: TextStyle(color: Colors.white),
                            ),
                          backgroundColor: Colors.blue,
                        );
                        setState(() {
                          selectedMedicine1 = medicineValue;
                        });
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      value: selectedMedicine1,
                      isExpanded:false,
                      hint: new Text("Pilih Obat", 
                      style:TextStyle(color: Colors.black)
                      ),
                    ),
                    Spacer(),
                    Expanded(
                    child: TextField(
                      controller: _qtymed2Controller,
                      maxLines: 1,
                      keyboardType: TextInputType.text,
                      autofocus: false,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Qty',
                        )
                      ),
                    ),
                  ],
                );
              } 
              else {
                return Center(child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
          child: FutureBuilder<QuerySnapshot> (
            future: FirebaseFirestore.instance.collection("medicine").get(),
            builder: (context,snapshot) {
              List<DropdownMenuItem> medicineItems=[];
              List dataObat = [];
            if(snapshot.hasData) {
              for (var item in snapshot.data.docs) {
                dataObat.add(item);
            }
            for(int i=0; i<dataObat.length;i++) {
              var snap = dataObat[i]['nama'];
              medicineItems.add(
                DropdownMenuItem(
                  child: Text(
                    snap.toString(),
                    style: TextStyle(color: Colors.lightBlue
                    ),
                  ),
                  value: snap.toString(),
                )
              );
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.medical_services, size:25.0, color: Colors.blue),
                SizedBox(width:10.0),
                  DropdownButton(
                    items: medicineItems,
                    onChanged:(medicineValue){
                      final snackBar = SnackBar(
                        content: 
                          Text('Obat ketiga yang terpilih adalah $medicineValue', 
                          style: TextStyle(color: Colors.white),
                          ),
                        backgroundColor: Colors.blue,
                      );
                      setState(() {
                        selectedMedicine2 = medicineValue;
                      });
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    value: selectedMedicine2,
                    isExpanded:false,
                    hint: new Text("Pilih Obat", 
                    style:TextStyle(color: Colors.black)
                    ),
                  ),
                  Spacer(),
                  Expanded(
                  child: TextField(
                    controller: _qtymed3Controller,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Qty',
                      )
                    ),
                  ),
                ],
              );
            } 
            else {
              return Center(child: CircularProgressIndicator(),);
              }
            },
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
          child: FutureBuilder<QuerySnapshot> (
            future: FirebaseFirestore.instance.collection("medicine").get(),
            builder: (context,snapshot) {
              List<DropdownMenuItem> medicineItems=[];
              List dataObat = [];
            if(snapshot.hasData) {
              for (var item in snapshot.data.docs) {
                dataObat.add(item);
            }
            for(int i=0; i<dataObat.length;i++) {
              var snap = dataObat[i]['nama'];
              medicineItems.add(
                DropdownMenuItem(
                  child: Text(
                    snap.toString(),
                    style: TextStyle(color: Colors.lightBlue
                    ),
                  ),
                  value: snap.toString(),
                )
              );
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.medical_services, size:25.0, color: Colors.blue),
                SizedBox(width:10.0),
                  DropdownButton(
                    items: medicineItems,
                    onChanged:(medicineValue){
                      final snackBar = SnackBar(
                        content: 
                          Text('Obat keempat yang terpilih adalah $medicineValue', 
                          style: TextStyle(color: Colors.white),
                          ),
                        backgroundColor: Colors.blue,
                      );
                      setState(() {
                        selectedMedicine3 = medicineValue;
                      });
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    value: selectedMedicine3,
                    isExpanded:false,
                    hint: new Text("Pilih Obat", 
                    style:TextStyle(color: Colors.black)
                    ),
                  ),
                  Spacer(),
                  Expanded(
                  child: TextField(
                    controller: _qtymed4Controller,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Qty',
                      )
                    ),
                  ),
                ],
              );
            } 
            else {
              return Center(child: CircularProgressIndicator(),);
              }
            },
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
          child: FutureBuilder<QuerySnapshot> (
            future: FirebaseFirestore.instance.collection("medicine").get(),
            builder: (context,snapshot) {
              List<DropdownMenuItem> medicineItems=[];
              List dataObat = [];
            if(snapshot.hasData) {
              for (var item in snapshot.data.docs) {
                dataObat.add(item);
            }
            for(int i=0; i<dataObat.length;i++) {
              var snap = dataObat[i]['nama'];
              medicineItems.add(
                DropdownMenuItem(
                  child: Text(
                    snap.toString(),
                    style: TextStyle(color: Colors.lightBlue
                    ),
                  ),
                  value: snap.toString(),
                )
              );
            }
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.medical_services, size:25.0, color: Colors.blue),
                SizedBox(width:10.0),
                  DropdownButton(
                    items: medicineItems,
                    onChanged:(medicineValue){
                      final snackBar = SnackBar(
                        content: 
                          Text('Obat kelima yang terpilih adalah $medicineValue', 
                          style: TextStyle(color: Colors.white),
                          ),
                        backgroundColor: Colors.blue,
                      );
                      setState(() {
                        selectedMedicine4 = medicineValue;
                      });
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    value: selectedMedicine4,
                    isExpanded:false,
                    hint: new Text("Pilih Obat", 
                    style:TextStyle(color: Colors.black)
                    ),
                  ),
                  Spacer(),
                  Expanded(
                  child: TextField(
                    controller: _qtymed5Controller,
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText: 'Qty',
                      )
                    ),
                  ),
                ],
              );
            } 
            else {
              return Center(child: CircularProgressIndicator(),);
              }
            },
          ),
        ),
        // Container(
        //   padding: EdgeInsets.only(left: 20.0, right: 20.0),
        //   child: FutureBuilder<QuerySnapshot> (
        //     future: FirebaseFirestore.instance.collection("medicine").get(),
        //     builder: (context,snapshot) {
        //       List<DropdownMenuItem> medicineItems=[];
        //       List dataObat = [];
        //     if(snapshot.hasData) {
        //       for (var item in snapshot.data.docs) {
        //         dataObat.add(item);
        //     }
        //     for(int i=0; i<dataObat.length;i++) {
        //       var snap = dataObat[i]['nama'];
        //       medicineItems.add(
        //         DropdownMenuItem(
        //           child: Text(
        //             snap.toString(),
        //             style: TextStyle(color: Colors.lightBlue
        //             ),
        //           ),
        //           value: snap.toString(),
        //         )
        //       );
        //     }
        //     return Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: <Widget>[
        //         Icon(Icons.medical_services, size:25.0, color: Colors.blue),
        //         SizedBox(width:10.0),
        //           DropdownButton(
        //             items: medicineItems,
        //             onChanged:(medicineValue){
        //               final snackBar = SnackBar(
        //                 content: 
        //                   Text('Obat keenam yang terpilih adalah $medicineValue', 
        //                   style: TextStyle(color: Colors.white),
        //                   ),
        //                 backgroundColor: Colors.blue,
        //               );
        //               setState(() {
        //                 selectedMedicine5 = medicineValue;
        //               });
        //             ScaffoldMessenger.of(context).showSnackBar(snackBar);
        //             },
        //             value: selectedMedicine5,
        //             isExpanded:false,
        //             hint: new Text("Pilih Obat", 
        //             style:TextStyle(color: Colors.black)
        //             ),
        //           ),
        //           Spacer(),
        //           Expanded(
        //           child: TextField(
        //             controller: _qtymed6Controller,
        //             maxLines: 1,
        //             keyboardType: TextInputType.text,
        //             autofocus: false,
        //             decoration: InputDecoration(
        //               filled: true,
        //               fillColor: Colors.white,
        //               hintText: 'Qty',
        //               )
        //             ),
        //           ),
        //         ],
        //       );
        //     } 
        //     else {
        //       return Center(child: CircularProgressIndicator(),);
        //       }
        //     },
        //   ),
        // ),
        // Container(
        //   padding: EdgeInsets.only(left: 20.0, right: 20.0),
        //   child: FutureBuilder<QuerySnapshot> (
        //     future: FirebaseFirestore.instance.collection("medicine").get(),
        //     builder: (context,snapshot) {
        //       List<DropdownMenuItem> medicineItems=[];
        //       List dataObat = [];
        //     if(snapshot.hasData) {
        //       for (var item in snapshot.data.docs) {
        //         dataObat.add(item);
        //     }
        //     for(int i=0; i<dataObat.length;i++) {
        //       var snap = dataObat[i]['nama'];
        //       medicineItems.add(
        //         DropdownMenuItem(
        //           child: Text(
        //             snap.toString(),
        //             style: TextStyle(color: Colors.lightBlue
        //             ),
        //           ),
        //           value: snap.toString(),
        //         )
        //       );
        //     }
        //     return Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: <Widget>[
        //         Icon(Icons.medical_services, size:25.0, color: Colors.blue),
        //         SizedBox(width:10.0),
        //           DropdownButton(
        //             items: medicineItems,
        //             onChanged:(medicineValue){
        //               final snackBar = SnackBar(
        //                 content: 
        //                   Text('Obat ketujuh yang terpilih adalah $medicineValue', 
        //                   style: TextStyle(color: Colors.white),
        //                   ),
        //                 backgroundColor: Colors.blue,
        //               );
        //               setState(() {
        //                 selectedMedicine6 = medicineValue;
        //               });
        //             ScaffoldMessenger.of(context).showSnackBar(snackBar);
        //             },
        //             value: selectedMedicine6,
        //             isExpanded:false,
        //             hint: new Text("Pilih Obat", 
        //             style:TextStyle(color: Colors.black)
        //             ),
        //           ),
        //           Spacer(),
        //           Expanded(
        //           child: TextField(
        //             controller: _qtymed7Controller,
        //             maxLines: 1,
        //             keyboardType: TextInputType.text,
        //             autofocus: false,
        //             decoration: InputDecoration(
        //               filled: true,
        //               fillColor: Colors.white,
        //               hintText: 'Qty',
        //               )
        //             ),
        //           ),
        //         ],
        //       );
        //     } 
        //     else {
        //       return Center(child: CircularProgressIndicator(),);
        //       }
        //     },
        //   ),
        // ),
        // Container(
        //   padding: EdgeInsets.only(left: 20.0, right: 20.0),
        //   child: FutureBuilder<QuerySnapshot> (
        //     future: FirebaseFirestore.instance.collection("medicine").get(),
        //     builder: (context,snapshot) {
        //       List<DropdownMenuItem> medicineItems=[];
        //       List dataObat = [];
        //     if(snapshot.hasData) {
        //       for (var item in snapshot.data.docs) {
        //         dataObat.add(item);
        //     }
        //     for(int i=0; i<dataObat.length;i++) {
        //       var snap = dataObat[i]['nama'];
        //       medicineItems.add(
        //         DropdownMenuItem(
        //           child: Text(
        //             snap.toString(),
        //             style: TextStyle(color: Colors.lightBlue
        //             ),
        //           ),
        //           value: snap.toString(),
        //         )
        //       );
        //     }
        //     return Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: <Widget>[
        //         Icon(Icons.medical_services, size:25.0, color: Colors.blue),
        //         SizedBox(width:10.0),
        //           DropdownButton(
        //             items: medicineItems,
        //             onChanged:(medicineValue){
        //               final snackBar = SnackBar(
        //                 content: 
        //                   Text('Obat kedelapan yang terpilih adalah $medicineValue', 
        //                   style: TextStyle(color: Colors.white),
        //                   ),
        //                 backgroundColor: Colors.blue,
        //               );
        //               setState(() {
        //                 selectedMedicine7 = medicineValue;
        //               });
        //             ScaffoldMessenger.of(context).showSnackBar(snackBar);
        //             },
        //             value: selectedMedicine7,
        //             isExpanded:false,
        //             hint: new Text("Pilih Obat", 
        //             style:TextStyle(color: Colors.black)
        //             ),
        //           ),
        //           Spacer(),
        //           Expanded(
        //           child: TextField(
        //             controller: _qtymed8Controller,
        //             maxLines: 1,
        //             keyboardType: TextInputType.text,
        //             autofocus: false,
        //             decoration: InputDecoration(
        //               filled: true,
        //               fillColor: Colors.white,
        //               hintText: 'Qty',
        //               )
        //             ),
        //           ),
        //         ],
        //       );
        //     } 
        //     else {
        //       return Center(child: CircularProgressIndicator(),);
        //       }
        //     },
        //   ),
        // ),
        // Container(
        //   padding: EdgeInsets.only(left: 20.0, right: 20.0),
        //   child: FutureBuilder<QuerySnapshot> (
        //     future: FirebaseFirestore.instance.collection("medicine").get(),
        //     builder: (context,snapshot) {
        //       List<DropdownMenuItem> medicineItems=[];
        //       List dataObat = [];
        //     if(snapshot.hasData) {
        //       for (var item in snapshot.data.docs) {
        //         dataObat.add(item);
        //     }
        //     for(int i=0; i<dataObat.length;i++) {
        //       var snap = dataObat[i]['nama'];
        //       medicineItems.add(
        //         DropdownMenuItem(
        //           child: Text(
        //             snap.toString(),
        //             style: TextStyle(color: Colors.lightBlue
        //             ),
        //           ),
        //           value: snap.toString(),
        //         )
        //       );
        //     }
        //     return Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: <Widget>[
        //         Icon(Icons.medical_services, size:25.0, color: Colors.blue),
        //         SizedBox(width:10.0),
        //           DropdownButton(
        //             items: medicineItems,
        //             onChanged:(medicineValue){
        //               final snackBar = SnackBar(
        //                 content: 
        //                   Text('Obat kesembilan yang terpilih adalah $medicineValue', 
        //                   style: TextStyle(color: Colors.white),
        //                   ),
        //                 backgroundColor: Colors.blue,
        //               );
        //               setState(() {
        //                 selectedMedicine8 = medicineValue;
        //               });
        //             ScaffoldMessenger.of(context).showSnackBar(snackBar);
        //             },
        //             value: selectedMedicine8,
        //             isExpanded:false,
        //             hint: new Text("Pilih Obat", 
        //             style:TextStyle(color: Colors.black)
        //             ),
        //           ),
        //           Spacer(),
        //           Expanded(
        //           child: TextField(
        //             controller: _qtymed9Controller,
        //             maxLines: 1,
        //             keyboardType: TextInputType.text,
        //             autofocus: false,
        //             decoration: InputDecoration(
        //               filled: true,
        //               fillColor: Colors.white,
        //               hintText: 'Qty',
        //               )
        //             ),
        //           ),
        //         ],
        //       );
        //     } 
        //     else {
        //       return Center(child: CircularProgressIndicator(),);
        //       }
        //     },
        //   ),
        // ),
        // Container(
        //   padding: EdgeInsets.only(left: 20.0, right: 20.0),
        //   child: FutureBuilder<QuerySnapshot> (
        //     future: FirebaseFirestore.instance.collection("medicine").get(),
        //     builder: (context,snapshot) {
        //       List<DropdownMenuItem> medicineItems=[];
        //       List dataObat = [];
        //     if(snapshot.hasData) {
        //       for (var item in snapshot.data.docs) {
        //         dataObat.add(item);
        //     }
        //     for(int i=0; i<dataObat.length;i++) {
        //       var snap = dataObat[i]['nama'];
        //       medicineItems.add(
        //         DropdownMenuItem(
        //           child: Text(
        //             snap.toString(),
        //             style: TextStyle(color: Colors.lightBlue
        //             ),
        //           ),
        //           value: snap.toString(),
        //         )
        //       );
        //     }
        //     return Row(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: <Widget>[
        //         Icon(Icons.medical_services, size:25.0, color: Colors.blue),
        //         SizedBox(width:10.0),
        //           DropdownButton(
        //             items: medicineItems,
        //             onChanged:(medicineValue){
        //               final snackBar = SnackBar(
        //                 content: 
        //                   Text('Obat kesepuluh yang terpilih adalah $medicineValue', 
        //                   style: TextStyle(color: Colors.white),
        //                   ),
        //                 backgroundColor: Colors.blue,
        //               );
        //               setState(() {
        //                 selectedMedicine9 = medicineValue;
        //               });
        //             ScaffoldMessenger.of(context).showSnackBar(snackBar);
        //             },
        //             value: selectedMedicine9,
        //             isExpanded:false,
        //             hint: new Text("Pilih Obat", 
        //             style:TextStyle(color: Colors.black)
        //             ),
        //           ),
        //           Spacer(),
        //           Expanded(
        //           child: TextField(
        //             controller: _qtymed10Controller,
        //             maxLines: 1,
        //             keyboardType: TextInputType.text,
        //             autofocus: false,
        //             decoration: InputDecoration(
        //               filled: true,
        //               fillColor: Colors.white,
        //               hintText: 'Qty',
        //               )
        //             ),
        //           ),
        //         ],
        //       );
        //     } 
        //     else {
        //       return Center(child: CircularProgressIndicator(),);
        //       }
        //     },
        //   ),
        // ),
        Padding(padding: const EdgeInsets.all(20),
            child: RaisedButton(
            onPressed: () {
              prescription.add({
                'nama dokter': '$namas', 
                'id dokter': '$uidnum',
                'nama pasien': '$patientName',
                'id pasien': '$patientId',
                'tanggal' : DateTime.now().toString().substring(0,16),
                'obat' : {
                  'obat 1': '$selectedMedicine', 
                  'jumlah 1': _qtymed1Controller.text,
                  'obat 2': '$selectedMedicine1',
                  'jumlah 2': _qtymed2Controller.text,
                  'obat 3': '$selectedMedicine2',
                  'jumlah 3': _qtymed3Controller.text,
                  'obat 4': '$selectedMedicine3', 
                  'jumlah 4': _qtymed4Controller.text,
                  'obat 5': '$selectedMedicine4',
                  'jumlah 5': _qtymed5Controller.text,
                  // 'obat 6': '$selectedMedicine5',
                  // 'jumlah 6': _qtymed6Controller.text,
                  // 'obat 7': '$selectedMedicine6', 
                  // 'jumlah 7': _qtymed7Controller.text,
                  // 'obat 8': '$selectedMedicine7',
                  // 'jumlah 8': _qtymed8Controller.text,
                  // 'obat 9': '$selectedMedicine8',
                  // 'jumlah 9': _qtymed9Controller.text,
                  // 'obat 10': '$selectedMedicine9',
                  // 'jumlah 10': _qtymed10Controller.text
              }});
              },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(80.0),
              ),
                padding: const EdgeInsets.all(0.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[Color(0xFF13E3D2), Color(0xFF5D74E2)],
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(80.0),
                      ),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 150.0, 
                      minHeight: 36.0,
                    ),
                    alignment: Alignment.center,
                    child: const Text(
                      'KIRIM',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ]
        ),
      ),
    );
  }
}