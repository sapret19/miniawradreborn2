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
        child: SingleChildScrollView(
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
                    child: Image.asset(
                      "assets/images/icon12.png",
                      scale: 2,
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Align(
                    alignment: Alignment.center,
                    child: Text("Annur2App",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Montserrat',
                            fontSize: 20))),
              ),

            Container(
              child: Align(
                  alignment: Alignment.center,
                  child: Text("v2.0.1",
                      style:
                          TextStyle(fontFamily: 'Montserrat', fontSize: 16))),
            ),
            Container(
              child: Align(
                  alignment: Alignment.center,
                  child: Text("Divisi Cyber MediaTech An-Nur II",
                      style:
                          TextStyle(fontFamily: 'Montserrat', fontSize: 11))),
            ),
            Container(
              child: Align(
                  alignment: Alignment.center,
                  child: Text("© Copyright_2023",
                      style:
                          TextStyle(fontFamily: 'Montserrat', fontSize: 11))),
            ),
            // © annur2malang
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
                  Image.asset('assets/images/hand.png', scale: 10),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Cubit melebar/mengecil untuk\nmemperbesar/memperkecil layar',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        '*',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
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
                  Image.asset('assets/images/hands1.png', scale: 10),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Doble tap juga bisa untuk\nmeperbesar/memperkecil layar',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        '*',
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            // SizedBox(
            //   height: 15,
            // ),
            // Text(
            //   '*',
            //   style: TextStyle(
            //       fontFamily: 'Montserrat',
            //       color: Colors.red,
            //       fontSize: 16,
            //       fontWeight: FontWeight.w400),
            // ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: '*',
                      style: TextStyle(
                          color: Colors.red,
                          fontFamily: 'Montserrat',
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text:
                          'Khusus pada Dalailul Khairat dan Kitab Syi`ir',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontSize: 15,
                          fontWeight: FontWeight.normal),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),)
    );
  }
}
