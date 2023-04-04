import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:miniawradreborn2/card.dart';
import 'package:miniawradreborn2/home/komponen/bunder.dart';
import 'package:miniawradreborn2/home/komponen/more.dart';
import 'package:sizer/sizer.dart';
import 'package:carousel_slider/carousel_slider.dart';

class body extends StatefulWidget {
  body({super.key});

  final List<String> imgList = [
    "assets/images/4.png",
    "assets/images/1.png",
    "assets/images/3.png",
    "assets/images/5.png",
  ];

  @override
  State<body> createState() => _bodyState();
}

class _bodyState extends State<body> {
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
            height: context.isPortrait ? 75.h : 50.h,
            width: double.infinity,
            // width: double.infinity,
            child: CarouselSlider(
                items: widget.imgList
                    .map((item) => Image.asset(
                          item,
                          fit: BoxFit.cover,
                          height: double.infinity,
                          width: double.infinity,
                          scale: scale,
                          alignment: gambar,
                        ))
                    .toList(),
                options: CarouselOptions(
                    aspectRatio: aspectratio,
                    viewportFraction: 1,
                    autoPlay: true,
                    // height: 500,
                    pauseAutoPlayOnTouch: true)),
          ),
          Container(
            width: 88.w,
            height: 220,
            transform: Matrix4.translationValues(0, -70, 1),
            decoration: BoxDecoration(
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
              padding: EdgeInsets.all(17),
              child: SingleChildScrollView(
                controller: _firstcontroller,
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    // SizedBox(
                    //   height: 18,
                    // ),
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
                              SizedBox(
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
                              SizedBox(
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
                                text: "   Al-Waqi`ah",
                                rute: "/waqiah",
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              const more()
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Row(
          //   children: [
          //     SizedBox(
          //       width: 20,
          //     ),
          //     Container(
          //       transform: Matrix4.translationValues(0, -55, 1),
          //       width: 6,
          //       height: 19,
          //       decoration: BoxDecoration(
          //           color: Colors.blue,
          //           borderRadius: BorderRadius.all(Radius.circular(70))),
          //     ),
          //     SizedBox(
          //       width: 12,
          //     ),
          //     Container(
          //         transform: Matrix4.translationValues(0, -55, 1),
          //         child: Align(
          //           alignment: Alignment.topLeft,
          //           child: Text(
          //             "Artikel Terbaru",
          //             style: TextStyle(
          //                 fontFamily: 'Montserrat',
          //                 fontWeight: FontWeight.bold,
          //                 fontSize: 16),
          //             textAlign: TextAlign.left,
          //           ),
          //         )),
          //   ],
          // ),
          // WordPressArticles()
        ],
      ),
    );
  }
}
