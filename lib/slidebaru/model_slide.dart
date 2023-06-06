class ModelGambar {
  final String url;
  final String linkG;

  ModelGambar({required this.url, required this.linkG});

  factory ModelGambar.fromJson(Map<String, dynamic> json) {
    return ModelGambar(url: json['url'], linkG: json['linkG']);
  }
}
