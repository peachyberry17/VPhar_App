import 'dart:convert';

List<Recap> recapFromJson(String str) =>
    List<Recap>.from(json.decode(str).map((x) => Recap.fromJson(x)));

String recapToJson(List<Recap> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Recap {
  Recap(
      {this.docName,
      this.patientName,
      this.pharmacyName,
      this.patientId,
      this.pharmacyId,
      this.pharmacyPhone,
      this.medName,
      this.medQty,
      this.medDesc,
      this.medDose,
      this.receiverName,
      this.receiverAddress,
      this.receiverPhone,
      this.date});

  String docName;
  String patientName;
  String pharmacyName;
  String patientId;
  String pharmacyId;
  String pharmacyPhone;
  String medName;
  String medQty;
  String medDesc;
  String medDose;
  String receiverName;
  String receiverAddress;
  String receiverPhone;
  String date;

  factory Recap.fromJson(Map<String, dynamic> json) => Recap(
        docName: json["nama dokter"],
        patientName: json["nama pasien"],
        pharmacyName: json["nama farmasi"],
        patientId: json["id pasien"],
        pharmacyId: json["id farmasi"],
        pharmacyPhone: json["nomor farmasi"],
        medName: json["nama obat"],
        medQty: json["jumlah obat"],
        medDesc: json["deskripsi"],
        medDose: json["dosis obat"],
        receiverName: json["nama penerima"],
        receiverAddress: json["alamat penerima"],
        receiverPhone: json["nomor penerima"],
        date: json["tanggal"],
      );

  Map<String, dynamic> toJson() => {
        "nama dokter": docName,
        "nama pasien": patientName,
        "nama farmasi": pharmacyName,
        "nomor farmasi": pharmacyPhone,
        "id pasien": patientId,
        "id farmasi": pharmacyId,
        "nama obat": medName,
        "jumlah obat": medQty,
        "deskripsi": medDesc,
        "dosis": medDose,
        "nama penerima": receiverName,
        "alamat penerima": receiverAddress,
        "nomor penerima": receiverPhone,
        "tanggal": date
      };
}
