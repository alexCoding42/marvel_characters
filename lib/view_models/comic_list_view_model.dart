import 'package:flutter/material.dart';
import 'package:marvel_characters/services/webservice.dart';
import 'package:marvel_characters/view_models/comic_view_model.dart';

class ComicListViewModel extends ChangeNotifier {
  List<ComicViewModel> comics = <ComicViewModel>[];
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> fetchComics(String name) async {
    _isLoading = true;

    final results = await Webservice().fetchComics(name);
    comics = results.map((item) => ComicViewModel(comic: item)).toList();

    _isLoading = false;
    notifyListeners();
  }

  void clearList() {
    comics = [];
    notifyListeners();
  }
}
