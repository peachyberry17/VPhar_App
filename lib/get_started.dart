import 'package:flutter/material.dart';
import 'package:start_trial/login_page.dart';
import 'package:start_trial/pharmacy/pharmacy_signin.dart';
import 'package:start_trial/status_registration.dart';

class GetStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFFFFFFF),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //ATTACH IMAGE
            Container(
              margin: EdgeInsets.only(top: 10),
              height: MediaQuery.of(context).size.height / 2.0,
              decoration: BoxDecoration(
                color: Colors.white10,
                image: DecorationImage(
                  image: AssetImage("assets/logo.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            //ATTACH TEXT
            Padding(
              padding: const EdgeInsets.only(left:2.0, right:2.0),
              child: Text(
              "BELI DI APOTECH",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF53714B),
                  fontSize: 18),
            ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                "Mengubah Resep Menjadi Obat Secara Praktis!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF53714B),
                  fontSize: 16,
                ),
              ),
            ),
            //ATTACH BUTTON
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterStatus()),);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80.0),
                ),
                padding: const EdgeInsets.all(0.0),
                //
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
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 20),

              child: RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PharmacyLogin()),);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80.0),
                ),
                padding: const EdgeInsets.all(0.0),
                //
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
            ),
          ],
        ),
      ),
    );
  }
}