import 'dart:io';

import 'package:flutter/material.dart';
import 'package:miniawradreborn2/home/home_screen.dart';
import 'package:miniawradreborn2/maneh.dart';
import 'package:miniawradreborn2/new.dart';
import 'package:miniawradreborn2/page/grid_page.dart';
import 'package:miniawradreborn2/page/list_page.dart';
import 'package:miniawradreborn2/page/page.dart';
import 'package:miniawradreborn2/page/tabbar_diba.dart';
import 'package:miniawradreborn2/page/tabbar_sabul.dart';
import 'package:miniawradreborn2/page/tabbar_waqiah.dart';
import 'package:miniawradreborn2/page/tabbar_yasin.dart';
import 'package:miniawradreborn2/page/single_list.dart';
import 'package:miniawradreborn2/page_baru/single_page_baru.dart';
import 'package:miniawradreborn2/pdf.dart';
import 'package:miniawradreborn2/per.dart';
import 'package:miniawradreborn2/set.dart';

import 'api.dart';

Map<String, WidgetBuilder> get rute {
  return <String, WidgetBuilder>{
    "/home": (BuildContext context) => const Home(),
    "/kitab": (BuildContext context) => const grid_page(),
    "/tawassul": (BuildContext context) =>
        page(judulpage: "Tawassul", pdfpage: "tawassul.pdf"),
    "/birrul": (BuildContext context) =>
        page(judulpage: "Birrul Walidayn", pdfpage: "birul.pdf"),
    "/yasintahlil": (BuildContext context) => const Tabbar_yasin(),
    "/istighosah": (BuildContext context) =>
        page(judulpage: "Istighosah", pdfpage: "istighosah.pdf"),
    "/waqiah": (BuildContext context) => const Tabbar_waqiah(),
    "/burdah": (BuildContext context) =>
        page(judulpage: "Burdah", pdfpage: "burdah.pdf"),
    "/diba": (BuildContext context) =>
        page(judulpage: 'Maulid Diba', pdfpage: "diba.pdf"),
    "/sabul": (BuildContext context) => const Tabbar_sabul(),
    "/dalail": (BuildContext context) => single_page_baru(),
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
