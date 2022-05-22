import 'package:flutter/material.dart';
import 'palete.dart';
import 'package:google_fonts/google_fonts.dart';

TextTheme defaultText = TextTheme(
  headline1: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 36),
  headline2: GoogleFonts.audiowide(fontWeight: FontWeight.normal, fontSize: 33),
  headline3: GoogleFonts.inter(
    fontWeight: FontWeight.bold,
    fontSize: 20,
  ),
  headline4: GoogleFonts.poppins(fontWeight: FontWeight.normal, fontSize: 24),
  headline5: GoogleFonts.poppins(
      fontWeight: FontWeight.bold, fontSize: 15, color: color_font),
  headline6: GoogleFonts.poppins(
    fontWeight: FontWeight.normal,
    fontSize: 14,
  ),
  subtitle1: GoogleFonts.poppins(
      fontWeight: FontWeight.normal, fontSize: 13, color: color_font),
  subtitle2: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 13),
  button: GoogleFonts.poppins(fontWeight: FontWeight.normal, fontSize: 18),
);
