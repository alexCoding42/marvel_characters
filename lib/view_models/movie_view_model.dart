import 'package:marvel_characters/models/movie.dart';

class MovieViewModel {
  final Movie movie;

  MovieViewModel({required this.movie});

  int? get id {
    return movie.id;
  }

  String? get title {
    return movie.title;
  }

  String? get releaseDate {
    return movie.releaseDate;
  }

  String? get boxOffice {
    return movie.boxOffice;
  }

  int? get duration {
    return movie.duration;
  }

  String? get overview {
    return movie.overview;
  }

  String? get coverUrl {
    return movie.coverUrl;
  }

  String? get trailerUrl {
    return movie.trailerUrl;
  }

  String? get directedBy {
    return movie.directedBy;
  }

  int? get phase {
    return movie.phase;
  }

  String? get saga {
    return movie.saga;
  }

  int? get chronology {
    return movie.chronology;
  }

  int? get postCreditScenes {
    return movie.postCreditScenes;
  }

  String? get imdbId {
    return movie.imdbId;
  }
}
