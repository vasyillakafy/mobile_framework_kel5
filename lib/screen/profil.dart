import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/rendering.dart';
import 'package:sejuta/config/constants.dart';
import 'package:sejuta/config/palete.dart';

class profil extends StatefulWidget {
  @override
  State<profil> createState() => _profilState();
}

class _profilState extends State<profil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.0),
        child: ListView(
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 0),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.settings),
                        iconSize: 30,
                        color: color_font,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: Stack(
                    fit: StackFit.expand,
                    overflow: Overflow.visible,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage("assets/images/profil.png"),
                      ),
                      Positioned(
                        right: -30,
                        bottom: -5,
                        child: FlatButton.icon(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          color: Colors.transparent,
                          onPressed: () {},
                          icon: Icon(Icons.camera_alt_outlined),
                          label: Text(""),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 30.0),
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
            SizedBox(height: 25.0),
            Container(
              width: 150,
              child: RaisedButton(
                onPressed: () {},
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
