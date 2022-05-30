import 'package:flutter/material.dart';
import 'package:sejuta/config/constants.dart';

class DetailPage extends StatelessWidget {
  //constructor
  DetailPage(
      {required this.nm,
      required this.desc,
      required this.jm,
      required this.kt});

  //properti
  String nm;
  String desc;
  String kt;
  String jm;

  @override
  Widget build(BuildContext context) {
    var listView = ListView(
      padding: EdgeInsets.all(4),
      children: [
        Container(
          margin: EdgeInsets.all(5.0),
          padding: EdgeInsets.all(2.0),
          height: 182,
          width: 345,
          child: Card(
            margin: EdgeInsets.all(10.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Data Barang",
                  style: defaultText.headline5,
                ),
                Text(
                  nm,
                  style: MyStyle.textParagh,
                  textAlign: TextAlign.left,
                ),
                Text(
                  desc,
                  style: MyStyle.textParagh,
                  textAlign: TextAlign.left,
                ),
                Text(
                  kt,
                  style: MyStyle.textParagh,
                  textAlign: TextAlign.left,
                ),
                Text(
                  jm,
                  style: MyStyle.textParagh,
                  textAlign: TextAlign.left,
                )
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(6.0),
          padding: EdgeInsets.all(3.0),
          height: 182,
          width: 345,
          child: Card(
              margin: EdgeInsets.all(15.5),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Data Donatur",
                      style: defaultText.headline5,
                    ),
                    Padding(padding: EdgeInsets.all(3)),
                    Text(
                      "Nama :  ",
                      style: MyStyle.textParagh,
                    ),
                    Text(
                      "No.Hp :  ",
                      style: MyStyle.textParagh,
                    ),
                  ])),
        ),
        Container(
            margin: EdgeInsets.all(6.0),
            padding: EdgeInsets.all(3.0),
            height: 182,
            width: 345,
            child: Card(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Data Diri",
                      style: defaultText.headline5,
                    ),
                    Text(
                      "Nama : ",
                      style: MyStyle.textParagh,
                    ),
                    Text(
                      "No Hp : ",
                      style: MyStyle.textParagh,
                    )
                  ]),
            )),
        ElevatedButton(
          //Navigator.pop() digunakan untuk kembali ke halaman sebelumnya
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Kembali"),
        )
      ],
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Konfirmasi"),
      ),
      body: Container(
        child: listView,
      ),
    );
  }
}
