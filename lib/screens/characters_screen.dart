import 'package:flutter/material.dart';
import 'package:marvel_characters/constants/colors.dart';
import 'package:marvel_characters/screens/character_details_screen.dart';
import 'package:marvel_characters/view_models/character_list_view_model.dart';
import 'package:marvel_characters/view_models/character_view_model.dart';
import 'package:provider/provider.dart';

import '../widgets/character_list.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  final TextEditingController _textController = TextEditingController();
  Color iconColor = Colors.grey;

  @override
  void initState() {
    super.initState();
  }

  void _handleFocusChange(bool hasFocus) {
    if (hasFocus) {
      setState(() {
        iconColor = kPrimaryColor;
      });
    } else {
      setState(() {
        iconColor = Colors.grey;
      });
    }
  }

  void _navigateToDetailsScreen(
      BuildContext context, CharacterViewModel character) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CharacterDetailsScreen(
          character: character.character,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final characterListViewModel = Provider.of<CharacterListViewModel>(context);

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
                  color: kPrimaryColor,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.only(left: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[200],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Focus(
                      onFocusChange: _handleFocusChange,
                      child: TextField(
                        controller: _textController,
                        onSubmitted: (value) {
                          if (value.trim().isNotEmpty) {
                            characterListViewModel.fetchCharacters(value);
                          }
                        },
                        decoration: InputDecoration(
                          icon: Icon(
                            Icons.search,
                            color: iconColor,
                          ),
                          hintText: "Search...",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: IconButton(
                        splashRadius: 16,
                        iconSize: 20,
                        icon: Icon(
                          Icons.clear,
                          color: Colors.grey[600],
                        ),
                        onPressed: () {
                          _textController.clear();
                          characterListViewModel.clearList();
                        }),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24.0),
            characterListViewModel.isLoading
                ? const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Expanded(
                    child: CharacterList(
                        characters: characterListViewModel.characters),
                  ),
          ],
        ),
      ),
    );
  }
}
