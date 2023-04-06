class ModelJson {
  String? arab;
  String? bismillah;
  String? arabic;
  String? arabic1;
  String? head;

  ModelJson(this.arab, this.bismillah, this.head, this.arabic, this.arabic1);

  ModelJson.fromJson(Map<String, dynamic> json) {
    arab = json['arab'];
    bismillah = json['bismillah'];
    head = json['head'];
    arabic = json['arabic'];
    arabic1 = json['arabic1'];
  }
}
