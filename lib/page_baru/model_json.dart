class ModelJson {
  String? arab;

  ModelJson(this.arab);

  ModelJson.fromJson(Map<String, dynamic> json) {
    arab = json['arab'];
  }
}
