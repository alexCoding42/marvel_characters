import 'image.dart';

class Character {
  final int? id;
  final String? name;
  final String? description;
  final String? modified;
  final String? resourceURI;
  final List<dynamic>? urls;
  final CustomImage? thumbnail;
  final dynamic comics;
  final dynamic stories;
  final dynamic events;
  final dynamic series;

  Character({
    this.id,
    this.name,
    this.description,
    this.modified,
    this.resourceURI,
    this.urls,
    this.thumbnail,
    this.comics,
    this.stories,
    this.events,
    this.series,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json["id"],
      name: json["name"],
      description: json["description"],
      modified: json["modified"],
      resourceURI: json["resourceURI"],
      urls: json["urls"],
      thumbnail: json["thumbnail"] != null
          ? CustomImage.fromJson(json["thumbnail"])
          : null,
      comics: json["comics"],
      stories: json["stories"],
      events: json["events"],
      series: json["series"],
    );
  }
}
