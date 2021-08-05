import 'package:flutter/material.dart';
import 'package:start_trial/model/prescription.dart';
import 'package:start_trial/patient/patient_pickup.dart';

class PatDetail extends StatelessWidget {

  final Prescription prescription;

  PatDetail({Key key, this.prescription}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('APOTECH'),
        backgroundColor: Colors.orangeAccent,
        ),
        body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top:10.0, left: 10.0, right: 10.0),
              child: Text('Silahkan Tekan Kotak Obat Untuk Menebus Obat Yang Tertera',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
              ),
            Padding(
              padding: EdgeInsets.only(top:10.0, left: 10.0, right: 10.0),
              child: Text('${prescription.tanggal}',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.orangeAccent, fontWeight: FontWeight.bold, fontSize: 16),),
              ),
            Padding(
              padding: EdgeInsets.only(top:10.0, left: 10.0, right: 10.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.all(Radius.circular(8))
                ),
                child: Center(
                  child: TextField(
                    enabled: false,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.switch_account,
                      color: Colors.black,),
                      labelText: '${prescription.namaDokter}',
                      labelStyle: TextStyle(color: Colors.black, fontSize: 16),
                      border: InputBorder.none,
                    ),
                  ),
                ),),
              ),
              Padding(
              padding: EdgeInsets.only(top:10.0, left: 10.0, right: 10.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.all(Radius.circular(8))
                ),
                child: Center(
                  child: TextField(
                    enabled: false,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.supervisor_account,
                      color: Colors.black,),
                      labelText: '${prescription.namaPasien}',
                      labelStyle: TextStyle(color: Colors.black, fontSize: 16),
                      border: InputBorder.none,
                    ),
                  ),
                ),),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                child: RaisedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => 
                    PickUp(prescription: prescription, medicineName: prescription.obat.obat1,
                    medicineQty: prescription.obat.jumlah1)),);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[Color(0xFF13E3D2), Colors.orangeAccent],
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                     child: TextField(
                    enabled: false,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.list,
                      color: Colors.black,),
                      labelText: 'Nama Obat: ${prescription.obat.obat1} \n Jumlah: ${prescription.obat.jumlah1}',
                      labelStyle: TextStyle(color: Colors.black, fontSize: 16),
                      border: InputBorder.none,
                      suffixIcon: Icon(Icons.arrow_forward,
                      color: Colors.black)
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              if (prescription.obat.obat2 != ' ')
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                child: RaisedButton(
                  onPressed: (){ 
                    Navigator.push(context, MaterialPageRoute(builder: (context) => 
                    PickUp(prescription: prescription, medicineName: prescription.obat.obat2,
                    medicineQty: prescription.obat.jumlah2)),);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[Color(0xFF13E3D2), Colors.orangeAccent],
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,
                     child: TextField(
                    enabled: false,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.list,
                      color: Colors.black,),
                      labelText: 'Nama Obat: ${prescription.obat.obat2} \n Jumlah: ${prescription.obat.jumlah2}',
                      labelStyle: TextStyle(color: Colors.black, fontSize: 16),
                      border: InputBorder.none,
                      suffixIcon: Icon(Icons.arrow_forward,
                      color: Colors.black)
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (prescription.obat.obat3 != ' ')
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: RaisedButton(
                onPressed: (){ 
                  Navigator.push(context, MaterialPageRoute(builder: (context) => 
                  PickUp(prescription: prescription, medicineName: prescription.obat.obat3,
                  medicineQty: prescription.obat.jumlah3)),);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[Color(0xFF13E3D2), Colors.orangeAccent],
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                    child: TextField(
                  enabled: false,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.list,
                    color: Colors.black,),
                    labelText: 'Nama Obat: ${prescription.obat.obat3} \n Jumlah: ${prescription.obat.jumlah3}',
                    labelStyle: TextStyle(color: Colors.black, fontSize: 16),
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.arrow_forward,
                    color: Colors.black)
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (prescription.obat.obat4 != ' ')
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: RaisedButton(
                onPressed: (){ 
                  Navigator.push(context, MaterialPageRoute(builder: (context) => 
                  PickUp(prescription: prescription, medicineName: prescription.obat.obat4,
                  medicineQty: prescription.obat.jumlah4)),);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[Color(0xFF13E3D2), Colors.orangeAccent],
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                    child: TextField(
                  enabled: false,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.list,
                    color: Colors.black,),
                    labelText: 'Nama Obat: ${prescription.obat.obat4} \n Jumlah: ${prescription.obat.jumlah4}',
                    labelStyle: TextStyle(color: Colors.black, fontSize: 16),
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.arrow_forward,
                    color: Colors.black)
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (prescription.obat.obat5 != ' ')
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: RaisedButton(
                onPressed: (){ 
                  Navigator.push(context, MaterialPageRoute(builder: (context) => 
                  PickUp(prescription: prescription, medicineName: prescription.obat.obat5,
                  medicineQty: prescription.obat.jumlah2)),);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(0.0),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[Color(0xFF13E3D2), Colors.orangeAccent],
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  alignment: Alignment.center,
                    child: TextField(
                  enabled: false,
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.list,
                    color: Colors.black,),
                    labelText: 'Nama Obat: ${prescription.obat.obat5} \n Jumlah: ${prescription.obat.jumlah5}',
                    labelStyle: TextStyle(color: Colors.black, fontSize: 16),
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.arrow_forward,
                    color: Colors.black)
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    )
    );
  }
}