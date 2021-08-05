// automatic add medicine

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:start_trial/doctor/doctor_search.dart';

// import 'doctor_profile.dart';

// class DocPresc extends StatefulWidget {
//   @override
//   _DocPrescState createState() => _DocPrescState();
// }

// class _DocPrescState extends State<DocPresc> {
//   var selectedMedicine;
//   var selectedMedicine1;
//   var selectedMedicine2;
//   List<Map> medicineList = [{'medName' : ' ', 'medQty' : new TextEditingController()}];


//   User user;
//   User userData;
//   String uid ; //Added uid variable
//   var value;
//   String namas;
//   String sipnum;
//   String uidnum;
//   String patientName = 'Cari Nama Pasien';
//   String patientId = '';

//   getUserData() async {
//     userData = FirebaseAuth.instance.currentUser;
//     FirebaseFirestore.instance.collection("profileInfo").doc(userData.uid).snapshots().listen((event) {
//       setState(() {
//         namas = event.get('nama');
//         sipnum = event.get('nomor sip');
//         uidnum = event.get('nomor uid');
//       });
//     });
//   }

//   TextEditingController _qtymed1Controller = new TextEditingController();
//   TextEditingController _qtymed2Controller = new TextEditingController();
//   TextEditingController _qtymed3Controller = new TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     // fetchData();
//     getUserData();
//     medicineList.map((value){
//       value['medQty'].addListener((){});
//     });
//     // _qtymed1Controller.addListener(() { });
//     // _qtymed2Controller.addListener(() { });
//     // _qtymed3Controller.addListener(() { });
//   }

//   @override 
//   void dispose(){
//     super.dispose();
//     medicineList.map((value){
//       value['medQty'].dispose();
//     });
//     // _qtymed1Controller.dispose();
//     // _qtymed2Controller.dispose();
//     // _qtymed3Controller.dispose();
//   }

//   Widget _buildSearchField(){
//      return TextFormField(
//        readOnly: true,
//           decoration: InputDecoration(
//             prefixIcon: IconButton(
//               color: Colors.white,
//               icon: Icon(Icons.search,),
//               iconSize: 25.0,
//               onPressed: () async {
//                 final data = await Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => SearchPatient()),
//                 );
//                 setState((){
//                   patientName = data['nama'];
//                   patientId = data['nomor uid'];
//                 });
//             }
//             ),
//             contentPadding: EdgeInsets.only(left:25.0),
//             hintText: patientName,
//             hintStyle: TextStyle(color: Colors.white),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(4.0),
//             ),
//             labelStyle: TextStyle(color: Colors.white)
//           ),
//      );
//   }

//   @override
//   Widget build(BuildContext context) {

//     FirebaseFirestore firestore = FirebaseFirestore.instance;
//     CollectionReference prescription = firestore.collection('prescription');

