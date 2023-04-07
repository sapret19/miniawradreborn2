import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:miniawradreborn2/set.dart';
import 'package:shared_preferences/shared_preferences.dart';

class cara_hajat extends StatefulWidget {
  const cara_hajat({super.key, required double fontSize});

  @override
  State<cara_hajat> createState() => _cara_hajatState();
}

class _cara_hajatState extends State<cara_hajat> {
  double _fontSize = 14.0;

  @override
  void initState() {
    super.initState();
    _loadFontSize();
  }

  Future<void> _loadFontSize() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _fontSize = prefs.getDouble('font_size') ?? 14;
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
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                          "Tata cara salat hajat adalah sebagai berikut:",
                          style: TextStyle(
                              fontSize: 17,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold)),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 11.0),
                        child: Text(
                            "1) Takbiratulihram dengan niat salat sunah hajat",
                            style: TextStyle(
                                fontSize: 17,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Text(
                            "> Rakaat pertama membaca Al Fatihah, Al Ikhlas 10 x",
                            style: TextStyle(
                                fontSize: 17,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400)),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Text(
                            "> Rakaat kedua membaca Al Fatihah, Al Ikhlas 20 x",
                            style: TextStyle(
                                fontSize: 17,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400)),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Text("> Salam",
                            style: TextStyle(
                                fontSize: 17,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400)),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 11.0),
                        child: Text(
                            "2) Takbiratulihram dengan niat salat sunah hajat",
                            style: TextStyle(
                                fontSize: 17,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Text(
                            "> Rakaat pertama membaca Al Fatihah, Al Ikhlas 30 x",
                            style: TextStyle(
                                fontSize: 17,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400)),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Text(
                            "> Rakaat kedua membaca Al Fatihah, Al Ikhlas 40 x",
                            style: TextStyle(
                                fontSize: 17,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400)),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30.0),
                        child: Text("> Salam",
                            style: TextStyle(
                                fontSize: 17,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400)),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text("Lalu Membaca doa salat hajat",
                          style: TextStyle(
                              fontSize: 17,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.bold)),
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "NB : Salat Hajat apabila dilaksanakan di siang hari maka sunahnya adalah 4 rakaat satu kali salam, sedangkan untuk malam hari adalah 4 rakaat dua kali salam.",
                          style: TextStyle(
                              fontSize: 17,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.justify,
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
