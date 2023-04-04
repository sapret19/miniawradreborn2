import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:miniawradreborn2/home/komponen/body.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "MINI AWRAD SANTRI",
          style:
              TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w400),
        ),
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
        // toolbarHeight: 10.h,

        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 39, 110, 176),
      ),
      body: body(),
    );
  }
}
