import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class DetailDalail extends StatefulWidget {
  final String storagePath;
  final String NamaHari;
  const DetailDalail(
      {super.key, required this.storagePath, required this.NamaHari});

  @override
  State<DetailDalail> createState() => _DetailDalailState();
}

class _DetailDalailState extends State<DetailDalail> {
  late BannerAd bannerAd;
  bool isAdLoaded = false;
  var IdBanner = 'ca-app-pub-1150816972900335/8829837669';
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initBannerAd();
  }

//  final String storagePath = 'dalail/dalail_ahad.pdf';

  void initBannerAd() {
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: IdBanner,
      listener: BannerAdListener(onAdLoaded: (ad) {
        setState(() {
          isAdLoaded = true;
        });
      }, onAdFailedToLoad: (ad, error) {
        ad.dispose();
        print('eror');
      }),
      request: AdRequest(),
    );
    bannerAd.load();
  }

  Future<String> getDownloadURL() async {
    final firebase_storage.Reference ref = firebase_storage
        .FirebaseStorage.instance
        .ref()
        .child(widget.storagePath);
    final String downloadURL = await ref.getDownloadURL();
    return downloadURL;
  }

  Future<String> downloadPDF(String url) async {
    final file = await DefaultCacheManager().getSingleFile(url);
    return file.path;
  }

  @override
  void dispose() {
    bannerAd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 39, 110, 176),
          centerTitle: true,
          title: Text(
            '${widget.NamaHari}',
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
                    return Center(child: CircularProgressIndicator());
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
        bottomNavigationBar: isAdLoaded
            ? SizedBox(
                height: bannerAd.size.height.toDouble(),
                width: bannerAd.size.width.toDouble(),
                child: AdWidget(ad: bannerAd),
              )
            : SizedBox());
  }
}
