import 'package:flutter/material.dart';
import 'package:marvel_characters/constants/colors.dart';
import 'package:marvel_characters/view_models/character_list_view_model.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatefulWidget {
  final Function clearResults;

  const SearchBar({super.key, required this.clearResults});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  Color iconColor = Colors.grey;
  String name = '';
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
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

  void _handleClear() {
    setState(() {
      name = '';
      widget.clearResults();
    });
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<CharacterListViewModel>(context);

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
                    vm.fetchCharacters(value);
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
              onPressed: _handleClear,
            ),
          ),
        ],
      ),
    );
  }
}
