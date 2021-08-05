import 'package:flutter/material.dart';
import 'package:start_trial/model/prescription.dart';

class DocDetail extends StatelessWidget {

  final Prescription prescription;

  DocDetail({Key key, this.prescription}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                  colors: <Color>[Color(0xFF5D74E2), Color(0xFF13E3D2)],
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
                            Text("${prescription.namaPasien}",
                            style: TextStyle(color: Colors.white,
                            fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 15.0),
                              child: Text("${prescription.namaDokter}",
                              style: TextStyle(color: Colors.white,
                              fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Text("${prescription.tanggal}",
                        style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.bold),
                        ),
                      ],
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
                    textAlign: TextAlign.center
                    )
                  ],
                ),
              ),
            SizedBox(height: 20.0,),
            Container(
            padding: EdgeInsets.only(left: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.medical_services, 
                    size:25.0, 
                    color: Colors.blue),
                  SizedBox(width:10.0),
                  Text('${prescription.obat.obat1}'),
                    Spacer(),
                    Expanded(
                    child: Padding(padding: EdgeInsets.only(right: 50.0),
                    child: Text('${prescription.obat.jumlah1}',
                    textAlign: TextAlign.right),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20.0,),
            Container(
            padding: EdgeInsets.only(left: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if('${prescription.obat.obat2}' != ' ')
                  Icon(Icons.medical_services, size:25.0, color: Colors.blue),
                  SizedBox(width:10.0),
                  Text('${prescription.obat.obat2}'),
                    Spacer(),
                    Expanded(
                    child: Padding(padding: EdgeInsets.only(right: 50.0),
                    child: Text('${prescription.obat.jumlah2}',
                    textAlign: TextAlign.right),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20.0,),
            Container(
            padding: EdgeInsets.only(left: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if('${prescription.obat.obat3}' != ' ')
                  Icon(Icons.medical_services, size:25.0, color: Colors.blue),
                  SizedBox(width:10.0),
                  Text('${prescription.obat.obat3}'),
                    Spacer(),
                    Expanded(
                    child: Padding(padding: EdgeInsets.only(right: 50.0),
                    child: Text('${prescription.obat.jumlah3}',
                    textAlign: TextAlign.right),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20.0,),
            Container(
            padding: EdgeInsets.only(left: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if('${prescription.obat.obat4}' != ' ')
                  Icon(Icons.medical_services, size:25.0, color: Colors.blue),
                  SizedBox(width:10.0),
                  Text('${prescription.obat.obat4}'),
                    Spacer(),
                    Expanded(
                    child: Padding(padding: EdgeInsets.only(right: 50.0),
                    child: Text('${prescription.obat.jumlah4}',
                    textAlign: TextAlign.right),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 20.0,),
            Container(
            padding: EdgeInsets.only(left: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if('${prescription.obat.obat5}' != ' ')
                  Icon(Icons.medical_services, size:25.0, color: Colors.blue),
                  SizedBox(width:10.0),
                  Text('${prescription.obat.obat5}'),
                    Spacer(),
                    Expanded(
                    child: Padding(padding: EdgeInsets.only(right: 50.0),
                    child: Text('${prescription.obat.jumlah5}',
                    textAlign: TextAlign.right),
                    ),
                  )
                ],
              ),
            ),
          ]
        ),
      ),
    );
  }
}
