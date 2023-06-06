// import 'dart:io';

// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class ApiService {
//   static const String apiUrl =
//       'https://annur2.net/wp-json/wp/v2/slider-images?slider_id=18576';

//   static Future<List<String>> getImages() async {
//     // Menggunakan package http untuk mengirim permintaan HTTP GET ke API
//     final response = await http.get(Uri.parse(apiUrl));

//     if (response.statusCode == 200) {
//       // Mengembalikan daftar URL gambar dari respons JSON
//       final List<dynamic> jsonData = jsonDecode(response.body);
//       return jsonData.map<String>((item) => item['url'] as String).toList();
//     } else {
//       throw Exception('Gagal mengambil data gambar');
//     }
//   }
// }

// class ImageCarousel extends StatefulWidget {
//   final Key? key;
//   ImageCarousel({this.key}) : super(key: key);
//   @override
//   _ImageCarouselState createState() => _ImageCarouselState();
// }

// class _ImageCarouselState extends State<ImageCarousel> {
//   List<String> imageUrls = [];

//   @override
//   void initState() {
//     super.initState();
//     loadImages();
//   }

//   Future<void> loadImages() async {
//     try {
//       // Menggunakan ApiService untuk mendapatkan daftar URL gambar dari API
//       final List<String> urls = await ApiService.getImages();

//       // Menggunakan path_provider untuk mendapatkan direktori cache lokal
//       final Directory cacheDir = await getTemporaryDirectory();

//       // Mengunduh gambar dari setiap URL dan menyimpannya di direktori cache lokal
//       final List<String> localImagePaths = [];
//       for (String url in urls) {
//         final String fileName = url.split('/').last;
//         final File localImage = File('${cacheDir.path}/$fileName');
//         final http.Response response = await http.get(Uri.parse(url));
//         await localImage.writeAsBytes(response.bodyBytes);
//         localImagePaths.add(localImage.path);
//       }

//       setState(() {
//         imageUrls = localImagePaths;
//       });
//     } catch (e) {
//       print('Terjadi kesalahan: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CarouselSlider(
//       options: CarouselOptions(aspectRatio: 16 / 9),
//       items: imageUrls.map((imageUrl) {
//         return Builder(
//           builder: (BuildContext context) {
//             return Image.network(imageUrl);
//           },
//         );
//       }).toList(),
//     );
//   }
// }
