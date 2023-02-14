import 'package:flutter/material.dart';
import 'package:marvel_characters/view_models/character_list_view_model.dart';

class ClearIconButton extends StatelessWidget {
  final TextEditingController textController;
  final CharacterListViewModel characterListViewModel;

  const ClearIconButton({
    Key? key,
    required this.textController,
    required this.characterListViewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          textController.clear();
          characterListViewModel.clearList();
        },
      ),
    );
  }
}
