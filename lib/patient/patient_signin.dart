import 'package:flutter/material.dart';
import 'package:start_trial/doctor/doctor_image.dart';
import 'package:start_trial/patient/patient_main.dart';
import 'package:start_trial/services/auth_services.dart';

class PatientLogin extends StatefulWidget {
  @override
  _PatientLoginState createState() => _PatientLoginState();
}

class _PatientLoginState extends State<PatientLogin> {
  final formKey = GlobalKey<FormState>();

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
                        image: AssetImage("assets/pat.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 1),
                    child: Text(
                      "FORMULIR LOGIN PASIEN",
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
    _emailController.clear();
    _passwordController.clear();
    Navigator.push(context, MaterialPageRoute(builder: (context) => PatMain()),);
    print('Berhasil!');
  }
 }
}