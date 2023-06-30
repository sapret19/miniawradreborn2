import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:miniawradreborn2/page_baru/model_json.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Burdah1 extends StatefulWidget {
  final String? judul;
  final String? data;

  const Burdah1({super.key, this.judul, this.data, required double fontSize});

  @override
  State<Burdah1> createState() => _Burdah1State();
}

class _Burdah1State extends State<Burdah1> {
  Future<List<ModelJson>> ReadJsonData() async {
    final JsonData =
        await rootBundle.rootBundle.loadString('assets/json/${widget.data}');
    final list = json.decode(JsonData) as List<dynamic>;
    return list.map((e) => ModelJson.fromJson(e)).toList();
  }

  double _fontSize = 16.0;

  @override
  void initState() {
    super.initState();
    _loadFontSize();
  }

  Future<void> _loadFontSize() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _fontSize = prefs.getDouble('font_size') ?? 16;
    });
  }

  Future<void> _saveFontSize(double value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('font_size', value);
  }

  void _onFontSizeChanged(double value) {
    setState(() {
      _fontSize = value;
    });
    _saveFontSize(value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: ReadJsonData(),
        builder: (context, data) {
          if (data.hasError) {
            return Center(child: Text("${data.error}"));
          } else if (data.hasData) {
            var items = data.data as List<ModelJson>;
            return ListView.builder(
                itemCount: items == null ? 0 : items.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(top: 2),
                    decoration: BoxDecoration(color: Colors.white),
                    margin: EdgeInsets.symmetric(vertical: 1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Column(
                        //     children: [
                        //       Align(
                        //         alignment: Alignment.topLeft,
                        //         child: Text(
                        //             "  Tata cara salat hajat adalah sebagai berikut:",
                        //             style: TextStyle(
                        //                 fontSize: _fontSize,
                        //                 fontFamily: 'Montserrat',
                        //                 fontWeight: FontWeight.bold)),
                        //       ),
                        //       Align(
                        //         alignment: Alignment.topLeft,
                        //         child: Padding(
                        //           padding: const EdgeInsets.only(left: 11.0),
                        //           child: Text(
                        //               "1) Takbiratulihram dengan niat salat sunah hajat",
                        //               style: TextStyle(
                        //                   fontSize: _fontSize,
                        //                   fontFamily: 'Montserrat',
                        //                   fontWeight: FontWeight.bold)),
                        //         ),
                        //       ),
                        //       Align(
                        //         alignment: Alignment.topLeft,
                        //         child: Padding(
                        //           padding: const EdgeInsets.only(left: 30.0),
                        //           child: Text(
                        //               "> Rakaat pertama membaca Al Fatihah, Al Ikhlas 10 x",
                        //               style: TextStyle(
                        //                   fontSize: _fontSize,
                        //                   fontFamily: 'Montserrat',
                        //                   fontWeight: FontWeight.w400)),
                        //         ),
                        //       ),
                        //       Align(
                        //         alignment: Alignment.topLeft,
                        //         child: Padding(
                        //           padding: const EdgeInsets.only(left: 30.0),
                        //           child: Text(
                        //               "> Rakaat kedua membaca Al Fatihah, Al Ikhlas 20 x",
                        //               style: TextStyle(
                        //                   fontSize: _fontSize,
                        //                   fontFamily: 'Montserrat',
                        //                   fontWeight: FontWeight.w400)),
                        //         ),
                        //       ),
                        //       Align(
                        //         alignment: Alignment.topLeft,
                        //         child: Padding(
                        //           padding: const EdgeInsets.only(left: 30.0),
                        //           child: Text("> Salam",
                        //               style: TextStyle(
                        //                   fontSize: _fontSize,
                        //                   fontFamily: 'Montserrat',
                        //                   fontWeight: FontWeight.w400)),
                        //         ),
                        //       ),
                        //       Align(
                        //         alignment: Alignment.topLeft,
                        //         child: Padding(
                        //           padding: const EdgeInsets.only(left: 11.0),
                        //           child: Text(
                        //               "2) Takbiratulihram dengan niat salat sunah hajat",
                        //               style: TextStyle(
                        //                   fontSize: _fontSize,
                        //                   fontFamily: 'Montserrat',
                        //                   fontWeight: FontWeight.bold)),
                        //         ),
                        //       ),
                        //       Align(
                        //         alignment: Alignment.topLeft,
                        //         child: Padding(
                        //           padding: const EdgeInsets.only(left: 30.0),
                        //           child: Text(
                        //               "> Rakaat pertama membaca Al Fatihah, Al Ikhlas 30 x",
                        //               style: TextStyle(
                        //                   fontSize: _fontSize,
                        //                   fontFamily: 'Montserrat',
                        //                   fontWeight: FontWeight.w400)),
                        //         ),
                        //       ),
                        //       Align(
                        //         alignment: Alignment.topLeft,
                        //         child: Padding(
                        //           padding: const EdgeInsets.only(left: 30.0),
                        //           child: Text(
                        //               "> Rakaat kedua membaca Al Fatihah, Al Ikhlas 40 x",
                        //               style: TextStyle(
                        //                   fontSize: _fontSize,
                        //                   fontFamily: 'Montserrat',
                        //                   fontWeight: FontWeight.w400)),
                        //         ),
                        //       ),
                        //       Align(
                        //         alignment: Alignment.topLeft,
                        //         child: Padding(
                        //           padding: const EdgeInsets.only(left: 30.0),
                        //           child: Text("> Salam",
                        //               style: TextStyle(
                        //                   fontSize: _fontSize,
                        //                   fontFamily: 'Montserrat',
                        //                   fontWeight: FontWeight.w400)),
                        //         ),
                        //       ),
                        //       Align(
                        //         alignment: Alignment.topLeft,
                        //         child: Text("Lalu Membaca doa salat hajat",
                        //             style: TextStyle(
                        //                 fontSize: _fontSize,
                        //                 fontFamily: 'Montserrat',
                        //                 fontWeight: FontWeight.bold)),
                        //       ),
                        //       Align(
                        //           alignment: Alignment.topLeft,
                        //           child: Text(
                        //             "NB : Salat Hajat apabila dilaksanakan di siang hari maka sunahnya adalah 4 rakaat satu kali salam, sedangkan untuk malam hari adalah 4 rakaat dua kali salam.",
                        //             style: TextStyle(
                        //                 fontSize: _fontSize,
                        //                 fontFamily: 'Montserrat',
                        //                 fontWeight: FontWeight.w400),
                        //             textAlign: TextAlign.justify,
                        //           ))
                        //     ],
                        //   ),
                        // ),

                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(left: 15, right: 15),
                            child: SelectableText(
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.center,
                              items[index].arabic.toString(),
                              style: TextStyle(
                                fontSize: _fontSize,
                                fontFamily: "KFGQPC Uthmanic Script HAFS",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 45),
                            child: SelectableText(
                              textDirection: TextDirection.rtl,
                              textAlign: TextAlign.justify,
                              items[index].arabic1.toString(),
                              style: TextStyle(
                                fontSize: _fontSize,
                                fontFamily: "KFGQPC Uthmanic Script HAFS",
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                });
          } else {
            // show circular progress while data is getting fetched from json file
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
