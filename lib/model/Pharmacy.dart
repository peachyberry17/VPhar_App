import 'dart:convert';

List<Pharmacy> welcomeFromJson(String str) => List<Pharmacy>.from(json.decode(str).map((x) => Pharmacy.fromJson(x)));

String welcomeToJson(List<Pharmacy> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));


class Pharmacy{

  Pharmacy ({
    this.foto,
    this.idFarmasi,
    this.instansiPelayanan,
    this.jumlahObat,
    this.namaObat,
    this.nomorTelepon,
  });

  String foto;
  String idFarmasi;
  String instansiPelayanan;
  String jumlahObat;
  String namaObat;
  String nomorTelepon;

  factory Pharmacy.fromJson(Map<String, dynamic> data) => Pharmacy(
      foto : data["foto"],
      idFarmasi : data['id farmasi'],
      instansiPelayanan : data ['instansi pelayanan'],
      jumlahObat : data ['jumlah obat'],
      namaObat : data ['nama obat'],
      nomorTelepon: data['nomor telepon'],
  );

  Map<String, dynamic> toJson() => {
    "foto": foto,
    "id farmasi": idFarmasi,
    "instansi pelayanan": instansiPelayanan,
    "jumlah obat": jumlahObat,
    "nama obat": namaObat,
    "nomor telepon": nomorTelepon,
  };
}