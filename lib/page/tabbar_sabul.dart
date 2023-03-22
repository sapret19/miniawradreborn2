import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pdfx/pdfx.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Tabbar_sabul extends StatefulWidget {
  const Tabbar_sabul({super.key});

  @override
  State<Tabbar_sabul> createState() => _Tabbar_pageState();
}

class _Tabbar_pageState extends State<Tabbar_sabul> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: DefaultTabController(
        length: 7,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 160,
                // ignore: prefer_const_constructors
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromARGB(255, 39, 110, 176),
                        spreadRadius: 1,
                        offset: Offset(0, 0),
                        blurRadius: 10)
                  ],
                  // ignore: prefer_const_constructors
                  image: DecorationImage(
                      image: const ExactAssetImage(
                          'assets/images/gerbangdrone.jpg'),
                      fit: BoxFit.fitWidth,
                      opacity: 230),
                  borderRadius:
                      const BorderRadius.only(bottomLeft: Radius.circular(35)),
                  gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromARGB(255, 84, 181, 246),
                        Color.fromARGB(255, 39, 110, 176),
                      ]),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Back Button
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(17, 35, 0, 17),
                        width: 40,
                        height: 40,
                        // ignore: prefer_const_constructors
                        decoration: BoxDecoration(
                          color: Colors.white,
                          // ignore: prefer_const_literals_to_create_immutables
                          boxShadow: [
                            const BoxShadow(
                                color: Color.fromARGB(255, 39, 110, 176),
                                spreadRadius: 0,
                                offset: Offset(0, 0),
                                blurRadius: 6)
                          ],
                          borderRadius:
                              const BorderRadius.all(Radius.circular(10)),
                          // ignore: prefer_const_constructors
                          image: DecorationImage(
                              image:
                                  const AssetImage('assets/images/back.png')),
                        ),
                      ),
                    ),
                    //Judul
                    Container(
                      margin: const EdgeInsets.only(left: 17),
                      // ignore: prefer_const_constructors
                      child: Text(
                        "Sab'ul Munjiyat",
                        // ignore: prefer_const_constructors
                        style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 40,
                width: MediaQuery.of(context).size.width / 1.2,
                transform: Matrix4.translationValues(0, -20, 2),
                // ignore: prefer_const_constructors
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 227, 227, 227),
                    borderRadius: const BorderRadius.all(Radius.circular(11)),
                    // ignore: prefer_const_literals_to_create_immutables
                    boxShadow: [
                      const BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 4,
                          color: Color.fromARGB(255, 194, 194, 194))
                    ]),
                child: const TabBar(
                    isScrollable: true,
                    indicator: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(11)),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 0),
                              blurRadius: 4,
                              spreadRadius: 1,
                              color: Color.fromARGB(255, 194, 194, 194))
                        ]),
                    tabs: [
                      nama_tab(namatab: 'As-Sajdah'),
                      nama_tab(namatab: 'Yasin'),
                      nama_tab(namatab: 'Fushilat'),
                      nama_tab(namatab: 'Ad-Dukhon'),
                      nama_tab(namatab: 'Al-Waqiah'),
                      nama_tab(namatab: 'Al-Hasyr'),
                      nama_tab(namatab: 'Al-Mulk'),
                    ]),
              ),
              // ignore: sized_box_for_whitespace
              Container(
                height: 600,
                width: MediaQuery.of(context).size.width,
                child: const TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      page_tab(pagetab: 'Sajdah.pdf'),
                      page_tab(pagetab: 'Yasin.pdf'),
                      page_tab(pagetab: 'Fushilat.pdf'),
                      page_tab(pagetab: 'Dukhon.pdf'),
                      page_tab(pagetab: 'Waqiah.pdf'),
                      page_tab(pagetab: 'Hasyr.pdf'),
                      page_tab(pagetab: 'Mulk.pdf'),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class page_tab extends StatelessWidget {
  final String pagetab;
  const page_tab({
    super.key,
    required this.pagetab,
  });

  @override
  Widget build(BuildContext context) {
    final pdfController = PdfController(
      document: PdfDocument.openAsset('assets/pdf/${pagetab}'),
    );
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: PdfView(
          controller: pdfController,
          scrollDirection: Axis.vertical,
        ));
  }
}

class nama_tab extends StatelessWidget {
  final String namatab;
  const nama_tab({
    super.key,
    required this.namatab,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Text(
        '${namatab}',
        style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Color.fromARGB(255, 28, 80, 130)),
      ),
    );
  }
}
