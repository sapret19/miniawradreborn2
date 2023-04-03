import 'package:flutter/material.dart';

class PostDetail extends StatelessWidget {
  final dynamic post;

  const PostDetail({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(post['title']['rendered'].replaceAll(RegExp(r'<[^>]*>'), "")),
      ),
      backgroundColor: Color.fromARGB(255, 39, 110, 176),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            post['_embedded'] != null &&
                    post['_embedded']['wp:featuredmedia'] != null
                ? Image.network(
                    post['_embedded']['wp:featuredmedia'][0]['source_url'])
                : SizedBox.shrink(),
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
