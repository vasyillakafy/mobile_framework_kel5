import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sejuta/config/constants.dart';
import 'dart:async';

import 'package:sejuta/config/palete.dart';

class ListBarangUm extends StatefulWidget {
  @override
  _ListBarUmState createState() => new _ListBarUmState();
}

class _ListBarUmState extends State<ListBarangUm> {
  Future<List> getData() async {
    final response =
        await http.get(Uri.parse('http://192.168.0.13:8080/api/dataBarang'));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      // appBar: new AppBar(
      //   title: new Text("BARANG"),
      // ), // AppBar
      body: new FutureBuilder<List>(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? new ItemList(
                  list: snapshot.requireData,
                )
              : new Center(
                  child: new CircularProgressIndicator(),
                );
        },
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  final List list;
  ItemList({required this.list});

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (context, i) {
        return new Container(
          width: 350,
          color: color_background,
          padding: const EdgeInsets.all(10.0),
          child: new GestureDetector(
            onTap:
                () {}, // => Navigator.of(context).push(new MaterialPageRoute(
            //     builder: (BuildContext context) => new Detail(
            //           list: list,
            //           index: i,
            //         ))), // Detail // MaterialPageRoute
            child: Card(
              borderOnForeground: true,
              child: Container(
                margin: EdgeInsets.all(7),
                padding: EdgeInsets.all(5),
                child: Column(
                  children: [
                    ClipRRect(
                      child: Image.network(
                        "http://192.168.0.13:8080/img/" + list[i]["foto"],
                        fit: BoxFit.cover,
                        height: 150,
                        width: 150,
                      ),
                    ),
                    Text(
                      list[i]['nama_barang'],
                      style: defaultText.headline5,
                    ),
                    Text(
                      "Kategori: ${list[i]['kategori']['kat']}",
                      style: defaultText.subtitle1,
                    ),
                  
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
