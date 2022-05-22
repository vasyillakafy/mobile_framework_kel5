import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sejuta/config/palete.dart';
import 'package:sejuta/config/constants.dart';
import 'package:sejuta/screen/LoginScreen.dart';

class register extends StatefulWidget {
  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
  bool rememberpwd = false;
  bool sec = true;
  var visable = Icon(
    Icons.visibility,
    color: Color(0xff4c5166),
  );
  var visableoff = Icon(
    Icons.visibility_off,
    color: Color(0xff4c5166),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(color: color_background),
                child: Padding(
                  padding: const EdgeInsets.only(right: 20, left: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Center(
                          child: Container(
                            height: 166,
                            width: 250,
                            child: Image.asset('assets/images/register.png'),
                          ),
                        ),
                        Text(
                          "Daftar",
                          style:
                              defaultText.headline1?.apply(color: color_font),
                        ),
                        Text(
                          "Daftar untuk membuat akun anda",
                          style:
                              defaultText.headline6?.apply(color: color_font),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        buildEmail(),
                        SizedBox(
                          height: 30,
                        ),
                        buildPassword(),
                        SizedBox(
                          height: 30,
                        ),
                        buildConfirmPassword(),
                        SizedBox(
                          height: 30,
                        ),
                        buildRegisterButton(),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "atau daftar dengan",
                          style:
                              defaultText.headline6?.apply(color: color_font),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            buildGoogle(),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text("Jika sudah punya akun,",
                            style: defaultText.headline6
                                ?.apply(color: color_font)),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "klik disini",
                              style: defaultText.headline5
                                  ?.apply(color: color_font),
                            )),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildEmail() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 60,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: color_font,
                    blurRadius: 6,
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
                    Icons.email,
                    color: color_font,
                  ),
                  hintText: 'Masukkan email/no telepon',
                  hintStyle: defaultText.subtitle1?.apply(color: color_font)),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPassword() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: color_font, blurRadius: 6, offset: Offset(0, 2))
              ],
            ),
            height: 60,
            child: TextField(
              obscureText: sec,
              style: TextStyle(color: color_font),
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        sec = !sec;
                      });
                    },
                    icon: sec ? visableoff : visable,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
                  prefixIcon: Icon(
                    Icons.vpn_key,
                    color: color_font,
                  ),
                  hintText: "Password",
                  hintStyle: defaultText.subtitle1?.apply(color: color_font)),
            ),
          )
        ],
      ),
    );
  }

  Widget buildConfirmPassword() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: color_font, blurRadius: 6, offset: Offset(0, 2))
              ],
            ),
            height: 60,
            child: TextField(
              obscureText: sec,
              style: TextStyle(color: color_font),
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        sec = !sec;
                      });
                    },
                    icon: sec ? visableoff : visable,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
                  prefixIcon: Icon(
                    Icons.vpn_key,
                    color: color_font,
                  ),
                  hintText: "Konfirmasi Password",
                  hintStyle: defaultText.subtitle1?.apply(color: color_font)),
            ),
          )
        ],
      ),
    );
  }

  Widget buildRegisterButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Container(
        width: double.infinity,
        child: RaisedButton(
          onPressed: () {},
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: color_font,
          padding: EdgeInsets.all(25),
          child: Text(
            "Daftar",
            style: defaultText.headline3?.apply(color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget buildGoogle() {
    return Center(
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Image.asset('assets/images/google.png'),
      ),
    );
  }
}
