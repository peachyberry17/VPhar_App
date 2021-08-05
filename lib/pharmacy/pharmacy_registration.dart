import 'package:flutter/material.dart';
import 'package:start_trial/services/auth_services.dart';

class PharmacyRegister extends StatefulWidget {
  @override
  _PharmacyRegisterState createState() => _PharmacyRegisterState();
}

class _PharmacyRegisterState extends State<PharmacyRegister> {
  final formKey = GlobalKey<FormState>();

  // static AuthServices _auth = AuthServices();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _sipController = TextEditingController();
  TextEditingController _bpjsController = TextEditingController();
  TextEditingController _siaController = TextEditingController();
  TextEditingController _placeController = TextEditingController();
  TextEditingController _jobController = TextEditingController();
  TextEditingController _agencyController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _roleController = TextEditingController();
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
                      "REGISTRASI FARMASI",
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
                          controller: _nameController,
                          validator: (value){
                          if (value.isEmpty) {
                          return 'Nama Harus Diisi Secara Lengkap Beserta Gelar';
                          } else
                            return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Nama Lengkap',
                          ),
                        ),
                        TextFormField(
                          controller: _siaController,
                          validator: (value){
                          if (value.length<8){
                          return 'Harus Berupa Nomor Dan 8 Karakter';
                          } else
                          return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Nomor SIA/SIPA',
                          ),
                        ),
                        TextFormField(
                          controller: _agencyController,
                          validator: (value){
                          if (value.isEmpty){
                          return 'Harus Diisi Secara Lengkap';
                          } else
                          return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Instansi Pelayanan',
                          ),
                        ),
                        TextFormField(
                          controller: _phoneController,
                          validator: (value){
                          if (value.length<12){
                          return 'Harus Berupa Nomor';
                          } else
                          return null;
                          },
                          decoration: InputDecoration(
                            labelText: 'Nomor Telepon',
                          ),
                        ),
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
                          createUser();
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
                                  'DAFTAR',
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
                          
void createUser() async {
  dynamic result = await AuthServices.signUp(
     _emailController.text,  _agencyController.text, _nameController.text, _bpjsController.text, _siaController.text, _sipController.text, _phoneController.text, _jobController.text, _roleController.text='Farmasi', _placeController.text, _passwordController.text);
  if (result == null) {
    print('Email Tidak Valid');
  } else {
    print(result.toString());
    _nameController.clear();
    _siaController.clear();
    _phoneController.clear();
    _emailController.clear();
    _passwordController.clear();
    Navigator.pop(context);
  }
 }
}

