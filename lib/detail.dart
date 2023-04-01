import 'package:flutter/material.dart';

class PostDetail extends StatelessWidget {
  final dynamic post;

  const PostDetail({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post['title']['rendered']),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(
                post['_embedded']['wp:featuredmedia'][0]['source_url']),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                post['content']['rendered'].replaceAll(RegExp(r'<[^>]*>'), ""),
                style: TextStyle(fontSize: 16),
                // customTextStyle: {'p': Style(fontSize: FontSize(18.0))},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
