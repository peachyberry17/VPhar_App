import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:start_trial/model/Medicine.dart';
import 'package:start_trial/notifier/medicine_notifier.dart';

class MedicineForm extends StatefulWidget {
  @override
  _MedicineFormState createState() => _MedicineFormState();
}

class _MedicineFormState extends State<MedicineForm> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Medicine _currentMedicine;
  String _imageUrl;
  File _imageFile;
  final userPref = GetStorage();

  @override
  void initState() { 
    super.initState();
    MedicineNotifier medicineNotifier = Provider.of<MedicineNotifier>(context, listen:false);

    if (medicineNotifier.currentMedicine != null){
      _currentMedicine = medicineNotifier.currentMedicine;
    } else {
      _currentMedicine = Medicine();
    }
    _imageUrl = medicineNotifier.currentMedicine.image;
  }

  Widget _showImage(){
    if(_imageFile == null && _imageUrl == null){
      return Text ('Image Placeholder');
    }
    else if (_imageFile != null){
      return Text ('Image From File');
    }
    else if (_imageUrl != null){
      // print('Showing Image From URL');
    }

    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: <Widget>[
        Image.network(_imageUrl,
        fit: BoxFit.cover,
        height: 200,)
      ],
    );
  }

  Widget _buildNameField(){
    return TextFormField(
      enabled: false ,
      decoration: InputDecoration(
        labelText: 'Nama Obat'
      ),
      initialValue: _currentMedicine.name,
      keyboardType: TextInputType.text,
      style: TextStyle(fontSize: 20),
      validator: (String value) {
        if(value.isEmpty){
          return 'Name is required';
        }
        else {
          return null;
        }
      },
        onSaved: (String value){
          _currentMedicine.name = value;
      },
    );
  }

  Widget _buildDescriptionField(){
    return TextFormField(
      enabled: false,
      decoration: InputDecoration(
        labelText: 'Deskripsi Obat'
      ),
      initialValue: _currentMedicine.description,
      keyboardType: TextInputType.multiline,
      minLines: 1,
      maxLines: 10,
      style: TextStyle(fontSize: 20),
      validator: (String value) {
        if(value.isEmpty){
          return 'Category is required';
        }
        else {
          return null;
        }
      },
        onSaved: (String value){
          _currentMedicine.description = value;
      },
    );
  }

Widget _buildDoseField(){
    return TextFormField(
      enabled: false,
      decoration: InputDecoration(
        labelText: 'Deskripsi Obat'
      ),
      initialValue: _currentMedicine.dose,
      keyboardType: TextInputType.multiline,
      minLines: 1,
      maxLines: 10,
      style: TextStyle(fontSize: 20),
      validator: (String value) {
        if(value.isEmpty){
          return 'Category is required';
        }
        else {
          return null;
        }
      },
        onSaved: (String value){
          _currentMedicine.dose = value;
      },
    );
  }

  Widget _buildQtyField(){
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Ketersediaan Obat',
      ),
      initialValue: _currentMedicine.qty,
      keyboardType: TextInputType.multiline,
      minLines: 1,
      maxLines: 10,
      style: TextStyle(fontSize: 20),
      validator: (String value) {
        if(value != 'Ada'){
          return 'Ada';
        }
        else {
          return null;
        }
      },
        onSaved: (String value){
          _currentMedicine.qty = value;
      },
    );
  }

  _saveMedicinetoPharmacy(context) {
    if(!_formKey.currentState.validate()){
      return;
    }
    _formKey.currentState.save();

    //Push Pharmacy List to Firestore
    Map <String,dynamic> data = {
      "nama obat": '${_currentMedicine.name}', 
      "ketersediaan obat": '${_currentMedicine.qty}',
      "foto": '$_imageUrl',
      "id farmasi": '${userPref.read('uidpref')}',
      "instansi pelayanan": '${userPref.read('agenpref')}',
      "nomor telepon" : '${userPref.read('pharnum')}'
      };
    FirebaseFirestore.instance.collection('pharmacy').add(data);
  }
 
  @override
  Widget build(BuildContext context) {
    MedicineNotifier medicineNotifier = Provider.of<MedicineNotifier>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        title: Text('Medicine Form'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          autovalidate: true,
          child: Column(
            children: <Widget>[
              _showImage(),
              SizedBox(height: 16,),
              Text(medicineNotifier.currentMedicine.name.toUpperCase(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20),
              ),
              Padding(padding: EdgeInsets.only(top:10),
              child: 
                Text('Ketersediaan Obat Dinyatakan ADA Jika Farmasi Memiliki Stock Obat Lebih Dari 10',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.cyan,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
                _buildNameField(),
                _buildDescriptionField(),
                _buildDoseField(),
                _buildQtyField(),
                SizedBox(height: 16),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _saveMedicinetoPharmacy(context),
        child: Icon(Icons.save),
        backgroundColor: Colors.cyan,
        foregroundColor: Colors.white,
      ),
    );
  }
}