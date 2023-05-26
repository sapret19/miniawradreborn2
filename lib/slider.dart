import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;

class Slidee extends StatefulWidget {
  const Slidee({super.key});

  @override
  State<Slidee> createState() => _SlideeState();
}

class _SlideeState extends State<Slidee> {
  List gambar = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    AmbilArtikel();
  }

  AmbilArtikel() async {
    var url = Uri.parse("https://annur2.net/wp-json/wp/v2/posts?_embed");
        
    var response = await http.get(url);
    if (response.statusCode == 200 ) {
      var jsonResponse = jsonDecode(response.body);
      setState(() {
        gambar = jsonResponse;
      });
    } else {
      print("Gagal");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 500,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: gambar.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: gambar[index])
            ),
          );
        }
        ),
    );
  }
}