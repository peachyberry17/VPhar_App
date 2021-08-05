//for doctor sent page
import 'package:flutter/material.dart';
import 'package:start_trial/model/Recap.dart';

class RecapDetail extends StatelessWidget {

  final Recap recap;

 RecapDetail({Key key, this.recap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.orangeAccent,  
      title: Text('APOTECH'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 140.0,
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
                    padding: const EdgeInsets.only(top:15.0, left: 50.0, right: 50.0),
                    child: Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("${recap.pharmacyName}",
                            style: TextStyle(color: Colors.white,
                            fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 7.0),
                              child: Text("${recap.patientName}",
                              style: TextStyle(color: Colors.white,
                              fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Text("${recap.date}")
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
                    child: Text("Jika Anda belum menerima obat dalam 7 hari setelah pengiriman pesan ini ke farmasi, silahkan hubungi ${recap.pharmacyPhone}!",
                    style: TextStyle(color: Colors.black,
                    fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                    ),
                  ),
          ],
        ),
        ),
        SizedBox(height: 20.0,),
            Padding(
              padding: EdgeInsets.only(left: 120.0),
              child: Row(
                children: <Widget>[
                  Text("Resep Obat",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                  textAlign: TextAlign.center,)
                ],
              ),
            ),
            SizedBox(height: 20.0,),
            Container(
            padding: EdgeInsets.only(left: 25.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.medical_services, size:25.0, color: Colors.blue),
                  SizedBox(width:10.0),
                  Text('${recap.medName}'),
                    Spacer(),
                    Expanded(
                    child: 
                    Text('${recap.medQty}'),
                      )
                ],
              ),
            ),
            SizedBox(height: 25.0,),
              Padding(
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
              Text('${recap.medDesc}',
              textAlign: TextAlign.justify,)
            ),
            SizedBox(height: 20.0,),
            Text('Cara Penggunaan Obat',
            style: TextStyle(fontWeight: FontWeight.bold)),
              Container(
              padding: EdgeInsets.only(top: 10.0, left: 25.0, right: 25.0),
              child: 
              Text('${recap.medDose}')
            ),
            SizedBox(height: 25.0,),
              Padding(padding: EdgeInsets.only(left: 25.0, right: 25.0),
              child: Text('Data Penerima', 
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
                ),),
            SizedBox(height: 20.0,),
            Container(
            child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.only(left: 25.0, right: 25.0),
                    child: Text('Nama Penerima: ${recap.receiverName}',)
                  ),
                  SizedBox(height: 20.0,),
                    Container(
                    padding: EdgeInsets.only(left: 25.0, right: 25.0),
                    child: Text('Alamat Penerima: ${recap.receiverAddress}')
                  ),
                  SizedBox(height: 20.0,),
                    Container(
                    padding: EdgeInsets.only(left: 25.0, right: 25.0, bottom: 25.0),
                    child: Text('Nomor Telepon: ${recap.receiverPhone}')
                  ),
                ],
              ),
            ),
          ]
        ),
      ),
    );
  }
}
