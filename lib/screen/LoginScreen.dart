import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sejuta/config/palete.dart';
import 'package:sejuta/config/constants.dart';
import 'package:sejuta/screen/bottom_nav_bar.dart';
import 'package:sejuta/screen/register.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

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
                          height: 40,
                        ),
                        Center(
                          child: Container(
                            height: 166,
                            width: 250,
                            child: Image.asset('assets/images/iLogin.png'),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Masuk",
                          style:
                              defaultText.headline1?.apply(color: color_font),
                        ),
                        Text(
                          "Masuk untuk melakukan donasi",
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
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     buildRememberassword(),
                        //     buildForgetPassword()
                        //   ],
                        // ),
                        SizedBox(
                          height: 30,
                        ),
                        buildLoginButton(),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "atau masuk dengan",
                          style:
                              defaultText.headline6?.apply(color: color_font),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // buildFacebook(),
                            buildGoogle(),
                            // buildTwitter()
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text("Jika belum punya akun,",
                            style: defaultText.subtitle1
                                ?.apply(color: color_font)),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => register()));
                            },
                            child: Text(
                              "klik disini",
                              style: defaultText.subtitle2
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

  Future<void> login() async {
    if (passwordController.text.isNotEmpty && emailController.text.isNotEmpty) {
      var jsonData = null;
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      var response = await http.post(
          Uri.parse("http://192.168.0.4:8000/api/login"),
          body: ({
            'email': emailController.text,
            'password': passwordController.text
          }));

      if (response.statusCode == 200) {
        jsonData = json.decode(response.body);
        print(response.body);
        setState(() {
          // isLoading = false;
          sharedPreferences.setString(
              "token", jsonData['content']['access_token']);
          sharedPreferences.setInt("id", jsonData['content']['data']['id']);
          print(jsonData['content']['data']['id']);
          sharedPreferences.setString(
              "email", jsonData['content']['data']['email']);
          sharedPreferences.setString(
              "nama", jsonData['content']['data']['nama']);
          sharedPreferences.setString(
              "alamat", jsonData['content']['data']['alamat']);
          sharedPreferences.setString(
              "password", jsonData['content']['data']['password']);
          sharedPreferences.setInt(
              "no_hp", jsonData['content']['data']['no_hp']);
          sharedPreferences.setString(
              "foto", jsonData['content']['data']['foto']);
          Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (BuildContext context) => BottomNav()),
              (Route<dynamic> route) => false);
        });
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Invalid")));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Blank Field Not Allowed")));
    }
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
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              style: TextStyle(color: color_font),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
                  prefixIcon: Icon(
                    Icons.email,
                    color: color_font,
                  ),
                  hintText: 'Masukkan email',
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
              controller: passwordController,
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

  Widget buildLoginButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 35),
      child: Container(
        width: double.infinity,
        child: RaisedButton(
          onPressed: () {
            login();
          },
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: color_font,
          padding: EdgeInsets.all(25),
          child: Text(
            "Masuk",
            style: defaultText.headline3?.apply(color: Colors.white),
          ),
        ),
      ),
    );
  }

  // Widget buildFacebook() {
  //   return Container(
  //     height: 50,
  //     width: 50,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(20),
  //     ),
  //     child: Image.asset("assets/facebook.png"),
  //   );
  // }

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

  // Widget buildTwitter() {
  //   return Container(
  //     height: 50,
  //     width: 50,
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(20),
  //     ),
  //     child: Image.asset("assets/twitter.png"),
  //   );
  // }
}