//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             Container(
//               width: MediaQuery.of(context).size.width,
//               height: 210.0,
//               decoration: const BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: <Color>[Color(0xFF5D74E2), Color(0xFF13E3D2)],
//                 ),
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(40.0),
//                   bottomRight: Radius.circular(40.0)
//                 )
//               ),
//               child: Column(
//                 children: <Widget>[
//                   Padding(
//                     padding: const EdgeInsets.only(top:50.0, left: 50.0, right: 50.0),
//                     child: Row(
//                       children: <Widget>[
//                         Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             Text("$namas",
//                             style: TextStyle(color: Colors.white,
//                             fontSize: 20, fontWeight: FontWeight.bold),
//                             ),
//                             Padding(
//                               padding: EdgeInsets.only(top: 7.0),
//                               child: Text("Nomor SIP: $sipnum",
//                               style: TextStyle(color: Colors.white,
//                               fontWeight: FontWeight.bold),
//                               ),
//                             ),
//                           ],
//                         ),
//                         Spacer(),
//                         IconButton(
//                           icon: Icon(Icons.account_circle), 
//                           color: Colors.white,
//                           iconSize: 45.0,
//                           onPressed:() {
//                             Navigator.push(context, MaterialPageRoute(builder: (context) => DocProfile()),);
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: EdgeInsets.only(top: 15.0, left:18.0, right: 18.0),
//                     child: _buildSearchField(),)
//                 ],
//               ),
//             ),
//             SizedBox(height: 20.0,),
//             Padding(
//               padding: EdgeInsets.only(left: 120.0),
//               child: Row(
//                 children: <Widget>[
//                   Text("Resep Obat",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 20
//                   ),
//                   textAlign: TextAlign.center,)
//                 ],
//               ),
//             ),
//             Padding(padding: EdgeInsets.only(top: 10.0),
//             child: Text('Resep HARUS Diisi Dengan Benar', 
//             textAlign: TextAlign.center,)
//             ),
//             //RESEP OBAT
//             SizedBox(height: 20.0,),
//             Container(
//             // height: 200.0,
//             child: ListView.builder(
//               shrinkWrap: true,
//               primary: false,
//               itemCount: medicineList.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return Container(
//                   padding: EdgeInsets.only(left: 20.0, right: 20.0),
//                   child: FutureBuilder<QuerySnapshot>(
//                     future: FirebaseFirestore.instance.collection("medicine").get(),
//                     builder: (context,snapshot) {
//                       List<DropdownMenuItem> medicineItems=[];
//                       List dataObat = [];
//                     if(snapshot.hasData){
//                       for (var item in snapshot.data.docs) {
//                         // print("data -> ${item.data()}");
//                         dataObat.add(item);
//                       }
//                       // medicineItems.add(snapshot.data.)
//                     for(int i=0; i<dataObat.length;i++){
//                       var snap = dataObat[i]['nama'];
//                       print(snap.toString());
//                       medicineItems.add(
//                         DropdownMenuItem(
//                           child: Text(
//                             snap.toString(),
//                             style: TextStyle(color: Colors.lightBlue),
//                             ),
//                           value: snap.toString(),
//                         )
//                       );
//                     }
//                     print(medicineItems);
//                     return Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         Icon(Icons.medical_services, size:25.0, color: Colors.blue),
//                         SizedBox(width:10.0),
//                         DropdownButton(
//                           items: medicineItems,
//                           onChanged:(medicineValue){
//                             print('X');
//                             print(medicineValue);
//                             final snackBar = SnackBar(
//                               content: 
//                                 Text('Obat pertama yang terpilih adalah $medicineValue', 
//                                 style: TextStyle(color: Colors.white),
//                                 ),
//                                 backgroundColor: Colors.blue,
//                             );
//                             setState(() {
//                               medicineList[index]['medName'] = medicineValue;
//                             });
//                           ScaffoldMessenger.of(context).showSnackBar(snackBar);
//                           },
//                           value: medicineList[index]['medName'],
//                           isExpanded:false,
//                           hint: new Text("Pilih Obat", style:TextStyle(color: Colors.black)
//                               ),
//                             ),
//                           Spacer(),
//                           Expanded(
//                           child: TextField(
//                             controller: medicineList[index]['medQty'],
//                             maxLines: 1,
//                             // controller: widget.quantityController,
//                             keyboardType: TextInputType.text,
//                             autofocus: false,
//                             decoration: InputDecoration(
//                               filled: true,
//                               fillColor: Colors.white,
//                               hintText: 'Qty',
//                             )
//                           ),
//                         ),
//                       ],
//                     );
//                     } else {
//                       return Center(child: CircularProgressIndicator(),);
//                     }
//                 },
//               ),
//             );
//               }),
//             ),
                
