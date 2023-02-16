class Movie {
  final int? id;
  final String? title;
  final String? releaseDate;
  final String? boxOffice;
  final int? duration;
  final String? overview;
  final String? coverUrl;
  final String? trailerUrl;
  final String? directedBy;
  final int? phase;
  final String? saga;
  final int? chronology;
  final int? postCreditScenes;
  final String? imdbId;

  Movie({
    this.id,
    this.title,
    this.releaseDate,
    this.boxOffice,
    this.duration,
    this.overview,
    this.coverUrl,
    this.trailerUrl,
    this.directedBy,
    this.phase,
    this.saga,
    this.chronology,
    this.postCreditScenes,
    this.imdbId,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      releaseDate: json['release_date'],
      boxOffice: json['box_office'],
      duration: json['duration'],
      overview: json['overview'],
      coverUrl: json['cover_url'],
      trailerUrl: json['trailer_url'],
      directedBy: json['directed_by'],
      phase: json['phase'],
      saga: json['saga'],
      chronology: json['chronology'],
      postCreditScenes: json['post_credit_scenes'],
      imdbId: json['imdb_id'],
    );
  }
}
