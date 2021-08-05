import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:start_trial/model/medicine.dart';
import 'package:start_trial/patient/patient_main.dart';

class PatRecap extends StatefulWidget {

  final prescription;
  final String medicineName;
  final String pharmacyName;
  final String pharmacyPhone;
  final String pharmacyId;
  final String medicineQty;

  PatRecap({Key key, this.prescription, this.medicineName, this.pharmacyName, this.pharmacyPhone, this.pharmacyId, this.medicineQty}) : super(key: key);

  @override
  _PatRecapState createState() => _PatRecapState();
}

class _PatRecapState extends State<PatRecap> {
  var prescription;
  bool isLoading = false;
  User userData;
  String doctorName;
  String doctorId;
  String patientName;
  String patientId;
  String pharName;
  String pharId;
  String pharPhone;
  String medName;
  String medQty;
  String medDesc;
  String medDose;
  String rName;
  String rAddress;
  String rPhone;
  
  List<Medicine>_medicine = [];
  Map<int, bool> itemsSelectedValue = Map();
  final _formKey = GlobalKey<FormState>();
  final userPref = GetStorage();
  QuerySnapshot snapshot;

  @override
  void initState() {
    super.initState();
    // getMedicineData();
    prescription = widget.prescription;
  }

  Future getMedicineData() async {
    setState(() {
          isLoading = true;
        });
    userData = FirebaseAuth.instance.currentUser;
    snapshot = await FirebaseFirestore.instance.collection('medicine').get();
    snapshot.docs.forEach((document) {
      Medicine medicine = Medicine.fromMap(document.data());
      setState(() {
        if(medicine.name == widget.medicineName){
          _medicine.add(medicine);
        }
      });
      setState(() {
      isLoading = false;
            });
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _raddressController = new TextEditingController();

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference recap = firestore.collection('recap');

    print('Nama: ${_medicine[0].description}');
    print('Dose: ${_medicine[0].dose}');

    return Scaffold(
      appBar: AppBar(
        title: Text("APOTECH"),
        backgroundColor: Colors.orangeAccent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed:() {
              Navigator.push(context, MaterialPageRoute(builder: (context) => PatMain()),);
            },
          ),
        ],
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection('medicine').get(),
        builder: (context, snapshot) {
          if(snapshot.hasData){
            final result = snapshot.data;
            for (var item in result.docs) {
              Medicine medicine = Medicine.fromMap(item.data());
              if(medicine.name == widget.medicineName){
                _medicine.add(medicine);
              }
            }
            doctorName = '${prescription.namaDokter}';
            doctorId = '${prescription.idDokter}';
            patientName = '${prescription.namaPasien}';
            patientId = '${prescription.idPasien}';
            pharName = '${widget.pharmacyName}';
            pharId = '${widget.pharmacyId}';
            pharPhone = '${widget.pharmacyPhone}';
            medName = '${widget.medicineName}';
            medQty = '${widget.medicineQty}';
            medDesc = '${_medicine[0].description}';
            medDose = '${_medicine[0].dose}';
            rName = '${userPref.read('users')}';
            rAddress = _raddressController.text;
            rPhone = '${userPref.read('pharnum')}';

             return SingleChildScrollView ( 
        child:
        Column(
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                height: 120.0,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[Colors.orangeAccent, Color(0xFF13E3D2)],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0)
                  )
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top:25.0, left: 50.0, right: 50.0),
                      child: Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("${widget.pharmacyName}",
                              style: TextStyle(color: Colors.white,
                              fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 15.0),
                                child: Text("${prescription.namaPasien}",
                                style: TextStyle(color: Colors.white,fontSize: 16,
                                fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
                SizedBox(height: 20.0,),
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: <Widget>[
                      Text("Resep Obat Diterima Dari ${prescription.namaDokter}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14
                      ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 15.0,),
                Container(
                padding: EdgeInsets.only(left: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.medical_services, 
                        size:25.0, 
                        color: Colors.blue),
                      SizedBox(width:10.0),
                      Text('${widget.medicineName}'),
                        Spacer(),
                        Expanded(
                        child: Padding(padding: EdgeInsets.only(right: 50.0),
                        child: Text('${widget.medicineQty}',
                        textAlign: TextAlign.right),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 25.0,),
                Container(
                padding: EdgeInsets.only(left: 25.0, right: 25.0),
                child: Text('HARAP DIBACA SEBAGAI PANDUAN PENGGUNAAN OBAT!', 
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                  )
                ),
                SizedBox(height: 20.0,),
                Text('Deskripsi Obat',
                style: TextStyle(fontWeight: FontWeight.bold),),
                Container(
                padding: EdgeInsets.only(top: 10.0, left: 25.0, right: 25.0),
                child: 
                Text('$medDesc',
                textAlign: TextAlign.justify,)
              ),
              SizedBox(height: 20.0,),
              Text('Cara Penggunaan Obat',
              style: TextStyle(fontWeight: FontWeight.bold)
              ),
                Container(
                padding: EdgeInsets.only(top: 10.0, left: 25.0, right: 25.0),
                child: 
                Text('$medDose')
              ),
              SizedBox(height: 25.0,),
                Container(
                padding: EdgeInsets.only(left: 25.0, right: 25.0),
                child: Text('Silahkan Mengisi Alamat Penerima Dengan BENAR', 
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                  )
                ),
              Form(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                      Container(
                      padding: EdgeInsets.only(left: 25.0, right: 25.0),
                      child: 
                        TextField(
                        controller: _raddressController,
                        keyboardType: TextInputType.multiline,
                        autofocus: false,
                        decoration: InputDecoration(
                          labelText: 'Alamat Penerima',
                          hintText: 'Tuliskan Beserta Kota, Kabupaten, dan Kode Pos'
                        ),
                        style: TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            Padding(padding: const EdgeInsets.all(20),
                child: RaisedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PatMain()),);
                  recap.add({
                    //add information to firebase and make it into the recap model so 
                    //it can be sent like a doctor's prescription to a patient
                    'tanggal' : DateTime.now().toString().substring(0,16),
                    'nama dokter':  '$doctorName', 
                    'id dokter': '$doctorId',
                    'nama pasien': '$patientName',
                    'id pasien': '$patientId',
                    'nama farmasi': '$pharName',
                    'id farmasi' : '$pharId',
                    'nomor farmasi': '$pharPhone',
                    'nama obat' : '$medName',
                    'jumlah obat' : '$medQty', 
                    'deskripsi' : '$medDesc',
                    'dosis obat' : '$medDose',
                    'nama penerima' : '$rName',
                    'alamat penerima' : _raddressController.text,
                    'nomor penerima' : '$rPhone'
                    });
                  },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(80.0),
                  ),
                    padding: const EdgeInsets.all(0.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[Color(0xFF13E3D2), Colors.orangeAccent],
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
                
          ],
        )
    );
          } else {
            return Center(
              child:CircularProgressIndicator());
          }
        },
      )
    );
  }
}