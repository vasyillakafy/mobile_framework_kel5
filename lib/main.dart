import 'package:flutter/material.dart';
import 'package:sejuta/screen/SplashScreen.dart';
import 'screen/Beranda.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
