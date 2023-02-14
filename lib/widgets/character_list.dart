import 'package:flutter/material.dart';
import 'package:marvel_characters/screens/character_details_screen.dart';
import 'package:marvel_characters/view_models/character_view_model.dart';

class CharacterList extends StatelessWidget {
  final List<CharacterViewModel> characters;

  const CharacterList({Key? key, required this.characters}) : super(key: key);

  void _navigateToDetailsScreen(
      BuildContext context, CharacterViewModel character) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            CharacterDetailsScreen(character: character.character),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return characters.isEmpty
        ? const Center(
            child: Text(
              'No Results Found',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: characters.length,
            itemBuilder: (context, index) {
              final character = characters[index];
              return InkWell(
                onTap: () => _navigateToDetailsScreen(context, character),
                child: SizedBox(
                  height: 150.0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 100.0,
                        height: 100.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          image: DecorationImage(
                            image: NetworkImage(
                                character.character.thumbnail?.imageUrl ?? ""),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              character.name ?? "",
                              style: const TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Expanded(
                              child: SizedBox(
                                width: double.infinity,
                                child: Text(
                                  character.description ?? "",
                                  style: const TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.grey,
                                  ),
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
  }
}
