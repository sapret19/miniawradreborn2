import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:miniawradreborn2/detail.dart';

Future<List<dynamic>> fetchPosts() async {
  final response = await http
      .get(Uri.parse('https://annur2.net/wp-json/wp/v2/posts?_embed'));
  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to load posts');
  }
}

class Cardhe extends StatefulWidget {
  @override
  _CardheState createState() => _CardheState();
}

class _CardheState extends State<Cardhe> {
  late Future<List<dynamic>> futurePosts;

  @override
  void initState() {
    super.initState();
    futurePosts = fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WordPress Posts'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: futurePosts,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final post = snapshot.data![index];
                var imageurl =
                    post['_embedded']['wp:featuredmedia'][0]['source_url'];
                return Card(
                  child: Column(
                    children: <Widget>[
                      Image.network(imageurl),
                      Text(post['title']['rendered']
                          .replaceAll(RegExp(r'<[^>]*>'), "")),
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
