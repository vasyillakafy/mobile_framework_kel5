import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sejuta/config/palete.dart';
import 'package:sejuta/config/constants.dart';
import 'package:sejuta/screen/LoginScreen.dart';
import 'package:http/http.dart' as http;
import 'package:sejuta/screen/bottom_nav_bar.dart';

class register extends StatefulWidget {
  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
  TextEditingController c_nama = new TextEditingController();
  TextEditingController c_email = new TextEditingController();
  TextEditingController c_alamat = new TextEditingController();
  TextEditingController c_password = new TextEditingController();
  TextEditingController c_conpassword = new TextEditingController();
  TextEditingController c_nohp = new TextEditingController();

  // String foto = "1.jpg";
  // void register() {
  //   var url = 'http://192.168.0.2:8000/api/register';

  //   http.post(Uri.parse(url), body: {
  //     // "id_kategori": controllerIdKat.text,
  //     "nama": c_nama.text,
  //     "email": c_email.text,
  //     "no_hp": c_nohp.text,
  //     "password": c_password.text,
  //     "alamat": c_alamat.text,
  //     "foto": c_foto.text
  //   });
  // }
  String foto = "1.jpg";
  Future<void> register() async {
    if (c_nama.text.isNotEmpty &&
        c_alamat.text.isNotEmpty &&
        c_email.text.isNotEmpty &&
        c_password.text.isNotEmpty &&
        c_conpassword.text.isNotEmpty &&
        c_nohp.text.isNotEmpty) {
      var response =
          await http.post(Uri.parse("http://10.10.3.143:8000/api/register"),
              body: ({
                'nama': c_nama.text,
                'email': c_email.text,
                'password': c_password.text,
                'alamat': c_alamat.text,
                'no_hp': c_nohp.text,
                'foto': foto
              }));

      if (c_password.text == c_conpassword.text) {
        if (response.statusCode == 200) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text("Berhasil Mendaftar")));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                  "Pastikan email dan password sudah terisi dengan benar")));
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Password dan ConfirmPassword TIDAK COCOK")));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Inputan tidak boleh kosong")));
    }
  }

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
                        nama(),
                        SizedBox(
                          height: 30,
                        ),
                        alamat(),
                        SizedBox(
                          height: 30,
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
                        nohp(),
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

  Widget nama() {
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
              controller: c_nama,
              keyboardType: TextInputType.name,
              style: TextStyle(color: color_font),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
                  prefixIcon: Icon(
                    Icons.people,
                    color: color_font,
                  ),
                  hintText: 'Masukkan nama lengkap',
                  hintStyle: defaultText.subtitle1?.apply(color: color_font)),
            ),
          ),
        ],
      ),
    );
  }

  Widget nohp() {
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
              controller: c_nohp,
              keyboardType: TextInputType.number,
              style: TextStyle(color: color_font),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
                  prefixIcon: Icon(
                    Icons.phone,
                    color: color_font,
                  ),
                  hintText: 'Masukkan No. HP Aktif',
                  hintStyle: defaultText.subtitle1?.apply(color: color_font)),
            ),
          ),
        ],
      ),
    );
  }

  Widget alamat() {
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
              controller: c_alamat,
              keyboardType: TextInputType.name,
              style: TextStyle(color: color_font),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14),
                  prefixIcon: Icon(
                    Icons.location_on,
                    color: color_font,
                  ),
                  hintText: 'Masukkan alamat lengkap anda',
                  hintStyle: defaultText.subtitle1?.apply(color: color_font)),
            ),
          ),
        ],
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
              controller: c_email,
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
              controller: c_password,
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
              controller: c_conpassword,
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
          onPressed: () {
            register();
          },
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
