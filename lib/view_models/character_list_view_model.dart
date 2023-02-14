import 'package:flutter/material.dart';
import 'package:marvel_characters/services/webservice.dart';
import 'package:marvel_characters/view_models/character_view_model.dart';

class CharacterListViewModel extends ChangeNotifier {
  List<CharacterViewModel> characters = <CharacterViewModel>[];
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> fetchCharacters(String name) async {
    _isLoading = true;
    notifyListeners();

    final results = await Webservice().fetchCharacters(name);
    characters =
        results.map((item) => CharacterViewModel(character: item)).toList();

    _isLoading = false;
    notifyListeners();
  }

  void clearList() {
    characters = [];
    notifyListeners();
  }
}
