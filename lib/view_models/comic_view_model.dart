import 'package:marvel_characters/models/comic.dart';

class ComicViewModel {
  final Comic comic;

  ComicViewModel({required this.comic});

  int? get id {
    return comic.id;
  }

  int? get digitalId {
    return comic.digitalId;
  }

  String? get title {
    return comic.title;
  }

  int? get issueNumber {
    return comic.issueNumber;
  }

  String? get variantDescription {
    return comic.variantDescription;
  }

  String? get description {
    return comic.description;
  }

  String? get modified {
    return comic.modified;
  }

  String? get format {
    return comic.format;
    ;
  }

  int? get pageCount {
    return comic.pageCount;
  }

  String? get path {
    return comic.thumbnail?.path;
  }

  String? get extension {
    return comic.thumbnail?.extension;
  }
}
