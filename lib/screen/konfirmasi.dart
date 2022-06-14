import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:sejuta/config/constants.dart';
import 'package:sejuta/config/palete.dart';
import 'package:sejuta/model/user_model.dart';
import 'package:sejuta/screen/beranda.dart';
import 'package:sejuta/screen/bottom_nav_bar.dart';
import 'package:sejuta/screen/newDetail.dart';
import 'package:sejuta/screen/riwayat.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class konfirmasi extends StatefulWidget {
  //  List list;
  // int index;
  // konfirmasi({
  //   Key? key,
  //   required this.list,
  //   required this.index,
  // }) : super(key: key);

  // const konfirmasi({Key? key}) : super(key: key);

  @override
  State<konfirmasi> createState() => _konfirmasiState();
}

class _konfirmasiState extends State<konfirmasi> {
  var controllerNama = TextEditingController();
  var controllerEmail = TextEditingController();
  var controllerAlamat = TextEditingController();
  var controllerNohp = TextEditingController();
  late SharedPreferences sharedPreferences;
  int id = 0;
  int idusers = 0;
  int iduser = 0;
  int jumlah = 0;
  String nama = "";
  String nama_donatur = "";
  String alamat_donatur = "";
  String email_donatur = "";
  int nohp_donatur = 0;
  String nama_barang = "";
  String deskripsi = "";
  String foto = "";
  @override
  void initState() {
    getData();
    // getDataDonatur();
    // checkLoginStatus();
    // TODO: implement initState
    super.initState();
  }

