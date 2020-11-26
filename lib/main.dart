import 'package:flutter/material.dart';
import 'result.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int tinggi = 0;
  int berat = 0;
  String valGender;
  List gender = ["Male", "Female"];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Weight App'),
        backgroundColor: Colors.orange[500],
      ),
      body: ListView(
        children: <Widget>[
          new Container(
            padding: new EdgeInsets.all(9.0),
            child: new Column(
              children: <Widget>[
                new Padding(padding: new EdgeInsets.only(top: 20.0)),
                Image(image: AssetImage('assets/ilus.jpg')),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    onChanged: (txt) {
                      setState(() {
                        tinggi = int.parse(txt);
                      });
                    },
                    keyboardType: TextInputType.number,
                    maxLength: 5,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                    decoration: InputDecoration(
                        labelText: "Tinggi",
                        suffix: Text('CM'),
                        border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(5.0)),
                        hintText: 'Tinggi'),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    onChanged: (txt) {
                      setState(() {
                        berat = int.parse(txt);
                      });
                    },
                    keyboardType: TextInputType.number,
                    maxLength: 5,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 12,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Berat',
                      labelText: "Berat",
                      suffix: Text('KG'),
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0)),
                    ),
                  ),
                ),
                Container(
                  child: DropdownButton<String>(
                    hint: Text('Pilih Gendermu'),
                    value: valGender,
                    items: gender.map((value) {
                      return new DropdownMenuItem<String>(
                        value: value,
                        child: new Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        valGender = value;
                      });
                    },
                  ),
                ),
                new Padding(padding: new EdgeInsets.only(top: 40.0)),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Result(
                                    tinggi: tinggi,
                                    berat: berat,
                                    gender: valGender,
                                  )));
                    },
                    padding: EdgeInsets.all(4.0),
                    color: Colors.orange[400],
                    textColor: Colors.white,
                    child: Text(
                      'Hitung',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
