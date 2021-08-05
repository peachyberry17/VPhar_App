import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:start_trial/notifier/medicine_notifier.dart';
import 'package:start_trial/pharmacy/pharmacy_profile.dart';
import 'package:start_trial/services/medicine_services.dart';

import 'medicine_detail.dart';

class MedicineList extends StatefulWidget {
  @override
  _MedicineListState createState() => _MedicineListState();
}

class _MedicineListState extends State<MedicineList> {
  @override
    void initState() {
      MedicineNotifier medicineNotifier = Provider.of<MedicineNotifier>(context, listen:false);
      getMedicine(medicineNotifier);
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    MedicineNotifier medicineNotifier = Provider.of<MedicineNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('DAFTAR OBAT'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.account_circle), 
            onPressed:() {
              Navigator.push(context, MaterialPageRoute(builder: (context) => PharProfile()),);
            },
          ),
        ],
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index){
        return ListTile(
          leading: Image.network(medicineNotifier.medicineList[index].image,
          width: 120,
          fit: BoxFit.fitWidth,),
          title: Text(medicineNotifier.medicineList[index].name),
          subtitle: Text(medicineNotifier.medicineList[index].char),
          onTap: (){
            medicineNotifier.currentMedicine = medicineNotifier.medicineList[index];
            Navigator.push(context, MaterialPageRoute(builder: (context) => MedicineDetail()),);
          },
        );
      }, 
      itemCount: medicineNotifier.medicineList.length,
      separatorBuilder:(BuildContext context, int index){
        return Divider(
          color: Colors.cyan,
          );
        },
      ),
    );
  }
}