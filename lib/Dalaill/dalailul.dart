import 'package:flutter/material.dart';
import 'package:miniawradreborn2/Dalaill/Detail.dart';

class DalailPage extends StatelessWidget {
  // final String Harihari;
  

  DalailPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final String Hari;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 39, 110, 176),
          centerTitle: true,
          title: const Text(
            'Dalailul Khairat',
            style: TextStyle(
                fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
          ),
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: ListView.separated(
                itemCount: 7,
                itemBuilder: ((context, index) {
                  final DaftarHari = idHari(index);

                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailDalail(
                                storagePath: filePDF(DaftarHari),
                                NamaHari: DaftarHari,
                              )));
                    },
                    child: Container(
                      height: 70,
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 39, 110, 176),
                          borderRadius: BorderRadius.all(Radius.circular(15))),
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
                            DaftarHari,
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
                  //   ),
                  //   title: Text(
                  //     DaftarHari,
                  //     style: const TextStyle(
                  //         fontFamily: 'Montserrat',
                  //         fontWeight: FontWeight.w500,
                  //         fontSize: 16,
                  //         color: Colors.blue),
                  //   ),
                  //   onTap: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) => DetailDalail(
                  //                 storagePath: filePDF(DaftarHari),
                  //                 NamaHari: DaftarHari,
                  //               )),
                  //     );
                  //   },
                  // );
                }),
                separatorBuilder: ((context, index) {
                  return SizedBox(
                    height: 20,
                  );
                  // Container(
                  //   height: 1,
                  //   margin: EdgeInsets.only(left: 20, right: 20),
                  //   color: Colors.blue,
                  // );
                })),
          ),
        ));
  }
}

String idHari(int index) {
  switch (index) {
    case 0:
      return "Dalailul Khairat Senin";
    case 1:
      return "Dalailul Khairat Selasa";
    case 2:
      return "Dalailul Khairat Rabu";
    case 3:
      return "Dalailul Khairat Kamis";
    case 4:
      return "Dalailul Khairat Jumat";
    case 5:
      return "Dalailul Khairat Sabtu";
    case 6:
      return "Dalailul Khairat Ahad";
    default:
      return "Tidak valid";
  }
}

String filePDF(String Harihari) {
  switch (Harihari) {
    case 'Dalailul Khairat Ahad':
      return 'dalail/dalail_ahad.pdf';
    case 'Dalailul Khairat Senin':
      return 'dalail/dalail_senin.pdf';
    case 'Dalailul Khairat Selasa':
      return 'dalail/dalail_selasa.pdf';
    case 'Dalailul Khairat Rabu':
      return 'dalail/dalail_rabu.pdf';
    case 'Dalailul Khairat Kamis':
      return 'dalail/dalail_kamis.pdf';
    case 'Dalailul Khairat Jumat':
      return 'dalail/dalail_jumat.pdf';
    case 'Dalailul Khairat Sabtu':
      return 'dalail/dalail_sabtu.pdf';
    default:
      return 'Hari Tidak Valid';
  }
}
