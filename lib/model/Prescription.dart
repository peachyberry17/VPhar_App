import 'dart:convert';

List<Prescription> welcomeFromJson(String str) => List<Prescription>.from(json.decode(str).map((x) => Prescription.fromJson(x)));

String welcomeToJson(List<Prescription> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Prescription {
    Prescription({
        this.idDokter,
        this.idPasien,
        this.namaDokter,
        this.namaPasien,
        this.tanggal,
        this.obat,
    });

    String idDokter;
    String idPasien;
    String namaDokter;
    String namaPasien;
    String tanggal;
    Obat obat;

    factory Prescription.fromJson(Map<String, dynamic> json) => Prescription(
        idDokter: json["id dokter"],
        idPasien: json["id pasien"],
        namaDokter: json["nama dokter"],
        namaPasien: json["nama pasien"],
        tanggal: json["tanggal"],
        obat: Obat.fromJson(json["obat"]),
    );

    Map<String, dynamic> toJson() => {
        "id dokter": idDokter,
        "id pasien": idPasien,
        "nama dokter": namaDokter,
        "nama pasien": namaPasien,
        "obat": obat.toJson(),
    };
}

class Obat {
  Obat({
      this.obat1,
      this.jumlah1,
      this.obat2,
      this.jumlah2,
      this.obat3,
      this.jumlah3,
      this.obat4,
      this.jumlah4,
      this.obat5,
      this.jumlah5,
  });

  String obat1;
  String jumlah1;
  String obat2;
  String jumlah2;
  String obat3;
  String jumlah3;
  String obat4;
  String jumlah4;
  String obat5;
  String jumlah5;

  factory Obat.fromJson(Map<String, dynamic> json) => Obat(
      obat1: json["obat 1"],
      jumlah1: json["jumlah 1"],
      obat2: json["obat 2"],
      jumlah2: json["jumlah 2"],
      obat3: json["obat 3"],
      jumlah3: json["jumlah 3"],
      obat4: json["obat 4"],
      jumlah4: json["jumlah 4"],
      obat5: json["obat 5"],
      jumlah5: json["jumlah 5"],
  );

  Map<String, dynamic> toJson() => {
      "obat 1": obat1,
      "jumlah 1": jumlah1,
      "obat 2": obat2,
      "jumlah 2": jumlah2,
      "obat 3": obat3,
      "jumlah 3": jumlah3,
      "obat 4": obat4,
      "jumlah 4": jumlah4,
      "obat 5": obat5,
      "jumlah 5": jumlah5,
  };
}