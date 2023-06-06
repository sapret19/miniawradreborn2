import 'package:dio/dio.dart';
import 'package:miniawradreborn2/slidebaru/model_slide.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

Future <List<ModelGambar>> ambilGambarSlide() async {
  const urlWP = 'https://annur2.net/wp-json/wp/v2/slider-images';
  final dio = Dio();

  try {
    final response = await dio.get(urlWP);
    final data = response.data;
    if (response.statusCode == 200) {
      final gambar = List<ModelGambar>.from(data.map((json) => ModelGambar.fromJson(json)));
      return gambar;
    } else {
      throw Exception ("GAGAL");
    }
  } catch (e) {
    throw Exception ("GATOT");
  }
}


Future<File> saveImageLocally(String imageUrl) async {
  final appDir = await getApplicationDocumentsDirectory();
  final fileName = imageUrl.split('/').last;
  final filePath = '${appDir.path}/$fileName';

  final response = await Dio().get(imageUrl, options: Options(responseType: ResponseType.bytes));
  final file = File(filePath);
  await file.writeAsBytes(response.data);

  return file;
}