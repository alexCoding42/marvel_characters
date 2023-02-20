import 'package:flutter/material.dart';
import 'package:marvel_characters/view_models/character_list_view_model.dart';
import 'package:marvel_characters/view_models/comic_list_view_model.dart';

enum ClearIconButtonType { characters, comics }

// TODO: refacto the widget to be flexible and able to work with both characterListViewModel and comicListViewModel
class ClearIconButton extends StatefulWidget {
  final TextEditingController textController;
  final ClearIconButtonType type;
  final CharacterListViewModel? characterListViewModel;
  final ComicListViewModel? comicListViewModel;

  const ClearIconButton(
      {Key? key,
      required this.textController,
      required this.type,
      this.characterListViewModel,
      this.comicListViewModel})
      : super(key: key);

  @override
  State<ClearIconButton> createState() => _ClearIconButtonState();
}

class _ClearIconButtonState extends State<ClearIconButton> {
  @override
  Widget build(BuildContext context) {
    // final CharacterListViewModel = Provider.of<CharacterListViewModel>(context);
    // final ComicListViewModel = Provider.of<ComicListViewModel>(context);

    return Material(
      color: Colors.transparent,
      child: IconButton(
        splashRadius: 16,
        iconSize: 20,
        icon: Icon(
          Icons.clear,
          color: Colors.grey[600],
        ),
        onPressed: () {
          widget.textController.clear();
          widget.type == ClearIconButtonType.characters
              ? widget.characterListViewModel?.clearList()
              : widget.comicListViewModel?.clearList();
        },
      ),
    );
  }
}
