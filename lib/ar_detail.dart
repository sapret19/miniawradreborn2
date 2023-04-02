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
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.article['title']['rendered']
            .replaceAll(RegExp(r'<[^>]*>'), "")),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
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
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.article['title']['rendered']
                        .replaceAll(RegExp(r'<[^>]*>'), ""),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.article['content']['rendered']
                        .replaceAll(RegExp(r'<[^>]*>'), ""),
                    style: TextStyle(
                        fontSize: 15,
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
