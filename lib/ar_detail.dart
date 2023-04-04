import 'package:flutter/material.dart';

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
        title: Text(widget.article['title']['rendered']
            .replaceAll(RegExp(r'<[^>]*>'), "")),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 250,
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
            Row(
              children: [
                SizedBox(
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
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  SelectableText(
                    widget.article['content']['rendered']
                        .replaceAll(RegExp('<[^>]*>'), ""),
                    style: TextStyle(
                        fontSize: 14,
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
