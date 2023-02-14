class CustomImage {
  final String? path;
  final String? extension;

  CustomImage({this.path, this.extension});

  factory CustomImage.fromJson(Map<String, dynamic> json) {
    return CustomImage(
      path: json["path"],
      extension: json["extension"],
    );
  }

  String get imageUrl {
    return "$path.$extension";
  }
}
