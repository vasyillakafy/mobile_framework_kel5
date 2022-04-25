import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:sejuta/config/constants.dart';
import 'package:sejuta/config/palete.dart';

class beranda extends StatefulWidget {
  @override
  State<beranda> createState() => _berandaState();
}

class _berandaState extends State<beranda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                text: 'Halo, Fafa',
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
                hintText: "Cari Kota",
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
          ],
        ),
      ),
      backgroundColor: Color_background,
    );
  }
}
