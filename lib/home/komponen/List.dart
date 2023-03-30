import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:miniawradreborn2/home/komponen/bunder.dart';

class ListHome extends StatefulWidget {
  const ListHome({super.key});

  @override
  State<ListHome> createState() => _ListHomeState();
}

class _ListHomeState extends State<ListHome> {
  bool _isAlwaysShown = true;
  late final ScrollController _scrollController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        showTrackOnHover: true,
        isAlwaysShown: _isAlwaysShown,
        controller: _scrollController,
        child: ListView(
          // controller: _scrollController,
          scrollDirection: Axis.horizontal,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
          ],
        ),
      ),
    );
  }
}
