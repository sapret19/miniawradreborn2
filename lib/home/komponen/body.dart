import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:miniawradreborn2/home/komponen/bunder.dart';
import 'package:miniawradreborn2/home/komponen/head.dart';
import 'package:miniawradreborn2/page/grid_page.dart';
import 'package:miniawradreborn2/page/page.dart';
import 'package:miniawradreborn2/page/tabbar_sabul.dart';
import 'package:miniawradreborn2/page/tabbar_waqiah.dart';
import 'package:miniawradreborn2/page/tabbar_yasin.dart';
import 'package:sizer/sizer.dart';

class body extends StatefulWidget {
  const body({super.key});

  @override
  State<body> createState() => _bodyState();
}

class _bodyState extends State<body> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const head(),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            transform: Matrix4.translationValues(0, -45, 1),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(55),
                    topRight: Radius.circular(55))),
            child: Container(
              margin: const EdgeInsets.only(top: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const bunder(
                        icon: "tawassul.png",
                        text: "Tawassul",
                        rute: "/tawassul",
                      ),
                      const bunder(
                        icon: "birrul.png",
                        text: "Birrul Walidayn",
                        rute: "/birrul",
                      ),
                      const bunder(
                        icon: "yasin.png",
                        text: "Yasin & Tahlil",
                        rute: "/yasintahlil",
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const bunder(
                        icon: "istighosah.png",
                        text: "Istighosah",
                        rute: "/istighosah",
                      ),
                      const bunder(
                        icon: "waqiah.png",
                        text: "Al-Waqiah",
                        rute: "/waqiah",
                      ),
                      const bunder(
                        icon: "burdah.png",
                        text: "Burdah",
                        rute: "/burdah",
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const bunder(
                        icon: "diba.png",
                        text: "Maulid Diba",
                        rute: "/diba",
                      ),
                      const bunder(
                        icon: "sabul.png",
                        text: "Sabul Munjiyat",
                        rute: "/sabul",
                      ),
                      const bunder(
                        icon: "dalail.png",
                        text: "Dalail",
                        rute: "/dalail",
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const bunder(
                    icon: "kitab.png",
                    text: "Kitab Syair",
                    rute: "/kitab",
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
