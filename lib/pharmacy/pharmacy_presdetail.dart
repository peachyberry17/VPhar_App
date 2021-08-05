//for doctor sent page
import 'package:flutter/material.dart';
import 'package:start_trial/model/Recap.dart';

class PharDetail extends StatelessWidget {

  final Recap recap;

 PharDetail({Key key, this.recap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      backgroundColor: Colors.cyan,  
      title: Text('APOTECH'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 120.0,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[Colors.cyan, Color(0xFF13E3D2)],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0)
                )
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top:25.0, left: 50.0, right: 50.0),
                    child: Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("${recap.patientName}",
                            style: TextStyle(color: Colors.white,
                            fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 7.0),
                              child: Text("${recap.pharmacyName}",
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
          ],
        ),
        ),
        SizedBox(height: 20.0,),
            Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: Row(
                children: <Widget>[
                  Text("Resep Obat Diterima Dari ${recap.docName}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16
                  ),
                  textAlign: TextAlign.left)
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
              Padding(padding: EdgeInsets.only(left: 25.0, right: 25.0),
              child: Text('Data Penerima', 
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            SizedBox(height: 20.0,),
            Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: Row(
                children: <Widget>[
                  Text("Nama Penerima: ${recap.patientName}",
                  style: TextStyle(
                    fontSize: 14
                  ),
                  textAlign: TextAlign.left),
                ],
              ),
            ),
            SizedBox(height: 20.0,),
            Padding(
              padding: EdgeInsets.only(left: 25.0, right: 25.0),
              child:
                  Text("Alamat Penerima: ${recap.receiverAddress}",
                  style: TextStyle(
                    fontSize: 14
                  ),
                  textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(height: 20.0,),
            Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: Row(
                children: <Widget>[
                  Text("Nomor Telepon: ${recap.receiverPhone}",
                  style: TextStyle(
                    fontSize: 14
                  ),
                  textAlign: TextAlign.left),
                ],
              ),
            ),
          ]
        ),
      ),
    );
  }
}
