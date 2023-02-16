import 'package:flutter/material.dart';
import 'package:marvel_characters/services/webservice.dart';
import 'package:marvel_characters/view_models/movie_view_model.dart';

class MovieListViewModel extends ChangeNotifier {
  List<MovieViewModel> movies = <MovieViewModel>[];
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> fetchMovies() async {
    _isLoading = true;

    final results = await Webservice().fetchMovies();
    movies = results.map((item) => MovieViewModel(movie: item)).toList();

    _isLoading = false;

    notifyListeners();
  }
}
