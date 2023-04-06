import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:miniawradreborn2/page_baru/model_json.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Burdah2 extends StatefulWidget {
  const Burdah2({super.key, required double fontSize});

  @override
  State<Burdah2> createState() => _Burdah2State();
}

class _Burdah2State extends State<Burdah2> {
  Future<List<ModelJson>> ReadJsonData() async {
    final JsonData =
        await rootBundle.rootBundle.loadString('assets/json/burdah2.json');
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
      // backgroundColor: Color.fromARGB(211, 235, 234, 234),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 68, 118, 218),
        centerTitle: true,
        title: Text(
          'Burdah',
          style:
              TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
        ),
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
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        // crossAxisAlignment: CrossAxisAlignment.center,
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
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 8, right: 8),
                                  child: SelectableText(
                                    textAlign: TextAlign.end,
                                    items[index].arabic.toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: "LPMQ IsepMisbah",
                                        fontWeight: FontWeight.w500,
                                        height: 2.5),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  // padding: EdgeInsets.only(left: 8, right: 8),
                                  child: SelectableText(
                                    textAlign: TextAlign.start,
                                    items[index].arabic1.toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: "LPMQ IsepMisbah",
                                        fontWeight: FontWeight.w500,
                                        height: 2.5),
                                  ),
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
    );
  }
}