  void addBarang() {
    var url = 'http://192.168.0.4:8000/api/createTransaksi';

    http.post(Uri.parse(url), body: {
      "id_barang": id.toString(),
      "id_users": idusers.toString(),
      "id_user": controllerNama.text,
      "alamat_user": controllerAlamat.text,
      "tgl_kirim": "",
      "tgl_terima": "",
      // "status": "belum diproses",
    }).then((response) {
      if (response.statusCode == 201) {
        print(response.statusCode);
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (BuildContext context) => BottomNav()),
            (Route<dynamic> route) => false);
      } else {
        print(response.body);
        print(response.statusCode);
      }
    });
  }

  getData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    // void dataDonatur = null;
    // final response = await http.get(Uri.parse(
    //     'http://192.168.1.3:8000/api/dataUser/' + id_users.toString()));
    // dataDonatur = json.decode(response.body);

    // print('id id donatur : ' + id_users.toString());
    // print("ini data donatur" + response.body);
    if (mounted) {
      setState(() {
        // n = sharedPreferences.getString("nama")!;
        // id = sharedPreferences.getInt(id)!;
        id = sharedPreferences.getInt('id')!;
        nama_barang = sharedPreferences.getString('nama_barang')!;
        deskripsi = sharedPreferences.getString('deskripsi')!;
        foto = sharedPreferences.getString('foto')!;
        jumlah = sharedPreferences.getInt('jumlah')!;
        nama = sharedPreferences.getString('nama')!;
        idusers = sharedPreferences.getInt('id_users')!;
        nama_donatur = sharedPreferences.getString('nama_donatur')!;
        alamat_donatur = sharedPreferences.getString('alamat_donatur')!;
        email_donatur = sharedPreferences.getString('email_donatur')!;
        nohp_donatur = sharedPreferences.getInt('nohp_donatur')!;
        // no_hp = sharedPreferences.getString('no_hp')!;
        // email = sharedPreferences.getString("email")!;
      });
    }
  }

  // String id_donatur = idusers.toString();

  // var url1 = "http://192.168.1.3:8000/api/dataUser/" + idusers.toString();

  // Future<void> getJsonDonatur(BuildContext context) async {
  //   String access_token = '';
  //   var response = await http.get(Uri.parse(url1 + idusers.toString()));
  //   print(response.body);
  //   setState(() {
  //     var convertToDataJson = jsonDecode(response.body);
  //     data = convertToDataJson['data'];
  //   });
  // }
  // var url1 = "http://192.168.1.3:8000/api/dataUser/";
  // Future<UserModel> getDataDonatur() async {
  //   var dataDonatur = null;
  //   final response = await http.get(Uri.parse(url1 + idusers.toString()));
  //   dataDonatur = json.decode(response.body);

  //   // print(dataDonatur);

  //   print('id id donatur : ' + idusers.toString());
  //   print("ini data donatur" + response.body);
  // }

  final String url = "http://192.168.0.4/api/sedang_login";
  List? data;

  Future<void> _getRefreshData() async {
    this.getJsonData(context);
  }

  Future<void> getJsonData(BuildContext context) async {
    String access_token = '';
    var response = await http.get(Uri.parse(url), headers: {
      "Accept": "aplication/json",
      "Authorization": "Bearer ${access_token}"
    });
    print(response.body);
    setState(() {
      var convertToDataJson = jsonDecode(response.body);
      data = convertToDataJson['data'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => BottomNav()));
            },
            icon: Icon(Icons.arrow_back_ios_new)),
        iconTheme: IconThemeData(color: color_font),
        title: Text(
          "Konfirmasi Barang",
          style: defaultText.button,
        ),
        backgroundColor: color_background,
      ),
      body: Container(
        color: color_background,
        child: ListView(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Center(
                          child: Text(
                            "Data Barang",
                            style: defaultText.headline3,
                          ),
                        ),
                      ),
                      Center(
                        child: ClipRRect(
                          child: Image.network(
                              "http://192.168.0.4:8000/img/${foto}",
                              fit: BoxFit.fill,
                              height: 250,
                              width: 250),
                        ),
                      ),
                      Center(
                        child: Column(children: [
                          Text(
                            "Deskripsi Barang ",
                            style:
                                defaultText.headline5?.apply(color: color_font),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            deskripsi,
                            style: defaultText.subtitle1,
                            textAlign: TextAlign.center,
                          ),
                        ]),
                      ),
                      SizedBox(height: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 30,
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 5.0, left: 5.0),
                                    ),
                                  ],
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: "Nama",
                                    style: defaultText.subtitle2?.apply(
                                        color:
                                            Color.fromRGBO(68, 93, 192, 1.0)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Text.rich(
                                    TextSpan(
                                      text: ":  " + nama_barang,
                                      style: defaultText.subtitle1?.apply(
                                          color:
                                              Color.fromRGBO(68, 93, 192, 1.0)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            height: 30,
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 5.0, left: 5.0),
                                    ),
                                  ],
                                ),
                                Text.rich(
                                  TextSpan(
                                    text: "Jumlah",
                                    style: defaultText.subtitle2?.apply(
                                        color:
                                            Color.fromRGBO(68, 93, 192, 1.0)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 11.0),
                                  child: Text.rich(
                                    TextSpan(
                                      text: ":  " + jumlah.toString(),
                                      style: defaultText.subtitle1?.apply(
                                          color:
                                              Color.fromRGBO(68, 93, 192, 1.0)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            new Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(bottom: 2, right: 3, left: 3),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Card(
                  color: color_card,
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: EdgeInsets.all(8)),
                      Text(
                        "Data Donatur",
                        style: defaultText.headline3,
                      ),
                      Container(
                        height: 30,
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 5.0, left: 5.0),
                                ),
                              ],
                            ),
                            Text.rich(
                              TextSpan(
                                text: "Nama Donatur",
                                style: defaultText.subtitle2?.apply(
                                    color: Color.fromRGBO(68, 93, 192, 1.0)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text.rich(
                                TextSpan(
                                  text: ":  " + nama_donatur,
                                  style: defaultText.subtitle1?.apply(
                                      color: Color.fromRGBO(68, 93, 192, 1.0)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 30,
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 5.0, left: 5.0),
                                ),
                              ],
                            ),
                            Text.rich(
                              TextSpan(
                                text: "No.HP Donatur",
                                style: defaultText.subtitle2?.apply(
                                    color: Color.fromRGBO(68, 93, 192, 1.0)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 11.0),
                              child: Text.rich(
                                TextSpan(
                                  text: ":  " + nohp_donatur.toString(),
                                  style: defaultText.subtitle1?.apply(
                                      color: Color.fromRGBO(68, 93, 192, 1.0)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 30,
                        alignment: Alignment.centerLeft,
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right: 5.0, left: 5.0),
                                ),
                              ],
                            ),
                            Text.rich(
                              TextSpan(
                                text: "Lokasi Barang",
                                style: defaultText.subtitle2?.apply(
                                    color: Color.fromRGBO(68, 93, 192, 1.0)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Text.rich(
                                TextSpan(
                                  text: ":  " + alamat_donatur,
                                  style: defaultText.subtitle1?.apply(
                                      color: Color.fromRGBO(68, 93, 192, 1.0)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextButton(
                                onPressed: () {
                                  _launchURL2(nohp_donatur,
                                      "Harap hubungi hanya jika ingin bertanya seputar barang donasi, terima kasih.");
                                },
                                child: Text("Hubungi Donatur"))
                          ]),
                    ],
                  ),
                ),
              ),
            ),
            new Padding(
              padding: EdgeInsets.only(top: 20),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text.rich(TextSpan(
                  text: "*ketikkan nama ini dengan benar :  " + nama,
                  style: defaultText.subtitle1?.apply(color: color_red))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Card(
                child: Container(
                  child: TextField(
                    controller: controllerNama,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: color_font),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 14),
                        prefixIcon: Icon(
                          Icons.account_box_outlined,
                          color: color_font,
                        ),
                        hintText: 'Nama',
                        hintStyle: defaultText.subtitle1
                            ?.apply(color: Colors.grey.shade500)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Card(
                child: Container(
                  child: TextField(
                    controller: controllerAlamat,
                    keyboardType: TextInputType.text,
                    style: TextStyle(color: color_font),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.only(top: 14),
                        prefixIcon: Icon(
                          Icons.location_on_outlined,
                          color: color_font,
                        ),
                        hintText: 'Alamat Tujuan',
                        hintStyle: defaultText.subtitle1
                            ?.apply(color: Colors.grey.shade500)),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Center(
              child: new Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new RaisedButton(
                    child: new Text("PILIH", style: MyStyle.textButtonWhite),
                    color: color_font,
                    onPressed: () {
                      addBarang();
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 30)
          ],
        ),
      ),
    );
  }
}

_launchURL2(int no_hp, String pesan) async {
  final url = 'https://wa.me/+62$no_hp?text=${Uri.parse(pesan)}';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Tidak dapat membuka tautan $url';
  }
}
