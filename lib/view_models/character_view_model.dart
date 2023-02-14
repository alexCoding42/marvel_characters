import 'package:marvel_characters/models/character.dart';

class CharacterViewModel {
  final Character character;

  CharacterViewModel({required this.character});

  int? get id {
    return character.id;
  }

  String? get name {
    return character.name;
  }

  String? get description {
    return character.description;
  }

  String? get modified {
    return character.modified;
  }

  String? get resourceURI {
    return character.resourceURI;
  }

  List<dynamic>? get urls {
    return character.urls;
  }

  String? get path {
    return character.thumbnail?.path;
  }

  String? get extension {
    return character.thumbnail?.extension;
  }

  dynamic get comics {
    return character.comics;
  }

  dynamic get stories {
    return character.stories;
  }

  dynamic get events {
    return character.events;
  }

  dynamic get series {
    return character.series;
  }
}
