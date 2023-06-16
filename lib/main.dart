import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniawradreborn2/Dalaill/dalailul.dart';
import 'package:miniawradreborn2/card.dart';
import 'package:miniawradreborn2/home/Nav_bar.dart';
import 'package:miniawradreborn2/home/home_screen.dart';
import 'package:miniawradreborn2/home/splash.dart';
import 'package:miniawradreborn2/page_baru/list_page.dart';
import 'package:miniawradreborn2/rute.dart';
import 'package:miniawradreborn2/slider/slider_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:in_app_update/in_app_update.dart' as appUpdate;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseMessaging.instance.getInitialMessage();
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
        home: Screen(),
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: rute,
      );
    });
  }
}
