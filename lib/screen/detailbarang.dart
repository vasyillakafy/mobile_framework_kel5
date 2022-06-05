import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sejuta/config/constants.dart';
import 'package:sejuta/config/palete.dart';
import 'package:sejuta/screen/beranda.dart';
import 'package:sejuta/screen/bottom_nav_bar.dart';
import 'package:sejuta/screen/tesD.dart';


class DetailL extends StatefulWidget {
  List list;
  int index;
  DetailL({
    Key? key,
    required this.list,
    required this.index,
  }) : super(key: key);
  @override
  _DetailLState createState() => new _DetailLState();
}

class _DetailLState extends State<DetailL> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
            title: new Text("${widget.list[widget.index]['nama_barang']}")),
        body: Padding(
          padding: EdgeInsets.all(1.0),
          child: ListView(children: <Widget>[
            Container(
              margin: EdgeInsets.all(3),
              padding: EdgeInsets.all(2),
              child: Card(
                color: color_background,
                margin: EdgeInsets.only(top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                    ),

                    Container(
                      width: double.infinity,
                      child: Card(
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Data Barang",
                              style: defaultText.headline3,
                            ),
                            ClipRRect(
                              child: Image.network(
                                  "http://192.168.0.9:8000/img/${widget.list[widget.index]['foto']}",
                                  fit: BoxFit.fill,
                                  height: 250,
                                  width: 250),
                            ),
                            Text(
                              "Nama :",
                              style: defaultText.subtitle1,
                              textAlign: TextAlign.left,
                            ),
                            Text(
                              "${widget.list[widget.index]['nama_barang']}",
                              style: MyStyle.nwText,
                            ),
                            Text(
                              "Deskripsi",
                              style: defaultText.subtitle1,
                            ),
                            Text(
                              "${widget.list[widget.index]['deskripsi']}",
                              style: MyStyle.nwText,
                            ),
                            Text(
                              "Kategori : ",
                              style: defaultText.subtitle1,
                            ),
                            Text(
                              "${widget.list[widget.index]['kategori']['kat']}",
                              style: MyStyle.nwText,
                            ),
                            Text(
                              "Pemakai : ",
                              style: defaultText.subtitle1,
                            ),
                            Text(
                              "${widget.list[widget.index]['kategori']['pemakai']}",
                              style: MyStyle.nwText,
                            ),
                            Text(
                              "Gender : ",
                              style: defaultText.subtitle1,
                            ),
                            Text(
                              "${widget.list[widget.index]['kategori']['gender']}",
                              style: MyStyle.nwText,
                            ),
                            Text(
                              "Size : ",
                              style: defaultText.subtitle1,
                            ),
                            Text(
                              "${widget.list[widget.index]['kategori']['ukuran']}",
                              style: MyStyle.nwText,
                            ),
                            Text(
                              "Jumlah : ",
                              style: defaultText.subtitle1,
                            ),
                            Text(
                              "${widget.list[widget.index]['jumlah']}",
                              style: MyStyle.nwText,
                            )
                          ],
                        ),
                      ),
                    )
                    // Container(
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     children: [
                    //       Text(
                    //         "Data Barang",
                    //         style: defaultText.headline3,

                    //       ),
                    //     ],
                    //   ),
                    // ),
                    // SizedBox(
                    //   height: 2,
                    // ),
                    // ClipRRect(
                    //   child: Image.network(
                    //       "http://192.168.0.9:8000/img/${widget.list[widget.index]['foto']}",
                    //       fit: BoxFit.fill,
                    //       height: 250,
                    //       width: 250),
                    // ),
                    // SizedBox(height: 4),
                    // Container(
                    //   margin: EdgeInsets.all(2),
                    //   padding: EdgeInsets.all(2),
                    //   child: Column(
                    //     crossAxisAlignment: CrossAxisAlignment.start,
                    //     mainAxisAlignment: MainAxisAlignment.start,
                    //     children: [
                    //       Text(
                    //         "Nama :",
                    //         style: defaultText.subtitle1,
                    //         textAlign: TextAlign.left,
                    //       ),
                    //       Text(
                    //         "${widget.list[widget.index]['nama_barang']}",
                    //         style: MyStyle.nwText,
                    //       ),
                    //       Text(
                    //         "Deskripsi",
                    //         style: defaultText.subtitle1,
                    //       ),
                    //       Text(
                    //         "${widget.list[widget.index]['deskripsi']}",
                    //         style: MyStyle.nwText,
                    //       ),
                    //       Text(
                    //         "Kategori : ",
                    //         style: defaultText.subtitle1,
                    //       ),
                    //       Text(
                    //         "${widget.list[widget.index]['kategori']['kat']}",
                    //         style: MyStyle.nwText,
                    //       ),
                    //       Text(
                    //         "Pemakai : ",
                    //         style: defaultText.subtitle1,
                    //       ),
                    //       Text(
                    //         "${widget.list[widget.index]['kategori']['pemakai']}",
                    //         style: MyStyle.nwText,
                    //       ),
                    //       Text(
                    //         "Gender : ",
                    //         style: defaultText.subtitle1,
                    //       ),
                    //       Text(
                    //         "${widget.list[widget.index]['kategori']['gender']}",
                    //         style: MyStyle.nwText,
                    //       ),
                    //       Text(
                    //         "Size : ",
                    //         style: defaultText.subtitle1,
                    //       ),
                    //       Text(
                    //         "${widget.list[widget.index]['kategori']['ukuran']}",
                    //         style: MyStyle.nwText,
                    //       ),
                    //       Text(
                    //         "Jumlah : ",
                    //         style: defaultText.subtitle1,
                    //       ),
                    //       Text(
                    //         "${widget.list[widget.index]['jumlah']}",
                    //         style: MyStyle.nwText,
                    //       )
                    //     ],
                    //   ),
                    // ),
                    ,
                    Container(
                      width: double.infinity,
                      margin:
                          EdgeInsets.only(bottom: 2, top: 2, right: 3, left: 3),
                      child: Card(
                        color: color_card,
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(padding: EdgeInsets.all(2)),
                            Text(
                              "Data Donatur",
                              style: defaultText.headline3,
                            ),
                            Text(
                              "Nama Donatur :  " +
                                  " ${widget.list[widget.index]['user']['nama']}",
                              style: defaultText.subtitle1,
                            ),
                            Text(
                              "No Hp : " +
                                  "${widget.list[widget.index]['user']['no_hp']}",
                              style: defaultText.subtitle1,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.only(bottom: 2, top: 2, right: 3, left: 3),
                      width: double.infinity,
                      child: Card(
                        color: color_card,
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(padding: EdgeInsets.all(2)),
                            Text(
                              "Data Anda : ",
                              style: defaultText.headline3,
                            ),
                            Text(
                              "Nama Anda : ",
                              style: defaultText.subtitle1,
                            ),
                            Text(
                              "No Hp : ",
                              style: defaultText.subtitle1,
                            ),
                          ],
                        ),
                      ),
                    ),
                    new Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                    ), // Padding
                    new Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new RaisedButton(
                            child: new Text("PILIH",
                                style: MyStyle.textButtonWhite),
                            color: color_font,
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => beranda()))),
                      ],
                    )
                  ],
                ),
              ),
            )
          ]),
        ));
  }
}// Scaffold