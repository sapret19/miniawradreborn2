import 'dart:io';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class Detail_syair extends StatefulWidget {
  final String path;
  final String judul;
   Detail_syair(
      {super.key, required this.judul,required this.path});

  @override
  State<Detail_syair> createState() => _Detail_syairState();
}

class _Detail_syairState extends State<Detail_syair> {
//  final String storagePath = 'dalail/dalail_ahad.pdf';

  Future<String> getDownloadURL() async {
    final firebase_storage.Reference ref = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child(widget.path);
    final String downloadURL = await ref.getDownloadURL();
    return downloadURL;
  }

  Future<String> downloadPDF(String url) async {
    final file = await DefaultCacheManager().getSingleFile(url);
    return file.path;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 39, 110, 176),
        centerTitle: true,
        title: Text(
          '${widget.judul}',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder<String>(
        future: getDownloadURL(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return FutureBuilder<String>(
              future: downloadPDF(snapshot.data!),
              builder: (context, pdfSnapshot) {
                if (pdfSnapshot.hasData) {
                  return SfPdfViewer.file(
                    File(pdfSnapshot.data!),
                  );
                } else if (pdfSnapshot.hasError) {
                  return Center(
                    child: Text(
                      'Terjadi kesalahan: ${pdfSnapshot.error}',
                    ),
                  );
                } else {
                  return Container(
                    decoration: BoxDecoration(color: Colors.black12),
                  );
                }
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Terjadi kesalahan: ${snapshot.error}',
              ),
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
