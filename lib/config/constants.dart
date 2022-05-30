import 'package:flutter/material.dart';
import 'palete.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme defaultText = TextTheme(
  headline1: GoogleFonts.poppins(
      fontWeight: FontWeight.bold, fontSize: 32, color: color_font),
  headline2: GoogleFonts.audiowide(
      fontWeight: FontWeight.normal, fontSize: 33, color: color_font),
  headline3: GoogleFonts.inter(
      fontWeight: FontWeight.bold, fontSize: 20, color: color_font),
  headline4: GoogleFonts.poppins(fontWeight: FontWeight.normal, fontSize: 24),
  headline5: GoogleFonts.poppins(
      fontWeight: FontWeight.bold, fontSize: 15, color: color_font),
  headline6: GoogleFonts.poppins(
    fontWeight: FontWeight.normal,
    fontSize: 14,
  ),
  subtitle1: GoogleFonts.poppins(
      fontWeight: FontWeight.normal, fontSize: 13, color: color_font),
  subtitle2: GoogleFonts.poppins(
      fontWeight: FontWeight.bold, fontSize: 13, color: color_font),
  button: GoogleFonts.poppins(
      fontWeight: FontWeight.normal, fontSize: 18, color: color_font),
);

class MyStyle {
  static TextStyle textButtonBlack =
      TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.bold);

  static TextStyle textButtonWhite =
      TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold);

  static TextStyle textTitleBlack =
      TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold);

  static TextStyle textParagh = TextStyle(
    color: color_font,
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );

  static TextStyle textParagraphBlack = TextStyle(
    color: Colors.black,
    fontSize: 12,
  );
}
