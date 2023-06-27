import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ArticleDetail extends StatefulWidget {
  final Map article;

  ArticleDetail({required this.article});

  @override
  _ArticleDetailState createState() => _ArticleDetailState();
}

class _ArticleDetailState extends State<ArticleDetail> {
  @override
  Widget build(BuildContext context) {
    List categories = widget.article['_embedded']['wp:term'][0];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 39, 110, 176),
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
              padding: EdgeInsets.all(25),
              child: Text(
                widget.article['title']['rendered']
                    .replaceAll(RegExp(r'<[^>]*>'), ""),
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 24,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Row(
              children: [
                SizedBox(
                  height: 10,
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
                                  fontFamily: "Montserrat"),
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
                        .replaceAll('\n\n\n', '\n'),
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
