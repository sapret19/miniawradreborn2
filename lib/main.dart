import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:miniawradreborn2/api.dart';
import 'package:miniawradreborn2/api.dart';
import 'package:miniawradreborn2/home/home_screen.dart';
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
import 'package:miniawradreborn2/rute.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        title: 'Mini Awrad Santri',
        theme: ThemeData(),
        home: const single_page_baru(),
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: rute,
      );
    });
  }
}

// class tombol extends StatelessWidget {
//   const tombol({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         child: Center(
//           child: ButtonWidget(
//             text: 'Firebase PDF',
//             onClicked: () async {
//               final url = 'dalail_ahad.pdf';
//               final file = await PDFApi.loadFirebase(url);

//               if (file == null) return;
//               openPDF(context, file);
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }

// class ButtonWidget extends StatelessWidget {
//   final String text;
//   final VoidCallback onClicked;

//   const ButtonWidget({
//     Key? key,
//     required this.text,
//     required this.onClicked,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) => ElevatedButton(
//         style: ElevatedButton.styleFrom(
//           minimumSize: Size.fromHeight(50),
//         ),
//         child: Text(text, style: TextStyle(fontSize: 20)),
//         onPressed: onClicked,
//       );
// }
