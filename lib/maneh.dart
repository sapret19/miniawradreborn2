import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:miniawradreborn2/page/appbar_page.dart';
import 'package:pdfx/pdfx.dart';

//-- or --//

final pdfController = PdfController(
  document: PdfDocument.openAsset('assets/pdf/burdah.pdf'),
);

class PDP extends StatelessWidget {
  const PDP({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBar_normalpage(
              judul: 'Dalail',
            ),
            // SizedBox(
            //   height: 30,
            // ),
            Container(
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
            )
          ],
        ),
      ),
    );
    // Container(
    //     // Simple Pdf view with one render of page (loose quality on zoom)
    //     child: PdfView(
    //   controller: pdfController,
    //   scrollDirection: Axis.vertical,
    // ));
  }
}
