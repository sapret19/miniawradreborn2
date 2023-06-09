import 'dart:convert';

List<SliderModel> sliderfromJSON(String strJson) => List<SliderModel>.from(
    json.decode(strJson).map((x) => SliderModel.fromJson(x)));

class SliderModel {
  late String url;
  String? image;
  String? localImagePath;


  SliderModel(this.url,  );

  SliderModel.fromJson(Map<String, dynamic> json) {
    url = json['url'];
  }
}
