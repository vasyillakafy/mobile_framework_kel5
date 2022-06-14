import 'package:flutter/material.dart';
import 'package:sejuta/config/constants.dart';
import 'package:sejuta/config/palete.dart';

class tentang extends StatefulWidget {
  @override
  State<tentang> createState() => _tentangState();
}

class _tentangState extends State<tentang> {
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
          "Tentang",
          style: defaultText.button?.apply(color: color_font),
        ),
        backgroundColor: color_background,
      ),
      body: Column(
        children: [
          SizedBox(height: 90),
          Center(
            child: Image.asset(
              "assets/images/sejutalogo.png",
              height: 150,
            ),
          ),
          Text.rich(
            TextSpan(
              text: "SEJUTA",
              style: defaultText.headline2
                  ?.apply(color: Color.fromRGBO(68, 93, 192, 1.0)),
            ),
          ),
          Text.rich(
            TextSpan(
              text: "Sedekah Baju Kita",
              style: defaultText.headline6
                  ?.apply(color: Color.fromRGBO(68, 93, 192, 1.0)),
            ),
          ),
          Text.rich(
            TextSpan(
              text: "Versi 1.0.0",
              style: defaultText.subtitle1
                  ?.apply(color: Color.fromRGBO(68, 93, 192, 1.0)),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.copyright, size: 14, color: color_font),
              Text.rich(
                TextSpan(
                  text: " 2022 Sejuta Inc.",
                  style: defaultText.subtitle1
                      ?.apply(color: Color.fromRGBO(68, 93, 192, 1.0)),
                ),
              ),
            ],
          ),
        ],
      ),
      backgroundColor: color_background,
    );
  }
}