//             // Container(
//             //       padding: EdgeInsets.only(left: 20.0, right: 20.0),
//             //       child: FutureBuilder<QuerySnapshot>(
//             //         future: FirebaseFirestore.instance.collection("medicine").get(),
//             //         builder: (context,snapshot) {
//             //           List<DropdownMenuItem> medicineItems=[];
//             //           List dataObat = [];
//             //         if(snapshot.hasData){
//             //           for (var item in snapshot.data.docs) {
//             //             // print("data -> ${item.data()}");
//             //             dataObat.add(item);
//             //           }
//             //           // medicineItems.add(snapshot.data.)
//             //         for(int i=0; i<dataObat.length;i++){
//             //           var snap = dataObat[i]['nama'];
//             //           medicineItems.add(
//             //             DropdownMenuItem(
//             //               child: Text(
//             //                 snap.toString(),
//             //                 style: TextStyle(color: Colors.lightBlue),
//             //                 ),
//             //               value: snap.toString(),
//             //             )
//             //           );
//             //         }
//             //         return Row(
//             //           mainAxisAlignment: MainAxisAlignment.center,
//             //           children: <Widget>[
//             //             Icon(Icons.medical_services, size:25.0, color: Colors.blue),
//             //             SizedBox(width:10.0),
//             //             DropdownButton(
//             //               items: medicineItems,
//             //               onChanged:(medicineValue){
//             //                 final snackBar = SnackBar(
//             //                   content: 
//             //                     Text('Obat kedua yang terpilih adalah $medicineValue', 
//             //                     style: TextStyle(color: Colors.white),
//             //                     ),
//             //                     backgroundColor: Colors.blue,
//             //                 );
//             //                 setState(() {
//             //                   selectedMedicine1=medicineValue;
//             //                 });
//             //               ScaffoldMessenger.of(context).showSnackBar(snackBar);
//             //               },
//             //               value: selectedMedicine1,
//             //               isExpanded:false,
//             //               hint: new Text("Pilih Obat", style:TextStyle(color: Colors.black)
//             //                   ),
//             //                 ),
//             //               Spacer(),
//             //               Expanded(
//             //               child: TextField(
//             //                 controller: _qtymed2Controller,
//             //                 maxLines: 1,
//             //                 // controller: widget.quantityController,
//             //                 keyboardType: TextInputType.text,
//             //                 autofocus: false,
//             //                 decoration: InputDecoration(
//             //                   filled: true,
//             //                   fillColor: Colors.white,
//             //                   hintText: 'Qty',
//             //                 )
//             //               ),
//             //             ),
//             //           ],
//             //         );
//             //         } else {
//             //           return Center(
//             //             child: CircularProgressIndicator(),
//             //             );
//             //         }
//             //     },
//             //   ),
//             // ),
//             // Container(
//             //     padding: EdgeInsets.only(left: 20.0, right: 20.0),
//             //     child: FutureBuilder<QuerySnapshot>(
//             //       future: FirebaseFirestore.instance.collection("medicine").get(),
//             //       builder: (context,snapshot) {
//             //         List<DropdownMenuItem> medicineItems=[];
//             //         List dataObat = [];
//             //       if(snapshot.hasData){
//             //         for (var item in snapshot.data.docs) {
//             //           // print("data -> ${item.data()}");
//             //           dataObat.add(item);
//             //         }
//             //         // medicineItems.add(snapshot.data.)
//             //       for(int i=0; i<dataObat.length;i++){
//             //         var snap = dataObat[i]['nama'];
//             //         medicineItems.add(
//             //           DropdownMenuItem(
//             //             child: Text(
//             //               snap.toString(),
//             //               style: TextStyle(color: Colors.lightBlue),
//             //               ),
//             //             value: snap.toString(),
//             //           )
//             //         );
//             //       }
//             //       return Row(
//             //         mainAxisAlignment: MainAxisAlignment.center,
//             //         children: <Widget>[
//             //           Icon(Icons.medical_services, size:25.0, color: Colors.blue),
//             //           SizedBox(width:10.0),
//             //           DropdownButton(
//             //             items: medicineItems,
//             //             onChanged:(medicineValue){
//             //               final snackBar = SnackBar(
//             //                 content: 
//             //                   Text('Obat kedua yang terpilih adalah $medicineValue', 
//             //                   style: TextStyle(color: Colors.white),
//             //                   ),
//             //                   backgroundColor: Colors.blue,
//             //               );
//             //               setState(() {
//             //                 selectedMedicine2=medicineValue;
//             //               });
//             //             ScaffoldMessenger.of(context).showSnackBar(snackBar);
//             //             },
//             //             value: selectedMedicine2,
//             //             isExpanded:false,
//             //             hint: new Text("Pilih Obat", style:TextStyle(color: Colors.black)
//             //                 ),
//             //               ),
//             //             Spacer(),
//             //             Expanded(
//             //             child: TextField(
//             //               controller: _qtymed3Controller,
//             //               maxLines: 1,
//             //               // controller: widget.quantityController,
//             //               keyboardType: TextInputType.text,
//             //               autofocus: false,
//             //               decoration: InputDecoration(
//             //                 filled: true,
//             //                 fillColor: Colors.white,
//             //                 hintText: 'Qty',
//             //               )
//             //             ),
//             //           ),
//             //         ],
//             //       );
//             //       } else {
//             //         return Center(
//             //           child: CircularProgressIndicator(),
//             //           );
//             //       }
//             //     },
//             //   ),
//             // ),
//           Padding(padding: const EdgeInsets.all(20),
//               child: RaisedButton(
//               onPressed: () {
//                 prescription.add({
//                   'nama dokter': '$namas', 
//                   'id dokter': '$uidnum',
//                   'nama pasien': '$patientName',
//                   'id pasien': '$patientId',
//                   'obat' : 
//                     medicineList.map((value) {
//                       return {
//                         'medName' : value['medName'],
//                         'medQty' : value['medQty'].text,
//                       };
//                     }).toList()
//                   // {
//                     // 'obat 1': '$selectedMedicine', 
//                     // 'jumlah 1': _qtymed1Controller.text,
//                     // 'obat 2': '$selectedMedicine1',
//                     // 'jumlah 2': _qtymed2Controller.text,
//                     // 'obat 3': '$selectedMedicine2',
//                     // 'jumlah 3': _qtymed3Controller.text
//                 // }
//                 }
//                 );
//                 },
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(80.0),
//                 ),
//                   padding: const EdgeInsets.all(0.0),
//                     child: Container(
//                       decoration: const BoxDecoration(
//                         gradient: LinearGradient(
//                           colors: <Color>[Color(0xFF13E3D2), Color(0xFF5D74E2)],
//                         ),
//                         borderRadius: BorderRadius.all(
//                           Radius.circular(80.0),
//                         ),
//                       ),
//                       constraints: const BoxConstraints(
//                         minWidth: 150.0, 
//                         minHeight: 36.0,
//                       ),
//                       alignment: Alignment.center,
//                       child: const Text(
//                         'KIRIM',
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                         color: Colors.white,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               IconButton(
//               icon: Icon(Icons.add),
//               onPressed:() {
//                 medicineList.add({
//                   'medName' : ' ', 
//                   'medQty' : new TextEditingController()
//                 });
//                 setState(() {
//                 });
//                 medicineList[medicineList.length-1]['medQty'].addListener(() {});
//               },
//             ),
//             IconButton(
//               icon: Icon(Icons.delete),
//               onPressed:() { 
//                 medicineList[medicineList.length-1]['medQty'].dispose();
//                 medicineList.removeLast();
//                 setState(() {
//                 });
//               },
//             ),
//           ]),
//       ),
//      );
//   }
// }