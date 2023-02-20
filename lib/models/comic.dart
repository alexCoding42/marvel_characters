import 'package:marvel_characters/models/image.dart';

class Comic {
  final int? id;
  final int? digitalId;
  final String? title;
  final int? issueNumber;
  final String? variantDescription;
  final String? description;
  final String? modified;
  final String? format;
  final int? pageCount;
  final CustomImage? thumbnail;

  Comic({
    this.id,
    this.digitalId,
    this.title,
    this.issueNumber,
    this.variantDescription,
    this.description,
    this.modified,
    this.format,
    this.pageCount,
    this.thumbnail,
  });

  factory Comic.fromJson(Map<String, dynamic> json) {
    return Comic(
      id: json["id"],
      digitalId: json["digitalId"],
      title: json["title"],
      issueNumber: json["issueNumber"],
      variantDescription: json["variantDescription"],
      description: json["description"],
      modified: json["modified"],
      format: json["format"],
      pageCount: json["pageCount"],
      thumbnail: json["thumbnail"] != null
          ? CustomImage.fromJson(json["thumbnail"])
          : null,
    );
  }
}
