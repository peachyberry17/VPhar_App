import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:start_trial/services/auth_services.dart';
import 'package:start_trial/doctor/doctor_prescription.dart'; 
import 'package:start_trial/get_started.dart';
import 'doctor/doctor_profile.dart';
import 'notifier/medicine_notifier.dart'; 
import 'wrapper.dart'; 
import 'package:provider/provider.dart';
import 'services/medicine_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init('UserPref');
  // await UserPreferences.init();
  runApp(MyApp());
}

class  MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();

}

  class _MyAppState extends State<MyApp> {

  // @override
  // Future<void> initState () async {
  //   super.initState();
  //
  // }


  Widget build(BuildContext context) {
    //SIGN IN-SIGN UP
    return StreamProvider.value(
      value: AuthServices.firebaseUserStream,
      initialData: null, 
      child: MultiProvider(
        providers: [
        ChangeNotifierProvider(
          create: (context) => MedicineNotifier()
          ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: GetStarted(), //Wrapper
      ),
      ),
    );


    //   child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     home: MedicineList(), //Wrapper
    //   ),
    // );

// -------------WRAPPER-----------------
//  class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     //SIGN IN-SIGN UP
//     return StreamProvider.value(
//       value: AuthServices.firebaseUserStream,
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: GetStarted(), //Wrapper
//       ),
//     );
    //-----------------CRUD DATA----------------------
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: Scaffold(
    //     appBar: AppBar(title: Text("Firestore Demo"),),
    //       body: Container(
    //         child: Center(
    //           child: Column(
    //             mainAxisAlignment: MainAxisAlignment.center,
    //             children: <Widget>[
    //               RaisedButton(
    //                 child: Text("Add Data"),
    //                 onPressed: (){
    //                   DatabaseServices.createOrUpdateProduct("1", name:"Masker", price: 100000);
    //                 }),
    //                 RaisedButton(
    //                 child: Text("Edit Data"),
    //                 onPressed: (){
    //                   DatabaseServices.createOrUpdateProduct("1", name:"Masker", price: 200000);
    //                 }),
    //                 RaisedButton(
    //                 child: Text("Get Data"),
    //                 onPressed: () async {
    //                 DocumentSnapshot snapshot = await DatabaseServices.getProduct("1");
    //                 print(snapshot.data['nama']);
    //                 print(snapshot.data['harga']);
    //                 }),
    //                 RaisedButton(
    //                 child: Text("Delete Data"),
    //                 onPressed: (){
    //                   DatabaseServices.deleteProduct("1");
    //                 }),

    //             ],
    //           ),
    //         ),
    //     ),
    //   ),
    // );
  }
}

// -------------------IMAGE PICKER---------------------
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   String imagePath;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Firebase Storage Demo"),
//           ),
//           body: Container(
//             child: Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   (imagePath != null)
//                     ? Container(
//                       width: 200,
//                       height: 200,
//                       decoration: BoxDecoration(
//                         border: Border.all(color:Colors.black),
//                         shape: BoxShape.circle,
//                         image: DecorationImage(
//                           image:NetworkImage (imagePath),
//                         fit: BoxFit.cover
//                         ),
//                       ),
//                     )
//                     : Container(
//                       width: 200,
//                       height: 200,
//                       decoration: BoxDecoration(
//                         shape: BoxShape.circle,
//                         border: Border.all(color:Colors.black)),
//                     ),
//                     SizedBox(
//                       height: 10,),
//                       RaisedButton(
//                       child: Text("Sign In"), 
//                       onPressed: () async {
//                       AuthServices.signInAnonymous();
//                       }),
//                     RaisedButton(
//                       child: Text("Upload Image"), 
//                       onPressed: () async {
//                       File file = await getImage();
//                       imagePath = await DatabaseServices.uploadImage(file);

//                       setState(() {});
//                       }),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//     );
//   }
// }

// Future<File> getImage() async{
//   return await ImagePicker.pickImage(source: ImageSource.gallery);
// }