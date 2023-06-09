import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:pdfx/pdfx.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class page extends StatelessWidget {
  final String judulpage;
  final String pdfpage;
  page({super.key, required this.judulpage, required this.pdfpage});

  @override
  Widget build(BuildContext context) {
    final pdfController = PdfController(
      document: PdfDocument.openAsset('assets/pdf/${pdfpage}'),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 39, 110, 176),
        centerTitle: true,
        title: Text(
          '${judulpage}',
          style:
              TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          width: MediaQuery.of(context).size.width,
          // height: 500,
          height: 600,
          margin: EdgeInsets.all(20),
          // padding: EdgeInsets.all(20),
          child: Container(
              child: PdfView(
            controller: pdfController,
            scrollDirection: Axis.vertical,
          )),
        ),
      ),
    );
  }
}
