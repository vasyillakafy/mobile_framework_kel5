import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sejuta/config/constants.dart';
import 'package:sejuta/config/palete.dart';
import 'package:sejuta/screen/bottom_nav_bar.dart';
import 'package:sejuta/screen/profil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class editProf extends StatefulWidget {
  @override
  State<editProf> createState() => _editProfState();
}

class _editProfState extends State<editProf> {
  int id = 0;
  var controllerNama = TextEditingController();
  var controllerEmail = TextEditingController();
  var controllerAlamat = TextEditingController();
  var controllerNohp = TextEditingController();
  var controllerPassword = TextEditingController();
  late SharedPreferences sharedPreferences;

  @override
  void initState() {
    getData();
    super.initState();
  }

  Future<void> editProf() async {
    if (controllerNama.text.isNotEmpty &&
        controllerEmail.text.isNotEmpty &&
        controllerPassword.text.isNotEmpty &&
        controllerNohp.text.isNotEmpty &&
        controllerAlamat.text.isNotEmpty) {
      final response = await http.post(
          Uri.parse("http://192.168.0.9:8000/api/dataUser/" + id.toString()),
          headers: {
            'Accept': 'application/json',
          },
          body: ({
            'nama': controllerNama.text,
            'email': controllerEmail.text,
            'password': controllerPassword.text,
            'no_hp': controllerNohp.text,
            'alamat': controllerAlamat.text
          }));

      if (response.statusCode == 201) {
        print(json.decode(response.body));
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => BottomNav()));
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Berhasil Disimpan. Silahkan refresh halaman")));
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Invalid")));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Data tidak boleh kosong")));
    }
  }

  getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var no_hp = sharedPreferences.getInt('no_hp')!;
    if (mounted) {
      setState(() {
        id = sharedPreferences.getInt('id')!;
        controllerNama = new TextEditingController(
            text: sharedPreferences.getString("nama")!);
        controllerEmail = new TextEditingController(
            text: sharedPreferences.getString("email")!);
        controllerPassword = new TextEditingController(
            text: sharedPreferences.getString("password")!);
        controllerAlamat = new TextEditingController(
            text: sharedPreferences.getString("alamat")!);
        controllerNohp = new TextEditingController(text: no_hp.toString());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios_new)),
        iconTheme: IconThemeData(color: color_font),
        title: Text(
          "Edit Profil",
          style: defaultText.button?.apply(color: color_font),
        ),
        backgroundColor: color_background,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: ListView(
          children: [
            SizedBox(height: 25.0),
            Container(
              height: 50,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 1,
                      offset: Offset(0, 2),
                    )
                  ]),
              child: Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 10.0, left: 10.0, top: 12.5, bottom: 12.5),
                        child: Icon(Icons.perm_identity_sharp,
                            color: color_font, size: 25),
                      ),
                    ],
                  ),
                  Text.rich(
                    TextSpan(
                      text: id.toString(),
                      style: defaultText.headline6
                          ?.apply(color: Color.fromRGBO(68, 93, 192, 1.0)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25.0),
            Container(
              height: 50,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 1,
                      offset: Offset(0, 2),
                    )
                  ]),
              child: TextFormField(
                controller: controllerNama,
                keyboardType: TextInputType.text,
                style: TextStyle(color: color_font),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 14),
                    prefixIcon: Icon(
                      Icons.account_box_outlined,
                      color: color_font,
                    ),
                    hintText: 'Nama Lengkap',
                    hintStyle: defaultText.subtitle1
                        ?.apply(color: Colors.grey.shade500)),
              ),
            ),
            SizedBox(height: 15.0),
            Container(
              height: 50,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 1,
                      offset: Offset(0, 2),
                    )
                  ]),
              child: TextField(
                controller: controllerEmail,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(color: color_font),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 14),
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: color_font,
                    ),
                    hintText: 'abcdef@example.com',
                    hintStyle: defaultText.subtitle1
                        ?.apply(color: Colors.grey.shade500)),
              ),
            ),
            SizedBox(height: 15.0),
            Container(
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 1,
                      offset: Offset(0, 2))
                ],
              ),
              height: 50,
              child: TextField(
                controller: controllerPassword,
                obscureText: true,
                style: TextStyle(color: color_font),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 14),
                    prefixIcon: Icon(
                      Icons.vpn_key,
                      color: color_font,
                    ),
                    hintText: "Password",
                    hintStyle: defaultText.subtitle1
                        ?.apply(color: Colors.grey.shade500)),
              ),
            ),
            SizedBox(height: 15.0),
            Container(
              height: 50,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 1,
                      offset: Offset(0, 2),
                    )
                  ]),
              child: TextField(
                controller: controllerNohp,
                keyboardType: TextInputType.text,
                style: TextStyle(color: color_font),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 14),
                    prefixIcon: Icon(
                      Icons.phone,
                      color: color_font,
                    ),
                    hintText: '08xxxxxxxxx',
                    hintStyle: defaultText.subtitle1
                        ?.apply(color: Colors.grey.shade500)),
              ),
            ),
            SizedBox(height: 15.0),
            Container(
              height: 50,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 1,
                      offset: Offset(0, 2),
                    )
                  ]),
              child: TextField(
                controller: controllerAlamat,
                keyboardType: TextInputType.text,
                style: TextStyle(color: color_font),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(top: 14),
                    prefixIcon: Icon(
                      Icons.location_on_outlined,
                      color: color_font,
                    ),
                    hintText: 'Alamat Lengkap',
                    hintStyle: defaultText.subtitle1
                        ?.apply(color: Colors.grey.shade500)),
              ),
            ),
            SizedBox(height: 30.0),
            Container(
              width: 150,
              child: RaisedButton(
                onPressed: () {
                  editProf();
                  // Navigator.of(context).push(new MaterialPageRoute(
                  //     builder: (BuildContext context) => BottomNav()));
                },
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: color_font,
                padding: EdgeInsets.all(20),
                child: Text(
                  "Simpan",
                  style: defaultText.headline5?.apply(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: color_background,
    );
  }
}
