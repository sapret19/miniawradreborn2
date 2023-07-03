import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:miniawradreborn2/card.dart';
import 'package:miniawradreborn2/home/komponen/bunder.dart';
import 'package:miniawradreborn2/home/komponen/more.dart';
import 'package:miniawradreborn2/slider/slider_pengumuman.dart';
import 'package:miniawradreborn2/slider/slider_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../slider/slider_model.dart';

class body extends StatefulWidget {
  body({super.key});

  @override
  State<body> createState() => _bodyState();
}

class _bodyState extends State<body> {
  List<SliderModel> images = [];
  final Uri _url = Uri.parse(
      'https://api.whatsapp.com/send/?phone=6281358049894&text=Assalamualaikum%0ASaya%20pesan%20buku%20saku%20Awrad%20Santri%0A%0AAtas%20nama:%0AAlamat%20pengiriman:%0AJumlah:%0A%0ATerima%20kasih');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // fetchImages();
  }

  final ScrollController _firstcontroller = ScrollController();
  @override
  Widget build(BuildContext context) {
    double scale;
    Alignment gambar;
    double aspectratio;
    double size;

    if (context.isPortrait) {
      size = MediaQuery.of(context).size.width / 3.6;
    } else if (context.isLargeTablet) {
      size = MediaQuery.of(context).size.width / 6;
    } else if (context.isLandscape) {
      size = MediaQuery.of(context).size.width / 6;
    } else {
      size = MediaQuery.of(context).size.width / 9;
    }

    if (context.isTablet) {
      aspectratio = 16 / 9;
    } else if (context.isLargeTablet) {
      aspectratio = 32 / 9;
    } else {
      aspectratio = 9 / 16;
    }

    if (context.isTablet) {
      gambar = Alignment.bottomCenter;
    } else if (context.isLargeTablet) {
      gambar = Alignment.center;
    } else {
      gambar = Alignment.bottomCenter;
    }
    //scale
    if (context.isTablet) {
      scale = 1;
    } else {
      scale = 10;
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
              child: sliderBuilder()
                  .animate()
                  .moveY(delay: 100.ms, duration: 700.ms)),
          Container(
            width: 85.w,
            height: 220,
            transform: Matrix4.translationValues(0, -70, 1),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromARGB(108, 158, 158, 158),
                      offset: Offset(0, 0),
                      spreadRadius: 1,
                      blurRadius: 1),
                ]),
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 15, bottom: 15, left: 3, right: 3),
              child: SingleChildScrollView(
                  controller: _firstcontroller,
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: size,
                            child: Column(
                              children: [
                                const bunder(
                                  icon: "tawassul.png",
                                  text: "Tawassul",
                                  rute: "/tawassul",
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const bunder(
                                  icon: "birrul.png",
                                  text: "Birrul Walidayn",
                                  rute: "/birrul",
                                ),
                                // more()
                              ],
                            ),
                          ),
                          Container(
                            width: size,
                            child: Column(
                              children: [
                                const bunder(
                                  icon: "yasin.png",
                                  text: "Yasin & Tahlil",
                                  rute: "/yasintahlil",
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const bunder(
                                  icon: "istighosah.png",
                                  text: "Istighosah",
                                  rute: "/istighosah",
                                ),
                              ],
                            ),
                          ),
                          Container(
                            width: size,
                            child: Column(
                              children: [
                                const bunder(
                                  icon: "waqiah.png",
                                  text: "Al-Waqi'ah",
                                  rute: "/waqiah",
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const more()
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ).animate().moveX(delay: 100.ms, duration: 700.ms)),
            ),
          ),
          Container(
            transform: Matrix4.translationValues(0, -55, 1),
            child: bannerpeng(),
          ).animate().moveY(delay: 700.ms, duration: 500.ms),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 20,
              ),
              Container(
                transform: Matrix4.translationValues(0, -55, 1),
                width: 6,
                height: 19,
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(70))),
              ),
              const SizedBox(
                width: 12,
              ),
              Container(
                  transform: Matrix4.translationValues(0, -55, 1),
                  child: const Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Artikel Terbaru",
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                      textAlign: TextAlign.left,
                    ),
                  )),
            ],
          ),
          WordPressArticles(),
          GestureDetector(
            onTap: () {
              launchUrl(_url, mode: LaunchMode.externalApplication);
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Container(
                  transform: Matrix4.translationValues(0, -30, 1),
                  width: 85.w,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromARGB(45, 158, 158, 158),
                            offset: Offset(0, 0),
                            spreadRadius: 1,
                            blurRadius: 1),
                      ]),
                  child: Image.asset('assets/images/awrad.png')),
            ),
          ),
          // SizedBox(
          //   height: 12,
          // ),

          // Padding(
          //   padding: const EdgeInsets.only(bottom: 8.0),
          //   child: Container(
          //       // transform: Matrix4.translationValues(0, -30, 1),
          //       width: 85.w,
          //       decoration: BoxDecoration(
          //           borderRadius: BorderRadius.all(Radius.circular(10)),
          //           boxShadow: [
          //             BoxShadow(
          //                 color: Color.fromARGB(45, 158, 158, 158),
          //                 offset: Offset(0, 0),
          //                 spreadRadius: 1,
          //                 blurRadius: 1),
          //           ]),
          //       child: Image.asset('assets/images/bannerbaru.png')),
          // ),
        ],
      ),
    );
  }
}
