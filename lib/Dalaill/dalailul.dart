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
          style:
              TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.separated(
          itemCount: 7,
          itemBuilder: ((context, index) {
            final DaftarHari = idHari(index);

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
                DaftarHari,
                style: const TextStyle(
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.blue),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailDalail(
                            storagePath: filePDF(DaftarHari),
                            NamaHari: DaftarHari,
                          )),
                );
              },
            );
            
          }),
          separatorBuilder: ((context, index) {
            return Container(
              height: 1,
              margin: EdgeInsets.only(left: 20, right: 20),
              color: Colors.blue,
            );
          })
          
      )     
    );
  }
}

String idHari(int index) {
  switch (index) {
    case 0:
      return "Dalail Senin";
    case 1:
      return "Dalail Selasa";
    case 2:
      return "Dalail Rabu";
    case 3:
      return "Dalail Kamis";
    case 4:
      return "Dalail Jumat";
    case 5:
      return "Dalail Sabtu";
    case 6:
      return "Dalail Ahad";
    default:
      return "Tidak valid";
  }
}

String filePDF(String Harihari) {
  switch (Harihari) {
    case 'Dalail Ahad':
      return 'dalail/dalail_ahad.pdf';
    case 'Dalail Senin':
      return 'dalail/dalail_senin.pdf';
    case 'Dalail Selasa':
      return 'dalail/dalail_selasa.pdf';
    case 'Dalail Rabu':
      return 'dalail/dalail_rabu.pdf';
    case 'Dalail Kamis':
      return 'dalail/dalail_kamis.pdf';
    case 'Dalail Jumat':
      return 'dalail/dalail_jumat.pdf';
    case 'Dalail Sabtu':
      return 'dalail/dalail_sabtu.pdf';
    default:
      return 'Hari Tidak Valid';
  }
}
