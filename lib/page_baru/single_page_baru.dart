import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:miniawradreborn2/page_baru/model_json.dart';
import 'package:miniawradreborn2/set.dart';
import 'package:shared_preferences/shared_preferences.dart';

class single_page_baru extends StatefulWidget {
  // final String inijudul;
  single_page_baru({
    super.key,
    // required this.inijudul
  });

  @override
  State<single_page_baru> createState() => _single_page_baruState();
}

class _single_page_baruState extends State<single_page_baru> {
  Future<List<ModelJson>> ReadJsonData() async {
    final JsonData =
        await rootBundle.rootBundle.loadString("assets/json/yasin.json");
    final list = json.decode(JsonData) as List<dynamic>;
    return list.map((e) => ModelJson.fromJson(e)).toList();
  }

  double _fontSize = 16;

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
      appBar: AppBar(
        title: Text("Yasin"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.font_download),
            onPressed: () async {
              final fontSize = await Navigator.push<double>(
                context,
                MaterialPageRoute(
                  builder: (context) => FontSettingPage(
                    initialFontSize: _fontSize,
                    onFontSizeChanged: _onFontSizeChanged,
                  ),
                ),
              );
              if (fontSize != null) {
                setState(() {
                  _fontSize = fontSize;
                });
                _saveFontSize(fontSize);
              }
            },
          )
        ],
      ),
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
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Container(
                          //   width: 50,
                          //   height: 50,
                          // ),
                          Expanded(
                              child: Container(
                            padding:
                                EdgeInsets.only(bottom: 8, left: 20, right: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text('Bismillah'),
                                Padding(
                                  padding: EdgeInsets.only(left: 8, right: 8),
                                  child: SelectableText(
                                    textAlign: TextAlign.justify,
                                    items[index].arab.toString(),
                                    style: TextStyle(
                                        fontSize: _fontSize,
                                        fontFamily:
                                            "KFGQPC Uthmanic Script HAFS",
                                        fontWeight: FontWeight.w500,
                                        height: 2.5),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                          )),
                        ],
                      ),
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
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     final fontSize = await Navigator.push<double>(
      //       context,
      //       MaterialPageRoute(
      //         builder: (context) => FontSettingPage(
      //           initialFontSize: _fontSize,
      //           onFontSizeChanged: _onFontSizeChanged,
      //         ),
      //       ),
      //     );
      //     if (fontSize != null) {
      //       setState(() {
      //         _fontSize = fontSize;
      //       });
      //       _saveFontSize(fontSize);
      //     }
      //   },
      //   child: const Icon(Icons.font_download),
      // ),
    );
  }
}
