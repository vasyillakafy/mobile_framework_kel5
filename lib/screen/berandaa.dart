import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent,
            title: Padding(
              padding: const EdgeInsets.only(top: 9.0, left: 5.0),
              child: Text(
                'SEJUTA',
                style: defaultText.headline2?.apply(color: color_font),
              ),
            ),
            centerTitle: false,
            floating: true,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10.0, top: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: color_font,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.notifications,
                        color: Colors.white, size: 25.0),
                  ),
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                      hintStyle:
                          defaultText.headline6?.apply(color: color_font),
                    ),
                  ),
                  SizedBox(height: 25),
                  Text.rich(
                    TextSpan(
                      text: "Kategori",
                      style: defaultText.headline5?.apply(color: color_font),
                    ),
                  ),
                  SizedBox(height: 8),
                  Center(
                    child: Container(
                      height: 50,
                      width: 500,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Colors.grey.shade300,
                                blurRadius: 8.0,
                                offset: Offset(0.0, 0.75))
                          ]),
                      child: GroupButton(
                        buttons: ["Kemeja", "Kaus", "Jaket", "Celana"],
                        isRadio: true,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Color_background,
    );
  }
}
