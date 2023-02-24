class TvShow {
  final int? id;
  final String? title;
  final String? releaseDate;
  final String? lastAiredDate;
  final int? season;
  final int? numberEpisodes;
  final String? overview;
  final String? coverUrl;
  final String? trailerUrl;
  final String? directedBy;
  final int? phase;
  final String? saga;
  final String? imdbId;

  TvShow({
    this.id,
    this.title,
    this.releaseDate,
    this.lastAiredDate,
    this.season,
    this.numberEpisodes,
    this.overview,
    this.coverUrl,
    this.trailerUrl,
    this.directedBy,
    this.phase,
    this.saga,
    this.imdbId,
  });

  factory TvShow.fromJson(Map<String, dynamic> json) {
    return TvShow(
      id: json['id'],
      title: json['title'],
      releaseDate: json['release_date'],
      lastAiredDate: json['last_aired_date'],
      season: json['season'],
      numberEpisodes: json['number_episodes'],
      overview: json['overview'],
      coverUrl: json['cover_url'],
      trailerUrl: json['trailer_url'],
      directedBy: json['directed_by'],
      phase: json['phase'],
      saga: json['saga'],
      imdbId: json['imdb_id'],
    );
  }
}
