import 'package:flutter/material.dart';
import 'package:marvel_characters/bloc/character/characters_bloc.dart';
import 'package:marvel_characters/bloc/comics/comics_bloc.dart';
import 'package:marvel_characters/constants/colors.dart';
import 'package:provider/provider.dart';

import '../atoms/clear_icon_button.dart';

enum SearchBarType { characters, comics }

class SearchBar extends StatefulWidget {
  final String hintText;
  final SearchBarType type;

  const SearchBar(
      {Key? key,
      this.hintText = "Search",
      this.type = SearchBarType.characters})
      : super(key: key);

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
    final charactersBloc = context.read<CharactersBloc>();
    final comicsBloc = context.read<ComicsBloc>();

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
                    if (widget.type == SearchBarType.characters) {
                      charactersBloc.add(FetchCharactersEvent(value));
                    } else if (widget.type == SearchBarType.comics) {
                      comicsBloc.add(FetchComicsEvent(value));
                    }
                  }
                },
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.search,
                    color: iconColor,
                  ),
                  hintText: widget.hintText,
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          ClearIconButton(
            textController: _textController,
            type: widget.type == SearchBarType.characters
                ? ClearIconButtonType.characters
                : ClearIconButtonType.comics,
          ),
        ],
      ),
    );
  }
}
