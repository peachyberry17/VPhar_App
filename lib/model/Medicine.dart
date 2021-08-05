import 'package:cloud_firestore/cloud_firestore.dart';

class Medicine{
  String id;
  String name;
  String description;
  String dose; 
  String char; 
  String price;
  String qty;
  String image;
  Timestamp createdAt;
  Timestamp updatedAt;

  Medicine ({
    this.id,
    this.name,
    this.description,
  });

  Medicine.fromMap(Map<String, dynamic>data){
    id = data['id'];
    name = data['nama'];
    description = data ['deskripsi'];
    dose = data ['dosis'];
    char = data ['sifat'];
    price = data ['harga'];
    qty = data ['jumlah'];
    image = data ['foto'];
    createdAt = data ['tanggal'];
    updatedAt = data ['update'];
  }

  Map<String, dynamic> toMap() {
    return{
      'id': id,
      'nama': name,
    };
  }
}