import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:miniawradreborn2/set.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ArticleDetail extends StatefulWidget {
  final Map article;

  ArticleDetail({required this.article});

  @override
  _ArticleDetailState createState() => _ArticleDetailState();
}

class _ArticleDetailState extends State<ArticleDetail> {
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
    List categories = widget.article['_embedded']['wp:term'][0];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 39, 110, 176),
        // actions: [
        //   IconButton(
        //     icon: const Icon(
        //       Icons.text_fields,
        //       size: 25,
        //     ),
        //     onPressed: () async {
        //       final fontSize = await Navigator.push<double>(
        //         context,
        //         MaterialPageRoute(
        //           builder: (context) => FontSettingPage(
        //             initialFontSize: _fontSize,
        //             onFontSizeChanged: _onFontSizeChanged,
        //           ),
        //         ),
        //       );
        //       if (fontSize != null) {
        //         setState(() {
        //           _fontSize = fontSize;
        //         });
        //         _saveFontSize(fontSize);
        //       }
        //     },
        //   )
        // ],
        // title: AutoSizeText(
        //   widget.article['title']['rendered']
        //       .replaceAll(RegExp(r'<[^>]*>'), ""),
        //   maxLines: 2,
        // ),
        // toolbarHeight: 70,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  EdgeInsets.only(top: 20, bottom: 10, right: 20, left: 15),
              child: Text(
                widget.article['title']['rendered']
                    .replaceAll(RegExp(r'<[^>]*>'), ""),
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 26,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  // height: 10,
                  width: 10,
                ),
                Wrap(
                  spacing: 8,
                  children: categories
                      .map((category) => Chip(
                            backgroundColor: Color.fromARGB(255, 39, 110, 176),
                            label: Text(
                              category['name'],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Montserrat",
                                  fontSize: 10),
                            ),
                          ))
                      .toList(),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                    image: NetworkImage(
                      widget.article['_embedded']['wp:featuredmedia'][0]
                              ['source_url']
                          .replaceAll(RegExp(r'<[^>]*>'), ""),
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // SizedBox(height: 1 ),
                  SelectableText(
                    widget.article['content']['rendered']
                        .replaceAll(RegExp('<[^>]*>'), "")
                        .replaceAll('\n\n\n', '\n')
                        .replaceAll(('&nbsp;'), ''),
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
