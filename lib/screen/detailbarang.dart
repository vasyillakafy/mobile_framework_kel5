import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sejuta/config/constants.dart';
import 'package:sejuta/config/palete.dart';
import 'package:sejuta/screen/bottom_nav_bar.dart';
import 'package:sejuta/screen/tesD.dart';
import 'HomeScreen.dart';

class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({
    Key? key,
    required this.list,
    required this.index,
  }) : super(key: key);
  @override
  _DetailState createState() => new _DetailState();
}

class _DetailState extends State<Detail> {
  @override
  Widget build(BuildContext context) {
    String nm = "${widget.list[widget.index]['nama_barang']}\n";
    String desc = "${widget.list[widget.index]['deskripsi']}\n";
    String kt = " ${widget.list[widget.index]['kategori']['kat']}\n";
    String jm = " ${widget.list[widget.index]['jumlah']}\n";

    return new Scaffold(
      appBar: new AppBar(
          title: new Text("${widget.list[widget.index]['nama_barang']}")),
      body: new Container(
        height: double.infinity,
        padding: const EdgeInsets.all(5.0),
        child: new Card(
          child: Column(
            children: [
              new Center(
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    new Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                    ),
                    ClipRRect(
                      child: Image.network(
                          "http://192.168.0.21:8000/img/${widget.list[widget.index]['foto']}",
                          fit: BoxFit.fill,
                          height: 250,
                          width: 250),
                    ),
                    SizedBox(height: 20),
                    Container(
                      margin: EdgeInsets.all(35.0),
                      padding: EdgeInsets.only(
                          top: 5.0, bottom: 5.0, left: 25.5, right: 5.5),
                      child: Text(
                        "Nama :                 ${widget.list[widget.index]['nama_barang']}\n\n" +
                            "Kategori :           ${widget.list[widget.index]['kategori']['kat']}\n\n" +
                            "Pemakai :          ${widget.list[widget.index]['kategori']['pemakai']}\n\n" +
                            "Gender :              ${widget.list[widget.index]['kategori']['gender']}\n\n" +
                            "Size :                     ${widget.list[widget.index]['kategori']['ukuran']}\n\n" +
                            "Deskripsi :        ${widget.list[widget.index]['deskripsi']}\n\n" +
                            "Jumlah :             ${widget.list[widget.index]['jumlah']}\n\n" +
                            "Kontak :              ${widget.list[widget.index]['user']['no_hp']}",
                        style: defaultText.subtitle2,
                        textAlign: TextAlign.justify,
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
                                    builder: (context) => DetailPage(
                                          nm: nm,
                                          desc: desc,
                                          kt: kt,
                                          jm: jm,
                                        )))),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}// Scaffold