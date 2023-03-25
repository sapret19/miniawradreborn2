import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pdfx/pdfx.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class Tabbar_waqiah extends StatefulWidget {
  const Tabbar_waqiah({super.key});

  @override
  State<Tabbar_waqiah> createState() => _Tabbar_pageState();
}

class _Tabbar_pageState extends State<Tabbar_waqiah> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: DefaultTabController(
        length: 3,
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
                        'Al-Waqiah',
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
                width: MediaQuery.of(context).size.width / 1.5,
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
                child: TabBar(
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
                      nama_tab(namatab: 'Al-Waqiah'),
                      nama_tab(namatab: 'Doa'),
                      nama_tab(namatab: 'Doa Shalat Hajat')
                    ]),
              ),
              Container(
                height: 600,
                width: MediaQuery.of(context).size.width,
                // margin: EdgeInsets.all(20),
                child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      page_tab(pagetab: 'Waqiah.pdf'),
                      page_tab(pagetab: 'doa_waqiah.pdf'),
                      page_tab(pagetab: 'hajat.pdf')
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
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Color.fromARGB(255, 28, 80, 130)),
      ),
    );
  }
}
