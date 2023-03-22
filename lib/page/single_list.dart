import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:miniawradreborn2/page/appbar_page.dart';
import 'package:miniawradreborn2/page/model_list.dart';
import 'package:pdfx/pdfx.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

import 'list_page.dart';

class single_list extends StatefulWidget {
  final List<Model_list> Modellist;
  int index;
  final List<Model_pdf> Modelpdf;

  single_list(
      {super.key,
      required this.Modellist,
      required this.index,
      required this.Modelpdf});

  @override
  State<single_list> createState() => _single_listState();
}

class _single_listState extends State<single_list> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final pdfController = PdfController(
      document: PdfDocument.openAsset(widget.Modelpdf[widget.index].pdf!),
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBar_normalpage(judul: widget.Modellist[widget.index].nama),
            Container(
              decoration: BoxDecoration(color: Colors.white),
              width: MediaQuery.of(context).size.width,
              height: 600,
              margin: EdgeInsets.all(20),
              // padding: EdgeInsets.all(20),
              child: Container(
                  child: PdfView(
                controller: pdfController,
                scrollDirection: Axis.vertical,
              )
                  // SfPdfViewer.asset(
                  //   widget.Modelpdf[widget.index].pdf!,
                  //   enableDoubleTapZooming: true,
                  //   pageSpacing: 0,
                  //   initialZoomLevel: 0,
                  //   pageLayoutMode: PdfPageLayoutMode.continuous,
                  // ),
                  ),
            )
          ],
        ),
      ),
    );
  }
}





// appBar: AppBar(
      //   backgroundColor: Colors.blue,
      //   elevation: 0,
      //   leading: IconButton(
      //     onPressed: (() => Navigator.pop(context)),
      //     icon: Image.asset(
      //       'assets/images/back.png',
      //       color: Colors.white,
      //     ),
      //     padding: EdgeInsets.only(left: 20),
      //   ),
      //   title: Text(
      //     widget.Modellist[widget.index].nama,
      //     textAlign: TextAlign.start,
      //     maxLines: 4,
      //     style: TextStyle(
      //         fontFamily: 'Poppins', fontWeight: FontWeight.w500, fontSize: 18),
      //   ),
      //   centerTitle: true,
      // ),
      // body: Container(
      //   height: size.height,
      //   width: size.width,
      //   decoration: const BoxDecoration(color: Colors.blue),
      //   child: Container(
      //     margin: const EdgeInsets.only(top: 20),
      //     padding: const EdgeInsets.all(20),
      //     decoration: const BoxDecoration(
      //         color: Colors.white,
      //         borderRadius: BorderRadius.only(
      //             topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      //     child: Container(
      //       child: SfPdfViewer.asset(
      //         widget.Modelpdf[widget.index].pdf!,
      //         initialZoomLevel: 0,
      //         enableDoubleTapZooming: true,
      //         pageSpacing: 0,
      //       ),
      //     ),
      //   ),
      // ),