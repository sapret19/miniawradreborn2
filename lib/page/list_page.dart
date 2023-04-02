import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:miniawradreborn2/page/appbar_page.dart';
import 'package:miniawradreborn2/page/model_list.dart';
import 'package:miniawradreborn2/page/single_list.dart';

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
                height: 500,
                child: ListView.separated(
                    itemBuilder: ((context, index) {
                      return ListTile(
                        leading: Text(
                          "${index + 1}",
                          style: const TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.blue),
                        ),
                        title: Text(
                          Modellist[index].nama,
                          style: const TextStyle(
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.blue),
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => single_list(
                                  Modellist: Modellist,
                                  index: index,
                                  Modelpdf: Modelpdf)));
                        },
                      );
                    }),
                    separatorBuilder: ((context, index) {
                      return Container(
                        height: 1,
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        color: Colors.blue,
                      );
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
