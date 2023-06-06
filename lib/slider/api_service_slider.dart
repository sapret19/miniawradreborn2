// import 'package:http/http.dart' as http;
// import 'package:miniawradreborn2/slider/slider_model.dart';
// import 'package:flutter_cache_manager/flutter_cache_manager.dart';


// class APIService {
//   static var client = http.Client();
//   static var cacheManager = CacheManager;
//   static String apiURL = "annur2.net";

//   static Future<List<SliderModel>?> getSliderData() async {
//     Map<String, String> requestHeaders = {'Content-type': 'application/json'};

//     final Uri url = Uri.http(
//         apiURL, "/wp-json/wp/v2/slider-images", {"slider_id": "18576"});

//     var response = await client.get(url, headers: requestHeaders);

//     if (response.statusCode == 200) {
//       var jsonString = response.body;
//       List<SliderModel> responseModel = sliderfromJSON(jsonString);

//       return responseModel;
//     } else {
//       return null;
//     }
//   }
// }
