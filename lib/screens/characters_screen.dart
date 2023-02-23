import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_characters/bloc/character/characters_bloc.dart';
import 'package:marvel_characters/constants/colors.dart';
import 'package:marvel_characters/widgets/atoms/loading_indicator.dart';
import 'package:marvel_characters/widgets/molecules/searchbar.dart';
import 'package:marvel_characters/widgets/pages/character_list.dart';

class CharactersScreen extends StatefulWidget {
  const CharactersScreen({super.key});

  @override
  State<CharactersScreen> createState() => _CharactersScreenState();
}

class _CharactersScreenState extends State<CharactersScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            const SizedBox(height: 8.0),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Characters",
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                ),
              ),
            ),
            const SizedBox(height: 12),
            const SearchBar(
              type: SearchBarType.characters,
              hintText: "Search characters",
            ),
            const SizedBox(height: 24.0),
            BlocBuilder<CharactersBloc, CharactersState>(
              builder: (context, state) {
                if (state is CharactersLoadingState) {
                  return const Expanded(child: LoadingIndicator());
                } else if (state is CharactersErrorState) {
                  return Center(
                    child: Text(
                      state.errorMessage,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                } else if (state is CharactersLoadedState) {
                  if (state.characters.isEmpty) {
                    return const Center(
                      child: Text(
                        'No Results Found',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  } else {
                    return Expanded(
                      child: CharacterList(characters: state.characters),
                    );
                  }
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
