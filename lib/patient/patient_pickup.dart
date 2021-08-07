import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:start_trial/model/pharmacy.dart';
import 'package:start_trial/patient/patient_recap.dart';

class PickUp extends StatefulWidget {
  final prescription;
  final String medicineQty;
  final String medicineName;
  final String pharmacyName;
  final String pharmacyId;

  PickUp(
      {Key key,
      this.prescription,
      this.medicineName,
      this.pharmacyName,
      this.pharmacyId,
      this.medicineQty})
      : super(key: key);

  @override
  _PickUpState createState() => _PickUpState();
}

class _PickUpState extends State<PickUp> {
  User user;
  User userData;
  List<Pharmacy> _pharmacy = [];
  QuerySnapshot snapshot;

  @override
  void initState() {
    super.initState();
    getPharmacyData();
  }

  getPharmacyData() async {
    userData = FirebaseAuth.instance.currentUser;
    snapshot = await FirebaseFirestore.instance.collection('pharmacy').get();
    snapshot.docs.forEach((document) {
      Pharmacy medicine = Pharmacy.fromJson(document.data());
      setState(() {
        if (medicine.namaObat == widget.medicineName) {
          _pharmacy.add(medicine);
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
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20, top: 20, right: 20),
            child: Text(
              'Silahkan Memilih Farmasi Sebagai Tempat Untuk Anda Menebus Obat',
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: _pharmacy.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PatRecap(
                                  prescription: widget.prescription,
                                  medicineName: widget.medicineName,
                                  medicineQty: widget.medicineQty,
                                  pharmacyName:
                                      _pharmacy[index].instansiPelayanan,
                                  pharmacyId: _pharmacy[index].idFarmasi,
                                  pharmacyPhone:
                                      _pharmacy[index].nomorTelepon)),
                        );
                      },
                      child: Container(
                        height: 50,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: <Color>[
                                  Color(0xFF13E3D2),
                                  Colors.orangeAccent
                                ],
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Center(
                                child: Text(
                              "${_pharmacy[index].instansiPelayanan}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                      ));
                }),
          ),
        ],
      ),
    );
  }
}
