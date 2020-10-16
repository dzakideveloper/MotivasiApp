import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:motivasi_app/detail.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatelessWidget {
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text('List Makanan'),
        ),
        body: _PageList());
  }
}

final baseTextStyle = const TextStyle(color: Colors.white, fontFamily: 'arial');
final bigHeaderTextStyle =
    baseTextStyle.copyWith(fontSize: 24.0, fontWeight: FontWeight.bold);
final descTextStyle =
    baseTextStyle.copyWith(fontSize: 18.0, fontWeight: FontWeight.w400);
final footerTextStyle =
    baseTextStyle.copyWith(fontSize: 14.0, fontWeight: FontWeight.w400);

class _PageList extends StatefulWidget {
  @override
  __PageStateListState createState() => __PageStateListState();
}

class __PageStateListState extends State<_PageList> {
  List<String> judul = ["Motivasi 1", "Motivasi 2", "Motivasi 3"];

  List<String> subJudul = [
    "Apa pun pekerjaan yang kamu geluti, cintailah dan syukurilah",
    "Teruslah percaya dan bekerja keraslah",
    "Teruslah optimistis dan berpikir positif dalam hidupmu"
  ];

  List<String> gambar = [
    "assets/images/pemandangan1.jpg",
    "assets/images/pemandangan2.jpg",
    "assets/images/pemandangan3.jpg"
  ];

  List<String> jmlh = ["bola.com", "bola.com", "bola.com"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 70,
              child: ListView.builder(
                itemCount: judul.length,
                itemBuilder: (BuildContext context, int index) {
                  final title = judul[index].toString();
                  final subTitle = subJudul[index].toString();
                  final jumlahh = jmlh[index].toString();
                  final img = gambar[index].toString();
                  return Container(
                    height: 200.0,
                    padding: EdgeInsets.all(8.0),
                    child: GestureDetector(
                        child: Stack(
                          children: <Widget>[
                            backgroundImage(img),
                            Container(
                              child: topContent(title, subTitle, jumlahh),
                            )
                          ],
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                      itemJudul: title,
                                      itemSub: subTitle,
                                      qty: jumlahh,
                                      itemImage: img)));
                        }),
                  );
                },
              ),
            ),
            ListView.builder(
                itemCount: judul.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final title = judul[index].toString();
                  final subTitle = subJudul[index].toString();
                  final jumlahh = jmlh[index].toString();
                  final img = gambar[index].toString();
                  return Container(
                    height: 200.0,
                    padding: EdgeInsets.all(8.0),
                    child: GestureDetector(
                        child: Stack(
                          children: <Widget>[
                            backgroundImage(img),
                            Container(
                              child: topContent(title, subTitle, jumlahh),
                            )
                          ],
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                      itemJudul: title,
                                      itemSub: subTitle,
                                      qty: jumlahh,
                                      itemImage: img)));
                        }),
                  );
                }),
          ],
        ),
      ),
    );
  }

  backgroundImage(String gambar) {
    return new Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          image: DecorationImage(
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.luminosity),
              image: AssetImage(gambar))),
    );
  }

  topContent(String nama, String deskripsi, String stok) {
    return new Container(
      height: 80.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            nama,
            style: bigHeaderTextStyle,
          ),
          Text(
            deskripsi,
            style: descTextStyle,
          ),
          Container(
            height: 2.0,
            width: 80.0,
            color: Colors.redAccent,
          ),
          Text(
            stok,
            style: footerTextStyle,
          )
        ],
      ),
    );
  }
}
