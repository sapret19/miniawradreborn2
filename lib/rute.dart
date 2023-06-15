import 'package:flutter/material.dart';
import 'package:miniawradreborn2/Dalaill/dalailul.dart';
import 'package:miniawradreborn2/home/home_screen.dart';
import 'package:miniawradreborn2/grid_page.dart';
import 'package:miniawradreborn2/page_baru/list_page.dart';
import 'package:miniawradreborn2/page_baru/single_page_baru.dart';
import 'package:miniawradreborn2/page_baru/tab_burdah.dart';
import 'package:miniawradreborn2/page_baru/tab_diba.dart';
import 'package:miniawradreborn2/page_baru/tab_istighosah.dart';
import 'package:miniawradreborn2/page_baru/tab_sabul.dart';
import 'package:miniawradreborn2/page_baru/tab_waqiah.dart';
import 'package:miniawradreborn2/page_baru/tab_yasintahlil.dart';

Map<String, WidgetBuilder> get rute {
  return <String, WidgetBuilder>{
    "/home": (BuildContext context) => const Home(),
    "/kitab": (BuildContext context) => grid_page(),
    "/tawassul": (BuildContext context) =>
        single_page_baru(judul: "Tawassul", data: "tawassul.json"),
    "/birrul": (BuildContext context) =>
        single_page_baru(judul: "Birrul Walidayn", data: "birrul.json"),
    "/yasintahlil": (BuildContext context) => YasinTahlil(),
    "/istighosah": (BuildContext context) => Istighosah(),
    "/waqiah": (BuildContext context) => Waqiahan(),
    "/burdah": (BuildContext context) => Burdahan(),
    "/diba": (BuildContext context) => Diba(),
    "/sabul": (BuildContext context) => Sabul(),
    "/dalail": (BuildContext context) => DalailPage()
  };
}

// fungsi(BuildContext context) async {
//   onClicked:
//   () async {
//     final url = 'dalail_ahad.pdf';
//     final file = await PDFApi.loadFirebase(url);

//     if (file == null) return;
//     openPDF(context, file);
//   }();
// }

// void openPDF(BuildContext context, file) => Navigator.of(context).push(
//       MaterialPageRoute(builder: (context) => PDFViewerPage(file: file)),
//     );
