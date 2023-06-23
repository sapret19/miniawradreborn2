import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:miniawradreborn2/Syair/Detail_syair.dart';
import 'package:miniawradreborn2/page/page.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class IniKitab extends StatelessWidget {
  const IniKitab({super.key});

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
      body: GridView.count(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        children: List.generate(images.length, (index) {
          String judul = images[index]['judul'];
          String gambar = images[index]['gambar'];

          Future<String> getDownloadURL() async {
            final firebase_storage.Reference ref = firebase_storage
                .FirebaseStorage.instance
                .ref()
                .child("katalog/$gambar");
            final String downloadURL = await ref.getDownloadURL();
            return downloadURL;
          }

          Future<String> downloadgambar(String url) async {
            final file = await DefaultCacheManager().getSingleFile(url);
            return file.path;
          }

          return GestureDetector(
            onTap: () {
              if (judul == "Maladzatul Aishi") {
                Get.to(Detail_syair(judul: "Maladzatul Aishi", path: "kitab/maladzatul.pdf"));
              }else if  (judul == "Lamiyah") {
                Get.to(Detail_syair(judul: "Lamiyah", path: "kitab/lamiyah.pdf"));
              }else if (judul == "Lisanul Fata") {
                Get.to(Detail_syair(judul: "Lisanul Fata", path: "kitab/lisanul-fata.pdf"));
              }else if (judul == "Nabawiyah") {
                Get.to(Detail_syair(judul: "Nabawiyah", path: "kitab/nabawiyah.pdf"));
              }else if (judul == "Sang Purnama") {
                Get.to(Detail_syair(judul: "Sang Purnama", path: "kitab/purnama.pdf"));
              }else if (judul == "Unwanul Hikam") {
                Get.to(Detail_syair(judul: "Unwanul Hikam", path: "kitab/unwanul.pdf"));
              }
            },
            child: Card(
              margin: EdgeInsets.only(left: 30, right: 30, top: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color.fromARGB(255, 84, 181, 246),
                      Color.fromARGB(255, 39, 110, 176),
                    ],
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 0),
                      color: Color.fromARGB(255, 143, 143, 143),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: FutureBuilder<String>(
                        future: getDownloadURL(),
                        builder: (BuildContext context,
                            AsyncSnapshot<String> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Maaf anda sedang Offline",textAlign: TextAlign.center,),
                                CircularProgressIndicator()
                              ],
                            );
                          }
                          if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          }
                          if (snapshot.hasData) {
                            return Container(
                              margin:
                                  EdgeInsets.only(left: 20, right: 20, top: 1),
                              child: Image.network(snapshot.data!),
                            );
                          }
                          return CircularProgressIndicator();
                        },
                      ),
                    ),
                    Text(
                      judul,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

List<Map<String, dynamic>> images = [
  {
    'judul': 'Maladzatul Aishi',
    'gambar': 'aishi.png',
  },
  {
    'judul': 'Lamiyah',
    'gambar': 'lamiyah.png',
  },
  {
    'judul': 'Lisanul Fata',
    'gambar': 'lisan11.png',
  },
  {
    'judul': 'Nabawiyah',
    'gambar': 'nabawiyah.png',
  },
  {
    'judul': 'Sang Purnama',
    'gambar': 'purnama.png',
  },
  {
    'judul': 'Unwanul Hikam',
    'gambar': 'unwan.png',
  },
];
