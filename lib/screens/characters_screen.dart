import 'package:flutter/material.dart';
import 'package:marvel_characters/constants/colors.dart';
import 'package:marvel_characters/view_models/character_list_view_model.dart';
import 'package:marvel_characters/widgets/atoms/loading_indicator.dart';
import 'package:marvel_characters/widgets/molecules/searchbar.dart';
import 'package:provider/provider.dart';

import '../widgets/pages/character_list.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  @override
  Widget build(BuildContext context) {
    final characterListViewModel = Provider.of<CharacterListViewModel>(context);

    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            const SizedBox(height: 8.0),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Marvel",
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                ),
              ),
            ),
            const SizedBox(height: 12),
            const SearchBar(),
            const SizedBox(height: 24.0),
            characterListViewModel.isLoading
                ? const Expanded(child: LoadingIndicator())
                : Expanded(
                    child: CharacterList(
                        characters: characterListViewModel.characters)),
          ],
        ),
      ),
    );
  }
}
