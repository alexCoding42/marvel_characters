import 'package:flutter/material.dart';
import 'package:marvel_characters/constants/colors.dart';
import 'package:marvel_characters/view_models/comic_list_view_model.dart';
import 'package:marvel_characters/widgets/atoms/loading_indicator.dart';
import 'package:marvel_characters/widgets/molecules/searchbar.dart';
import 'package:marvel_characters/widgets/pages/comic_list.dart';
import 'package:provider/provider.dart';

class ComicsScreen extends StatefulWidget {
  const ComicsScreen({super.key});

  @override
  State<ComicsScreen> createState() => _ComicsScreenState();
}

class _ComicsScreenState extends State<ComicsScreen> {
  @override
  Widget build(BuildContext context) {
    final comicListViewModel = Provider.of<ComicListViewModel>(context);

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
              type: SearchBarType.comics,
              hintText: "Search comics",
            ),
            const SizedBox(height: 24.0),
            comicListViewModel.isLoading
                ? const Expanded(child: LoadingIndicator())
                : Expanded(child: ComicList(comics: comicListViewModel.comics)),
          ],
        ),
      ),
    );
  }
}
