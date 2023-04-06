import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniawradreborn2/home/Nav_bar.dart';
import 'package:miniawradreborn2/home/splash.dart';
import 'package:miniawradreborn2/rute.dart';
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
        title: 'Annur2App',
        theme: ThemeData(),
        home: const Screen(),
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: rute,
      );
    });
  }
}
