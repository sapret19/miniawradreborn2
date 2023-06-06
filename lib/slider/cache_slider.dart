// import 'dart:convert';
// import 'dart:io';

// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_cache_manager/flutter_cache_manager.dart';
// import 'package:http/http.dart' as http;
// import 'package:miniawradreborn2/slider/slider_model.dart';

// class APIService1 {
//   final cacheManager = DefaultCacheManager();
//   final client = http.Client();

//   Future<dynamic> getCachedResponse(String url) async {
//     final fileInfo = await cacheManager.getFileFromCache(url);

//     if (fileInfo != null) {
//       final file = fileInfo.file;

//        if (file.existsSync()) {
//         final bytes = await file.readAsBytes();
//         final contentType = fileInfo.validTill != null
//             ? fileInfo.validTill.toIso8601String()
//             : 'image/jpeg'; // Ganti dengan jenis konten yang diharapkan
//         final response = http.Response.bytes(bytes, 200,
//             headers: {'content-type': contentType});
//         return response;
//       }
//     } else {
//       final response = await client.get(Uri.parse(url));
//       if (response.statusCode == 200) {
//         final file = await cacheManager.putFile(url, response.bodyBytes);
//         response.headers['x-cache-file'] = file.path;
//       }
//       return response;
//     }
//   }
// }

// void fetchImages() async {
//   final url = 'https://annur2.net/wp-json/wp/v2/slider-images?slider_id=18576';
//   final apiService = APIService1();
//   final response = await apiService.getCachedResponse(url);

//   if (response.statusCode == 200) {
//     final List<SliderModel> images = [];
//     final List<dynamic> jsonList = json.decode(response.body);

//     // Mengonversi respons JSON menjadi objek model
//     images.addAll(jsonList.map((json) => SliderModel.fromJson(json)));

//     // Tampilkan Carousel Slider dengan gambar-gambar yang diperoleh
//     CarouselSlider(
//       options: CarouselOptions(
//         height: 200.0,
//         // Atur opsi CarouselSlider lainnya sesuai kebutuhan Anda
//       ),
//       items: images.map((image) {
//         return Image.network(image.url);
//       }).toList(),
//     );
//   } else {
//     // Jika permintaan gagal, tangani kesalahan
//     print('Permintaan gagal dengan kode status: ${response.statusCode}');
//   }
// }
