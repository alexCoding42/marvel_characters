import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_characters/bloc/characters/characters_bloc.dart';
import 'package:marvel_characters/bloc/comics/comics_bloc.dart';

enum ClearIconButtonType { characters, comics }

class ClearIconButton extends StatefulWidget {
  final TextEditingController textController;
  final ClearIconButtonType type;

  const ClearIconButton({
    Key? key,
    required this.textController,
    required this.type,
  }) : super(key: key);

  @override
  State<ClearIconButton> createState() => _ClearIconButtonState();
}

class _ClearIconButtonState extends State<ClearIconButton> {
  @override
  Widget build(BuildContext context) {
    final charactersBloc = context.read<CharactersBloc>();
    final comicsBloc = context.read<ComicsBloc>();

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
          if (widget.type == ClearIconButtonType.characters) {
            charactersBloc.add(ClearCharactersEvent());
          } else if (widget.type == ClearIconButtonType.comics) {
            comicsBloc.add(ClearComicsEvent());
          }
        },
      ),
    );
  }
}
