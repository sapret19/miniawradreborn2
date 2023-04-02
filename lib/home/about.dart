import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class about extends StatelessWidget {
  const about({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(
      //     "MINI AWRAD SANTRI",
      //     style:
      //         TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.w400),
      //   ),
      //   centerTitle: true,
      //   backgroundColor: Color.fromARGB(255, 39, 110, 176),
      // ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60,
            ),
            Container(
              child: Align(
                  alignment: Alignment.center,
                  child: Image.asset("assets/images/head.png")),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Align(
                  alignment: Alignment.center,
                  child: Text("Mini Awrad Santri",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontFamily: 'Montserrat',
                          fontSize: 20))),
            ),
            Container(
              child: Align(
                  alignment: Alignment.center,
                  child: Text("v2.0.0",
                      style:
                          TextStyle(fontFamily: 'Montserrat', fontSize: 16))),
            ),
            SizedBox(
              height: 70,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Icon(
                    Icons.text_fields,
                    size: 50,
                    color: Color.fromARGB(255, 39, 110, 176),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Tombol untuk mengatur ukuran\nfont tulisan',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Icon(
                    Icons.text_fields,
                    size: 50,
                    color: Color.fromARGB(255, 39, 110, 176),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Cubit melebar/mengecil untuk\nmemperbesar/memperkecil layar*',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Icon(
                    Icons.text_fields,
                    size: 50,
                    color: Color.fromARGB(255, 39, 110, 176),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Doble tap juga bisa untuk\nmeperbesar/memperkecil layar*',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 20),
              child: Text(
                '*Khusus pada Qosidah Burdah,Dalailul Khairat,\ndan Kitab Syi`ir',
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 15,
                    fontWeight: FontWeight.normal),
              ),
            )
          ],
        ),
      ),
    );
  }
}
