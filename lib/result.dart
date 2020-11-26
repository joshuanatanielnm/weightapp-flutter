import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Result extends StatelessWidget {
  Result({@required this.tinggi, @required this.berat, @required this.gender});
  final int tinggi;
  final int berat;
  final String gender;
  int hasil;
  String word;
  double tes;

  @override
  Widget build(BuildContext context) {
    double hasil;
    if (gender == 'Male') {
      hasil = ((tinggi - 100) - ((tinggi - 100) * 0.1));
    } else {
      hasil = ((tinggi - 100) - ((tinggi - 100) * 0.15));
    }

    if (hasil == berat) {
      word = 'Selamat berat anda sudah ideal';
    } else if (hasil > berat) {
      tes = hasil - berat;
      word = 'Berat anda kelebihan: $tes';
    } else if (hasil < berat) {
      tes = berat - hasil;
      word = 'Berat anda kurang: $tes';
    }

    return Scaffold(
      appBar: new AppBar(
        title: new Text('Laporan'),
        backgroundColor: Colors.orange[500],
      ),
      body: Container(
        color: Colors.orange[200],
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(15),
              child: Text(
                'Berat anda saat ini adalah: $berat\nBerat Ideal anda adalah:  $hasil \n $word',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[850],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
