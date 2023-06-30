import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:miniawradreborn2/page_baru/model_json.dart';
import 'package:miniawradreborn2/set.dart';
import 'package:shared_preferences/shared_preferences.dart';

class page_count extends StatefulWidget {
  // final String judul;
  final String data;
  final String kunci;
  page_count({super.key, required this.data, required double fontSize, required this.kunci});

  @override
  State<page_count> createState() => _page_countState();
}

class _page_countState extends State<page_count> {
  Future<List<ModelJson>> ReadJsonData() async {
    final JsonData =
        await rootBundle.rootBundle.loadString("assets/json/${widget.data}");
    final list = json.decode(JsonData) as List<dynamic>;
    return list.map((e) => ModelJson.fromJson(e)).toList();
  }

  late int _count = 0;
  double _fontSize = 20.0;
  SharedPreferences? _prefs;
  // final String _key = "${widget.kunci}";
  @override
  void initState() {
    super.initState();
    _loadPrefs();
    _loadFontSize();
  }

  Future<void> _loadPrefs() async {
    _prefs = await SharedPreferences.getInstance();
    setState(() {
      _count = _prefs?.getInt("${widget.kunci}") ?? 0; // Gunakan _key daripada "_count"
    });
  }

  Future<void> _Count() async {
    _prefs = await SharedPreferences.getInstance();
    // init 1st time 0
    int? savedData = _prefs?.getInt("${widget.kunci}");
    if (savedData == null) {
      await _prefs!.setInt("${widget.kunci}", _count);
    } else {
      _count = savedData;
    }
    setState(() {});
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

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder(
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
                            padding: const EdgeInsets.only(top: 10),
                            decoration:
                                const BoxDecoration(color: Colors.white),
                            margin: const EdgeInsets.symmetric(vertical: 1),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15),
                                  child: SelectableText(
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.center,
                                    items[index].bismillah.toString(),
                                    style: TextStyle(
                                        fontSize: _fontSize,
                                        fontFamily:
                                            "KFGQPC Uthmanic Script HAFS",
                                        fontWeight: FontWeight.w500,
                                        height: 2),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15),
                                  child: SelectableText(
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.justify,
                                    items[index].arab.toString(),
                                    style: TextStyle(
                                        fontSize: _fontSize,
                                        fontFamily:
                                            "KFGQPC Uthmanic Script HAFS",
                                        fontWeight: FontWeight.w500,
                                        height: 2),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                          );
                        });
                  } else {
                    // show circular progress while data is getting fetched from json file
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 40,
                ),
                GestureDetector(
                  onTap: () {
                    _prefs?.setInt("${widget.kunci}", _count = 0);
                    setState(() {});
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 39, 110, 176),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Image.asset(
                      'assets/images/refresh1.png',
                      scale: 25,
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  width: 120,
                  height: 60,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 39, 110, 176),
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  child: Center(
                    child: Text(
                      "${_prefs?.getInt("${widget.kunci}")}",
                      style: const TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () async {
                    _prefs?.setInt("${widget.kunci}", _count += 1);
                    setState(() {});
                  },
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 39, 110, 176),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: Image.asset(
                      'assets/images/add1.png',
                      scale: 25,
                      color: const Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 40,
                )
              ],
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
