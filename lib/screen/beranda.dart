import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sejuta/config/constants.dart';
import 'package:sejuta/config/palete.dart';
import 'package:sejuta/main.dart';
import 'package:sejuta/screen/LoginScreen.dart';
import 'package:http/http.dart' as http;
import 'package:sejuta/screen/daftarbarang_sejuta.dart';
import 'package:shared_preferences/shared_preferences.dart';

class beranda extends StatefulWidget {
  // String token = "";

  @override
  State<beranda> createState() => _berandaState();
}

class _berandaState extends State<beranda> {
  late SharedPreferences sharedPreferences;
  int id = 0;
  String nama = "";
  String email = "";
  @override
  void initState() {
    getData();
    // checkLoginStatus();
    // TODO: implement initState
    super.initState();
  }

  getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (mounted) {
      setState(() {
        nama = sharedPreferences.getString("nama")!;
        // id = sharedPreferences.getInt(id)!;
        id = sharedPreferences.getInt('id')!;

        email = sharedPreferences.getString("email")!;
      });
    }
  }
  
  final String url = "http://192.168.0.9/api/sedang_login";
  List? data;

  Future<void> _getRefreshData() async {
    this.getJsonData(context);
  }

  Future<void> getJsonData(BuildContext context) async {
    String access_token = '';
    var response = await http.get(Uri.parse(url), headers: {
      "Accept": "aplication/json",
      "Authorization": "Bearer ${access_token}"
    });
    print(response.body);
    setState(() {
      var convertToDataJson = jsonDecode(response.body);
      data = convertToDataJson['data'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: SizedBox(
                        height: 70.0,
                        child: Image.asset("assets/images/sejutalogo.png"),
                      ),
                    ),
                  ],
                ),
                Text.rich(
                  TextSpan(
                    text: "SEJUTA",
                    style: defaultText.headline2
                        ?.apply(color: Color.fromRGBO(68, 93, 192, 1.0)),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),

            Text.rich(
              TextSpan(


                text: "Halo,  " + nama.toString(),
                style: defaultText.headline4?.apply(color: color_font),
              ),
            ),
            SizedBox(height: 7),
            Text.rich(
              TextSpan(
                text: 'Apa yang anda butuhkan?',
                style: defaultText.headline6?.apply(color: color_font),
              ),
            ),
            SizedBox(height: 25),
            TextField(
              decoration: InputDecoration(
                fillColor: Color.fromRGBO(255, 255, 255, 1.0),
                prefixIcon: Icon(
                  Icons.search,
                  color: color_font,
                  size: 20,
                ),
                iconColor: color_font,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "Ketik Untuk Mencari",
                hintStyle: defaultText.headline6?.apply(color: color_font),
              ),
            ),
            SizedBox(height: 25),
            Text.rich(
              TextSpan(
                text: "Kategori",
                style: defaultText.headline5?.apply(color: color_font),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              child: Row(
                children: <Widget>[
                  Padding(
                      padding: EdgeInsets.only(
                          top: 0.0, bottom: 0.0, left: 15, right: 5)),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Kemeja",
                      style: defaultText.subtitle1,
                    ),
                  ),
                  SizedBox(width: 10),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Kaos",
                        style: defaultText.subtitle1,
                      )),
                  SizedBox(width: 10),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Celana",
                        style: defaultText.subtitle1,
                      )),
                  SizedBox(width: 10),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        "Jaket",
                        style: defaultText.subtitle1,
                      ))
                ],
              ),
            ),

            //kita panggil listview disini

            AspectRatio(
              aspectRatio: 3 / 4,
              child: ListBarangUm(),
            )
          ],
        ),
      ),
      backgroundColor: Color_background,
    );
  }
}
