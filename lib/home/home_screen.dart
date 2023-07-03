import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:miniawradreborn2/home/komponen/body.dart';
import 'package:miniawradreborn2/notification_services.dart';
import 'package:sizer/sizer.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:in_app_update/in_app_update.dart' as appUpdate;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void checkVersiAplikasi() async {
    await appUpdate.InAppUpdate.checkForUpdate().then((info) {
      if (info.updateAvailability == true) {
        appUpdate.InAppUpdate.startFlexibleUpdate().catchError((e) {});
      }
    });
  }

  NotificationServices notificationServices = NotificationServices();

  @override
  void initState() {
    // TODO: implement initState
    // checkVersiAplikasi();

    super.initState();

    notificationServices.requestNoticationPermission();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      // backgroundColor: Colors.transparent,
      appBar: AppBar(
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: 88.w,
              height: 60,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Image.asset(
                'assets/images/anyarlagi.png',
                scale: 8,
              ),
            ),
          ),
          // title: Text(
          //   "MINI AWRAD SANTRI",
          //   style:
          //       TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w400),
          // ),
          // title: Container(
          //   // height: 10.h,
          //   child: Column(children: [
          //     Text(
          //       "Mini Awrad Santri",
          //       style: TextStyle(
          //           fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
          //     ),
          //     Text(
          //       "Pondok Pesantren Wisata",
          //       style: TextStyle(
          //         fontFamily: 'Montserrat',
          //         fontWeight: FontWeight.w400,
          //       ),
          //     ),
          //   ]),
          // ),
          toolbarHeight: 80,
          centerTitle: true,
          backgroundColor: Color.fromARGB(0, 255, 0, 0)),
      body: body(),
    );
  }
}
