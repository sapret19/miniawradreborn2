import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get_navigation/src/routes/default_transitions.dart';
import 'package:miniawradreborn2/page_baru/model_json.dart';
import 'package:miniawradreborn2/set.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Doawaqiah extends StatefulWidget {
  // final String judul;

  Doawaqiah({super.key, required double fontSize});

  @override
  State<Doawaqiah> createState() => _DoawaqiahState();
}

class _DoawaqiahState extends State<Doawaqiah> {
  Future<List<ModelJson>> ReadJsonData() async {
    final JsonData =
        await rootBundle.rootBundle.loadString("assets/json/doa_waqiah.json");
    final list = json.decode(JsonData) as List<dynamic>;
    return list.map((e) => ModelJson.fromJson(e)).toList();
  }

  double _fontSize = 20.0;

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
                    padding: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(color: Colors.white),
                    margin: EdgeInsets.symmetric(vertical: 1),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(left: 15, right: 15),
                            child: SelectableText(
                              "وصب علي الرزق صبة رحمة",
                              style: TextStyle(
                                  fontSize: _fontSize,
                                  fontFamily: "KFGQPC Uthmanic Script HAFS",
                                  fontWeight: FontWeight.w500,
                                  height: 2),
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(left: 15, right: 15),
                            child: SelectableText(
                              "فأنت رجا قلبي الكَسير من الخبت",
                              style: TextStyle(
                                  fontSize: _fontSize,
                                  fontFamily: "KFGQPC Uthmanic Script HAFS",
                                  fontWeight: FontWeight.w500,
                                  height: 2),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 7,
                        ),
                        Center(
                          child: Padding(
                            padding: EdgeInsets.only(left: 15, right: 15),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: SelectableText(
                                textDirection: TextDirection.rtl,
                                textAlign: TextAlign.justify,
                                items[index].arab.toString(),
                                style: TextStyle(
                                    fontSize: _fontSize,
                                    fontFamily: "KFGQPC Uthmanic Script HAFS",
                                    fontWeight: FontWeight.w500,
                                    height: 2),
                              ),
                            ),
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
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
