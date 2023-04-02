class ModelJson {
  String? arab;
  String? bismillah;

  ModelJson(this.arab, this.bismillah);

  ModelJson.fromJson(Map<String, dynamic> json) {
    arab = json['arab'];
    bismillah = json['bismillah'];
  }
}
