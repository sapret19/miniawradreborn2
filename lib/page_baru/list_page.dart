import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:miniawradreborn2/model_list.dart';
import 'package:miniawradreborn2/page_baru/single_list.dart';

class list extends StatelessWidget {
  final List<Model_list> Modellist = List.generate(
      nama.length, (index) => Model_list("${nama[index].toString()}"));

  final List<Model_pdf> Modelpdf = List.generate(
      pdf.length, (index) => Model_pdf('${pdf[index].toString()}'));

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 39, 110, 176),
        centerTitle: true,
        title: const Text(
          'Dalailul Khairat',
          style:
              TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // AppBar_normalpage(judul: 'Dalailul Khoirot'),
            Container(
              margin: EdgeInsets.all(20),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: ListView.separated(
                    itemBuilder: ((context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => single_list(
                                  Modellist: Modellist,
                                  index: index,
                                  Modelpdf: Modelpdf)));
                        },
                        child: Container(
                          height: 70,
                          width: double.infinity,
                          padding: EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 39, 110, 176),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Row(
                            children: [
                              Text(
                                '${index + 1}',
                                style: const TextStyle(
                                    fontFamily: 'Monserrat',
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                Modellist[index].nama,
                                style: const TextStyle(
                                    fontFamily: 'Monserrat',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                              Spacer(),
                              Image.asset(
                                'assets/images/panah.png',
                                color: Colors.white,
                                scale: 17,
                              ),
                              SizedBox(
                                width: 20,
                              )
                            ],
                          ),
                        ),
                      );
                      // ListTile(
                      //   leading: Text(
                      //     "${index + 1}",
                      //     style: const TextStyle(
                      //         fontFamily: 'Montserrat',
                      //         fontWeight: FontWeight.w500,
                      //         fontSize: 16,
                      //         color: Colors.blue),
                      //   ).animate().slideY(duration: 500.ms,).fadeIn(),
                      //   title: Text(
                      //     Modellist[index].nama,
                      //     style: const TextStyle(
                      //         fontFamily: 'Montserrat',
                      //         fontWeight: FontWeight.w500,
                      //         fontSize: 16,
                      //         color: Colors.blue),
                      //   ),
                      //   onTap: () {
                      //     Navigator.of(context).push(MaterialPageRoute(
                      //         builder: (context) => single_list(
                      //             Modellist: Modellist,
                      //             index: index,
                      //             Modelpdf: Modelpdf)));
                      //   },
                      // );
                    }),
                    separatorBuilder: ((context, index) {
                      return SizedBox(
                        height: 20,
                      );
                      //  Container(
                      //   height: 1,
                      //   margin: const EdgeInsets.only(left: 20, right: 20),
                      //   color: Color.fromARGB(255, 19, 28, 36),
                      // );
                    }),
                    itemCount: nama.length),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<String> nama = [
  "Dalailul Khairat Ahad",
  "Dalailul Khairat Senin",
  "Dalailul Khairat Selasa",
  "Dalailul Khairat Rabu",
  "Dalailul Khairat Kamis",
  "Dalailul Khairat Jum'at",
  "Dalailul Khairat Sabtu",
];

List<String> pdf = [
  "assets/pdf/dalail_ahad.pdf",
  "assets/pdf/dalail_senin.pdf",
  "assets/pdf/dalail_selasa.pdf",
  "assets/pdf/dalail_rabu.pdf",
  "assets/pdf/dalail_kamis.pdf",
  "assets/pdf/dalail_jumat.pdf",
  "assets/pdf/dalail_sabtu.pdf",
];
