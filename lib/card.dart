import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:miniawradreborn2/ar_detail.dart';
import 'package:miniawradreborn2/detail.dart';
import 'package:sizer/sizer.dart';

class WordPressArticles extends StatefulWidget {
  @override
  _WordPressArticlesState createState() => _WordPressArticlesState();
}

class _WordPressArticlesState extends State<WordPressArticles> {
  List articles = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchArticles();
  }

  fetchArticles() async {
    var url =
        Uri.parse('https://annur2.net/wp-json/wp/v2/posts?_embed&per_page=5');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      setState(() {
        articles = jsonResponse;
        isLoading = false;
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(0, -45, 1),
      height: 300,
      width: context.isPortrait ? 90.w : 98.w,
      child: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: articles.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ArticleDetail(article: articles[index]),
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      width: 200,
                      height: 140,
                      // height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: NetworkImage(
                                  articles[index]['_embedded']
                                      ['wp:featuredmedia'][0]['source_url'],
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  articles[index]['title']['rendered']
                                      .replaceAll(RegExp(r'<[^>]*>'), ""),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  articles[index]['excerpt']['rendered']
                                      .replaceAll(RegExp(r'<[^>]*>'), ""),
                                  style: TextStyle(fontSize: 12),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
