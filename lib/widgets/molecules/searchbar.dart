import 'package:flutter/material.dart';
import 'package:marvel_characters/constants/colors.dart';
import 'package:marvel_characters/view_models/character_list_view_model.dart';
import 'package:provider/provider.dart';

import '../atoms/clear_icon_button.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _textController = TextEditingController();
  Color iconColor = Colors.grey;

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

  @override
  Widget build(BuildContext context) {
    final characterListViewModel = Provider.of<CharacterListViewModel>(context);

    return Container(
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
          ClearIconButton(
            textController: _textController,
            characterListViewModel: characterListViewModel,
          ),
        ],
      ),
    );
  }
}
