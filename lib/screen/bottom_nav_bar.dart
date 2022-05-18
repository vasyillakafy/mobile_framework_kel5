import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:sejuta/screen/beranda.dart';
import 'package:sejuta/config/palete.dart';
import 'riwayat.dart';
import 'profil.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int curIndex = 0;
  final List<Widget> body = [beranda(), riwayat(), profil()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body[curIndex],
      bottomNavigationBar:
          BottomNavigationBar(onTap: ontap, currentIndex: curIndex, items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.grey),
            label: 'Beranda',
            activeIcon: Icon(
              Icons.home,
              color: Colors.blueAccent,
            )),
        BottomNavigationBarItem(
            icon: Icon(Icons.history, color: Colors.grey),
            label: 'Riwayat',
            activeIcon: Icon(
              Icons.history,
              color: Colors.blueAccent,
            )),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_rounded, color: Colors.grey),
            label: 'Profile',
            activeIcon: Icon(
              Icons.account_circle_rounded,
              color: Colors.blueAccent,
            ))
      ]),
    );
  }

  void ontap(int index) {
    setState(() {
      curIndex = index;
    });
  }
}
