import 'package:flutter/material.dart';
import 'package:marvel_characters/constants/colors.dart';
import 'package:marvel_characters/widgets/molecules/searchbar.dart';

class ComicsScreen extends StatefulWidget {
  const ComicsScreen({super.key});

  @override
  State<ComicsScreen> createState() => _ComicsScreenState();
}

class _ComicsScreenState extends State<ComicsScreen> {
  // final characterListViewModel = Provider.of<CharacterListViewModel>(context);

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
                "Comics",
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                ),
              ),
            ),
            const SizedBox(height: 12),
            const SearchBar(
              hintText: "Search comics",
            ),
            const SizedBox(height: 24.0),
            // characterListViewModel.isLoading
            //     ? const Expanded(child: LoadingIndicator())
            //     : Expanded(
            //         child: CharacterList(
            //             characters: characterListViewModel.characters)),
          ],
        ),
      ),
    );
  }
}
