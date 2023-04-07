import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:miniawradreborn2/page/appbar_page.dart';
import 'package:get/get.dart';
import 'package:miniawradreborn2/page/page.dart';

class grid_page extends StatefulWidget {
  const grid_page({super.key});

  @override
  State<grid_page> createState() => _grid_pageState();
}

class _grid_pageState extends State<grid_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 39, 110, 176),
        centerTitle: true,
        title: const Text(
          "Kitab Syi`ir",
          style:
              TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // const AppBar_normalpage(
            //   judul: 'Kitab-Kitab',
            // ),
            Container(
              child: Column(
                children: [
                  input_kitab(
                      page_kitab_kiri:
                          page(judulpage: 'Lamiyah', pdfpage: 'lamiyah.pdf'),
                      cover_kitab_kiri: 'lamiyah.png',
                      nama_kitab_kiri: 'Lamiyah',
                      page_kitab_kanan: page(
                          judulpage: 'Lisanul Fata',
                          pdfpage: 'lisanul-fata.pdf'),
                      cover_kitab_kanan: "lisan11.png",
                      nama_kitab_kanan: 'Lisanul Fata'),
                  input_kitab(
                      page_kitab_kiri: page(
                          judulpage: "Maladzatul `Aisy",
                          pdfpage: 'maladzatul.pdf'),
                      cover_kitab_kiri: 'aishi.png',
                      nama_kitab_kiri: "Maladzatul 'Aisy",
                      page_kitab_kanan: page(
                          judulpage: 'Sang Purnama', pdfpage: 'purnama.pdf'),
                      cover_kitab_kanan: 'purnama.png',
                      nama_kitab_kanan: 'Sang Purnama'),
                  input_kitab(
                      page_kitab_kiri: page(
                          judulpage: "`Unwanul Hikam", pdfpage: 'unwanul.pdf'),
                      cover_kitab_kiri: 'unwan.png',
                      nama_kitab_kiri: "'Unwanul Hikam",
                      page_kitab_kanan: page(
                          judulpage: "Hijrah Nabawi", pdfpage: 'nabawiyah.pdf'),
                      cover_kitab_kanan: 'nabawiyah.png',
                      nama_kitab_kanan: "Hijrah Nabawi"),
                  SizedBox(
                    height: 40,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class input_kitab extends StatelessWidget {
  final page_kitab_kiri;
  final String cover_kitab_kiri;
  final String nama_kitab_kiri;
  final page_kitab_kanan;
  final String cover_kitab_kanan;
  final String nama_kitab_kanan;
  const input_kitab({
    super.key,
    required this.page_kitab_kiri,
    required this.cover_kitab_kiri,
    required this.nama_kitab_kiri,
    required this.page_kitab_kanan,
    required this.cover_kitab_kanan,
    required this.nama_kitab_kanan,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 30,
      ),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          kitab_kiri(
              page_kitab_kiri: page_kitab_kiri,
              cover_kitab_kiri: cover_kitab_kiri,
              nama_kitab_kiri: nama_kitab_kiri),
          SizedBox(
            width: 40,
          ),
          kitab_kanan(
              page_kitab_kanan: page_kitab_kanan,
              cover_kitab_kanan: cover_kitab_kanan,
              nama_kitab_kanan: nama_kitab_kanan),
        ],
      ),
    );
  }
}

class kitab_kanan extends StatelessWidget {
  const kitab_kanan({
    super.key,
    required this.page_kitab_kanan,
    required this.cover_kitab_kanan,
    required this.nama_kitab_kanan,
  });

  final page_kitab_kanan;
  final String cover_kitab_kanan;
  final String nama_kitab_kanan;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(page_kitab_kanan);
      },
      child: Container(
        width: 100,
        height: 160,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 84, 181, 246),
                  Color.fromARGB(255, 39, 110, 176),
                ]),
            borderRadius: BorderRadius.all(Radius.circular(12)),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 0),
                  color: Color.fromARGB(255, 143, 143, 143),
                  blurRadius: 5,
                  spreadRadius: 1)
            ]),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              width: 72,
              height: 96,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                child: Image.asset(
                  'assets/images/${cover_kitab_kanan}',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(3, 8, 3, 10),
              child: Text(
                '${nama_kitab_kanan}',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class kitab_kiri extends StatelessWidget {
  const kitab_kiri({
    super.key,
    required this.page_kitab_kiri,
    required this.cover_kitab_kiri,
    required this.nama_kitab_kiri,
  });

  final page_kitab_kiri;
  final String cover_kitab_kiri;
  final String nama_kitab_kiri;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(page_kitab_kiri);
      },
      child: Container(
        width: 100,
        height: 160,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 84, 181, 246),
                  Color.fromARGB(255, 39, 110, 176),
                ]),
            borderRadius: BorderRadius.all(Radius.circular(12)),
            boxShadow: [
              BoxShadow(
                  offset: Offset(0, 0),
                  color: Color.fromARGB(255, 143, 143, 143),
                  blurRadius: 5,
                  spreadRadius: 1)
            ]),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              width: 72,
              height: 96,
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                child: Image.asset(
                  'assets/images/${cover_kitab_kiri}',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(3, 8, 3, 10),
              child: Text(
                '${nama_kitab_kiri}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
