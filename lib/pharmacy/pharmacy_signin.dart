import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:start_trial/doctor/doctor_image.dart';
import 'package:start_trial/services/auth_services.dart';

class PharmacyLogin extends StatefulWidget {
  @override
  _PharmacyLoginState createState() => _PharmacyLoginState();
}

class _PharmacyLoginState extends State<PharmacyLogin> {
  final formKey = GlobalKey<FormState>();
  final userPref = GetStorage();

  // static AuthServices _auth = AuthServices();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFFFFFFF),
        child: SingleChildScrollView (
          child: Center(
            child: Form( 
              key:formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left:15, right:15),
                    height: MediaQuery.of(context).size.height/2.3,
                    decoration: BoxDecoration(
                      color: Colors.white10,
                      image: DecorationImage(
                        image: AssetImage("assets/pharmacy.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 1),
                    child: Text(
                      "FORMULIR LOGIN FARMASI",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        ),
                      ),
                    ),
                  Padding(
                    padding: EdgeInsets.only(top:1, left:20, right:20),
                  child: Column(
                      children: [
                        TextFormField(
                          controller: _emailController,
                          validator: (value){
                          if (!value.contains('@') || !value.contains('.com')){
                          return 'Email Tidak Valid';
                          } else
                          return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Alamat Email',
                            hintText: 'admin@gmail.com',
                          ),
                        ),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: true,
                          validator: (value){
                          if (value.length < 6){
                          return 'Password Minimal 6 Karakter';
                          } else
                          return null;
                          },
                          decoration: InputDecoration(
                            hintText: 'Masukkan Password',
                            labelText: 'Password'
                          ),
                        ),
                        RaisedButton(
                        onPressed: () {
                          if(formKey.currentState.validate()){
                          }
                          signInUser();
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
                                  'MASUK',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ),
                ],
            ),
          ),
        ),
      ),
    ),
  );
}

                          
void signInUser() async {
  dynamic authResult = await AuthServices.signIn(_emailController.text, _passwordController.text);
  if (authResult == null) {
    print('Gagal, Silahkan Coba Lagi!');
  } else {
    User userData;
    String namas;
    String useruid;
    String sipnum;
    String agencies;
    String pharnum;

    _emailController.clear();
    _passwordController.clear();
    userData = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance.collection("profileInfo").doc(userData.uid).snapshots().listen((event) {
        namas = event.get('nama');
        useruid = event.get('nomor uid');
        sipnum = event.get('nomor sip');
        agencies = event.get('instansi pelayanan');
        pharnum = event.get('nomor telepon');
      userPref.write('users', namas);
      userPref.write('uidpref', useruid);
      userPref.write('sippref', sipnum);
      userPref.write('agenpref', agencies);
      userPref.write('pharnum', pharnum);
      });
    // UserPreferences.setUserId(useruid);
    // UserPreferences.setUserName(namas);
    }
    Navigator.push(context, MaterialPageRoute(builder: (context) => DoctorProfile()),);
    print('Berhasil!');
  }
}