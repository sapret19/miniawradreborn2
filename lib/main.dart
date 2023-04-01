import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniawradreborn2/api.dart';
import 'package:miniawradreborn2/api.dart';
import 'package:miniawradreborn2/home/Nav_bar.dart';
import 'package:miniawradreborn2/home/home_screen.dart';
import 'package:miniawradreborn2/home/komponen/List.dart';
import 'package:miniawradreborn2/maneh.dart';
import 'package:miniawradreborn2/page/grid_page.dart';
import 'package:miniawradreborn2/page/list_page.dart';
import 'package:miniawradreborn2/page/page.dart';
import 'package:miniawradreborn2/page/tabbar_diba.dart';
import 'package:miniawradreborn2/page/tabbar_sabul.dart';
import 'package:miniawradreborn2/page/tabbar_waqiah.dart';
import 'package:miniawradreborn2/page/tabbar_yasin.dart';
import 'package:miniawradreborn2/page_baru/single_page_baru.dart';
import 'package:miniawradreborn2/pdf.dart';
import 'package:miniawradreborn2/per.dart';
import 'package:miniawradreborn2/rute.dart';
import 'package:miniawradreborn2/sizecoba.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        title: 'Mini Awrad Santri',
        theme: ThemeData(),
        home: PostList(),
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: rute,
      );
    });
  }
}
