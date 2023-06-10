import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:miniawradreborn2/slider/slider_model.dart';

class APIService {
  final String idslider;
  APIService({
    required this.idslider,
  });
  static var client = http.Client();
  static String apiURL = "annur2.net";

   Future<List<SliderModel>?> getSliderData() async {
    Map<String, String> requestHeaders = {'Content-type': 'application/json'};

    Uri url =  Uri.http(
        apiURL, "/wp-json/wp/v2/slider-images", {"slider_id": "${idslider}"});

    var response = await client.get(url, headers: requestHeaders);

    Future<String> downloadImage(String imageUrl) async {
      final response = await http.get(Uri.parse(imageUrl));
      final file =
          await DefaultCacheManager().putFile(imageUrl, response.bodyBytes);
      return file.path;
    }

    if (response.statusCode == 200) {
      var jsonString = response.body;
      List<SliderModel> responseModel = sliderfromJSON(jsonString);

      for (var slider in responseModel) {
        var image = slider.image;
        if (image != null) {
          slider.localImagePath = await downloadImage(image);
        }
      }

      return responseModel;
    } else {
      return null;
    }
  }
}
