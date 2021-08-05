import 'dart:io';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:start_trial/model/Medicine.dart';
import 'package:start_trial/notifier/medicine_notifier.dart';

getMedicine(MedicineNotifier medicineNotifier) async {
  QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('medicine').get();

  List<Medicine>_medicineList = [];

  snapshot.docs.forEach((document) {
    Medicine medicine = Medicine.fromMap (document.data());
    _medicineList.add(medicine);
   });

   medicineNotifier.medicineList = _medicineList;
}

class DatabaseServices{
    static Future<String> uploadImage(File imageFile) async {
    String fileName = basename(imageFile.path);

    Reference ref = FirebaseStorage.instance.ref().child(fileName);
    UploadTask task = ref.putFile(imageFile);
    TaskSnapshot snapshot = await task;

    return await snapshot.ref.getDownloadURL();
  }
}


  // static Future<DocumentSnapshot> getProduct(String id) async {
  //   return await productCollection.document(id).get();
  // }

  // static Future<void> deleteProduct(String id) async {
  //   return await productCollection.document(id).delete();
  // }