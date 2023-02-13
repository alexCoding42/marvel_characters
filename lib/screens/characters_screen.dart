import 'package:flutter/material.dart';
import 'package:marvel_characters/widgets/searchbar.dart';

import '../services/requests.dart';
import '../widgets/character_list.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  List<dynamic> characters = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  void _fetchCharacters(String name) async {
    setState(() {
      isLoading = true;
    });

    final results = await Requests().getCharacters(name);
    setState(() {
      characters = results;
      isLoading = false;
    });
  }

  void _clearResults() {
    setState(() {
      characters = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            const SizedBox(
              height: 8.0,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Marvel",
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 12),
            SearchBar(
                fetchCharacters: _fetchCharacters, clearResults: _clearResults),
            const SizedBox(height: 24.0),
            CharacterList(
              characters: characters,
              isLoading: isLoading,
            ),
          ],
        ),
      ),
    );
  }
}
