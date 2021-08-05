import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:start_trial/notifier/medicine_notifier.dart';
import 'medicine_form.dart';

class MedicineDetail extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    MedicineNotifier medicineNotifier = Provider.of<MedicineNotifier>(context, listen:false);

    return Scaffold(
      appBar: AppBar(
        title: Text(medicineNotifier.currentMedicine.name),
      ),
        body: Center(
          child: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
            Image.network(medicineNotifier.currentMedicine.image),
            SizedBox(
              height:10
            ),
            Container(
              height: 50,
              width: 410,
              child: Center(child: Text(medicineNotifier.currentMedicine.name, style: TextStyle(fontSize: 30),),),
            ),
            Container(
              height: 20,
              width: 410,
              child: Center(child: Text(medicineNotifier.currentMedicine.char, style: TextStyle(fontSize: 15),),),
            ),
            Container(
              height: 120,
              width: 400,
              child: Center(child: Text("Deskripsi Obat:" + "\n" +medicineNotifier.currentMedicine.description, style: TextStyle(fontSize: 18),),),
            ),
            Container(
              height: 70,
              width: 400,
              child: Text("Cara dan Aturan Pakai:" + "\n" + medicineNotifier.currentMedicine.dose, textAlign: TextAlign.left, style: TextStyle(fontSize: 18),),
            ),
            Container(
              height: 70,
              width: 400,
              child: Text("Harga:" + "\n" + medicineNotifier.currentMedicine.price, style: TextStyle(fontSize: 18),),
            ),
            // Container(
            //   height: 70,
            //   width: 400,
            //   child: Center(child: Text("Jumlah" + "\n" + medicineNotifier.currentMedicine.qty, textAlign: TextAlign.center,style: TextStyle(fontSize: 25),),),
            // ),
          ],
        ),
      ),
    ),
    ),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => MedicineForm()),);
      },
      child: Icon(Icons.edit),
      foregroundColor: Colors.white,
      ),
    );
  }
} 