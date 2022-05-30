import 'dart:html';

import 'package:flutter/material.dart';
import 'package:sejuta/config/constants.dart';
import 'package:sejuta/config/palete.dart';

class bantuan extends StatefulWidget {
  @override
  State<bantuan> createState() => _bantuanState();
}

class _bantuanState extends State<bantuan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_new),
        iconTheme: IconThemeData(color: color_font),
        title: Text(
          "Bantuan",
          style: defaultText.button?.apply(color: color_font),
        ),
        backgroundColor: color_background,
      ),
      backgroundColor: color_background,
    );
  }
}
