class MusicModel {
  String description;
  String url;
  String urlImage;
  bool isLoading;
  bool isPlaying;

  MusicModel({this.description, this.url, this.urlImage, this.isLoading, this.isPlaying = false});

  MusicModel.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    url = json['url'];
    urlImage = json['urlImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['url'] = this.url;
    data['urlImage'] = this.urlImage;
    return data;
  }
}
