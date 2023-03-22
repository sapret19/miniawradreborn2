import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Tabbar_diba extends StatefulWidget {
  const Tabbar_diba({super.key});

  @override
  State<Tabbar_diba> createState() => _Tabbar_pageState();
}

class _Tabbar_pageState extends State<Tabbar_diba> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: DefaultTabController(
        length: 27,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 160,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(255, 39, 110, 176),
                        spreadRadius: 1,
                        offset: Offset(0, 0),
                        blurRadius: 10)
                  ],
                  image: DecorationImage(
                      image: ExactAssetImage('assets/images/gerbangdrone.jpg'),
                      fit: BoxFit.fitWidth,
                      opacity: 230),
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(35)),
                  gradient: LinearGradient(
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
                        margin: EdgeInsets.fromLTRB(17, 35, 0, 17),
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromARGB(255, 39, 110, 176),
                                spreadRadius: 0,
                                offset: Offset(0, 0),
                                blurRadius: 6)
                          ],
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          image: DecorationImage(
                              image: AssetImage('assets/images/back.png')),
                        ),
                      ),
                    ),
                    //Judul
                    Container(
                      margin: EdgeInsets.only(left: 17),
                      child: Text(
                        "Maulid Diba",
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
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 227, 227, 227),
                    borderRadius: BorderRadius.all(Radius.circular(11)),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 4,
                          color: Color.fromARGB(255, 194, 194, 194))
                    ]),
                // ignore: prefer_const_constructors
                child: TabBar(
                    isScrollable: true,
                    // ignore: prefer_const_constructors
                    indicator: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(11)),
                        // ignore: prefer_const_literals_to_create_immutables
                        boxShadow: [
                          const BoxShadow(
                              offset: Offset(0, 0),
                              blurRadius: 4,
                              spreadRadius: 1,
                              color: Color.fromARGB(255, 194, 194, 194))
                        ]),
                    tabs: const [
                      nama_tab(namatab: "Ya Rabbi shalli..."),
                      nama_tab(namatab: 'Laqod jaakum...'),
                      nama_tab(namatab: 'Ya Rasulallah...'),
                      nama_tab(namatab: 'Al-hamdulillahil qawiyy...'),
                      nama_tab(namatab: "Qila huwa adam..."),
                      nama_tab(namatab: "Yub'atsu min tihamah..."),
                      nama_tab(namatab: 'Tsumma ardudduhu...'),
                      nama_tab(namatab: 'Shalatullahi ma lahat...'),
                      nama_tab(namatab: "Fasubhanaman khashshahu..."),
                      nama_tab(namatab: 'Awwalu ma nastaftihu...'),
                      nama_tab(namatab: 'Al-haditsul awwal...'),
                      nama_tab(namatab: 'Al-haditsul tsani...'),
                      nama_tab(namatab: "Fayaqulul haqqu..."),
                      nama_tab(namatab: 'Ahdliru qulubakum...'),
                      nama_tab(namatab: 'Fahtazzal arsyu...'),
                      nama_tab(namatab: 'Mahallul Qiyam...'),
                      nama_tab(namatab: "Wawulida shallallahu..."),
                      nama_tab(namatab: 'Qila man yakfulu...'),
                      nama_tab(namatab: "Tsumma a'radla..."),
                      nama_tab(namatab: "Fabainama huwa dzata..."),
                      nama_tab(namatab: 'Faqolatil malaikatu...'),
                      nama_tab(namatab: "Fabainama habibu..."),
                      nama_tab(namatab: "Falamma ra'athu..."),
                      nama_tab(namatab: 'Wa kana shallallahu...'),
                      nama_tab(namatab: "Wa qila liba'dhihim..."),
                      nama_tab(namatab: "Wa ma 'asa an yuqala..."),
                      nama_tab(namatab: "Ya badratim..."),
                    ]),
              ),
              Container(
                height: 600,
                width: MediaQuery.of(context).size.width,
                child: const TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      page_tab(pagetab: 'Sajdah.pdf'),
                      page_tab(pagetab: 'Yasintok.pdf'),
                      page_tab(pagetab: 'Fushilat.pdf'),
                      page_tab(pagetab: 'Dukhon.pdf'),
                      page_tab(pagetab: 'Waqiah.pdf'),
                      page_tab(pagetab: 'Hasyr.pdf'),
                      page_tab(pagetab: 'Mulk.pdf'),
                      page_tab(pagetab: 'Sajdah.pdf'),
                      page_tab(pagetab: 'Yasintok.pdf'),
                      page_tab(pagetab: 'Fushilat.pdf'),
                      page_tab(pagetab: 'Dukhon.pdf'),
                      page_tab(pagetab: 'Waqiah.pdf'),
                      page_tab(pagetab: 'Hasyr.pdf'),
                      page_tab(pagetab: 'Mulk.pdf'),
                      page_tab(pagetab: 'Sajdah.pdf'),
                      page_tab(pagetab: 'Yasintok.pdf'),
                      page_tab(pagetab: 'Fushilat.pdf'),
                      page_tab(pagetab: 'Dukhon.pdf'),
                      page_tab(pagetab: 'Waqiah.pdf'),
                      page_tab(pagetab: 'Hasyr.pdf'),
                      page_tab(pagetab: 'Mulk.pdf'),
                      page_tab(pagetab: 'Sajdah.pdf'),
                      page_tab(pagetab: 'Yasintok.pdf'),
                      page_tab(pagetab: 'Fushilat.pdf'),
                      page_tab(pagetab: 'Dukhon.pdf'),
                      page_tab(pagetab: 'Waqiah.pdf'),
                      page_tab(pagetab: 'Hasyr.pdf'),
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
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SfPdfViewer.asset('assets/pdf/${pagetab}'),
    );
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
        style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Color.fromARGB(255, 28, 80, 130)),
      ),
    );
  }
}
