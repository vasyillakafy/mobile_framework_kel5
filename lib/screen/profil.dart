import 'dart:convert';
import 'dart:js_util';
import 'package:flutter/material.dart';
import 'package:sejuta/screen/editProf.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../config/constants.dart';
import '../config/palete.dart';
import 'package:http/http.dart' as http;

class profil extends StatefulWidget {
  @override
  State<profil> createState() => _profilState();
}

class _profilState extends State<profil> {
  late SharedPreferences sharedPreferences;
  int id = 0;
  String nama = "";
  String email = "";
  String alamat = "";
  int no_hp = 0;

  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (mounted) {
      setState(() {
        id = sharedPreferences.getInt('id')!;
        nama = sharedPreferences.getString("nama")!;
        email = sharedPreferences.getString("email")!;
        no_hp = sharedPreferences.getInt("no_hp")!;
        alamat = sharedPreferences.getString("alamat")!;
      });
    }
  }

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
                      padding: EdgeInsets.only(bottom: 0.0),
                      child: popup(
                        icon: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.settings),
                          iconSize: 30.0,
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(bottom: 30),
                          color: color_font,
                        ),
                        menuList: [
                          PopupMenuItem(
                              value: 0,
                              child: ListTile(
                                leading: Icon(Icons.question_mark_rounded),
                                title: Text("Bantuan"),
                              )),
                          PopupMenuItem(
                              value: 1,
                              child: ListTile(
                                leading: Icon(Icons.info),
                                title: Text("Tentang"),
                              )),
                          PopupMenuItem(
                              value: 2,
                              child: ListTile(
                                leading: Icon(Icons.logout),
                                title: Text("Logout"),
                              )),
                        ],
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
                    // overflow: Overflow.visible,
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
              child: Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 10.0, left: 10.0, top: 12.5, bottom: 12.5),
                        child: Icon(Icons.account_box_outlined,
                            color: color_font, size: 25),
                      ),
                    ],
                  ),
                  Text.rich(
                    TextSpan(
                      text: nama,
                      style: defaultText.headline6
                          ?.apply(color: Color.fromRGBO(68, 93, 192, 1.0)),
                    ),
                  ),
                ],
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
              child: Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 10.0, left: 10.0, top: 12.5, bottom: 12.5),
                        child: Icon(Icons.email_outlined,
                            color: color_font, size: 25),
                      ),
                    ],
                  ),
                  Text.rich(
                    TextSpan(
                      text: email,
                      style: defaultText.headline6
                          ?.apply(color: Color.fromRGBO(68, 93, 192, 1.0)),
                    ),
                  ),
                ],
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
              child: Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 10.0, left: 10.0, top: 12.5, bottom: 12.5),
                        child: Icon(Icons.phone, color: color_font, size: 25),
                      ),
                    ],
                  ),
                  Text.rich(
                    TextSpan(
                      text: no_hp.toString(),
                      style: defaultText.headline6
                          ?.apply(color: Color.fromRGBO(68, 93, 192, 1.0)),
                    ),
                  ),
                ],
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
              child: Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            right: 10.0, left: 10.0, top: 12.5, bottom: 12.5),
                        child: Icon(Icons.location_on_outlined,
                            color: color_font, size: 25),
                      ),
                    ],
                  ),
                  Text.rich(
                    TextSpan(
                      text: alamat,
                      style: defaultText.headline6
                          ?.apply(color: Color.fromRGBO(68, 93, 192, 1.0)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.0),
            Container(
              width: 150,
              child: RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => editProf()));
                },
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: color_font,
                padding: EdgeInsets.all(20),
                child: Text(
                  "Edit Profil",
                  style: defaultText.headline5?.apply(color: Colors.white),
                ),
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
      backgroundColor: color_background,
    );
  }
}

class popup extends StatelessWidget {
  final List<PopupMenuEntry> menuList;
  final Widget? icon;

  const popup({Key? key, required this.menuList, this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: ((context) => menuList),
        icon: icon,
        onSelected: (value) {
          if (value == 0) {
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => bantuan()));
            // ScaffoldMessenger.of(context)
            //     .showSnackBar(SnackBar(content: Text("Bantuan")));
            // new InkWell(
            //     child: new Text('Open Browser'),
            //     onTap: () => UrlLauncher.launch(
            //         'https://docs.flutter.io/flutter/services/UrlLauncher-class.html'));
          } else if (value == 1) {
            // Navigator.push(
            //     context, MaterialPageRoute(builder: (context) => tentang()));
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Tentang")));
          } else {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text("Logout")));
          }
        });
  }
}
