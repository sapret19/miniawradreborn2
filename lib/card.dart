import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:http/http.dart' as http;
import 'package:miniawradreborn2/ar_detail.dart';
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
      width: context.isPortrait ? 89.w : 98.w,
      child: isLoading
          ? SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.only(left: 23.0, right: 23.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    loading(),
                    loading(),
                    loading(),
                    loading(),
                    loading(),
                  ],
                ),
              ),
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
                    padding:
                        EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
                    child: Container(
                      width: 200,
                      height: 100,
                      // height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 1,
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
                                      .replaceAll(RegExp(r'<[^>]*>'), "")
                                      .replaceAll('&nbsp', ""),
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

class loading extends StatelessWidget {
  const loading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      height: 300,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: Color.fromARGB(255, 255, 255, 255),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 0),
          ),
        ],
      ),
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            kotak(
              height: 120,
              width: 98.w,
            ),
            SizedBox(
              height: 8,
            ),
            kotak(height: 40, width: 98.w),
            SizedBox(
              height: 8,
            ),
            kotak(height: 80, width: 98.w)
          ],
        ),
      ),
    );
  }
}

class kotak extends StatelessWidget {
  final double height;
  final double width;
  const kotak({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Color.fromARGB(59, 230, 230, 230)),
    );
  }
}
