import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_characters/bloc/comics/comics_bloc.dart';
import 'package:marvel_characters/constants/colors.dart';
import 'package:marvel_characters/widgets/atoms/loading_indicator.dart';
import 'package:marvel_characters/widgets/molecules/searchbar.dart';
import 'package:marvel_characters/widgets/pages/comic_list.dart';

class ComicsScreen extends StatefulWidget {
  const ComicsScreen({super.key});

  @override
  State<ComicsScreen> createState() => _ComicsScreenState();
}

class _ComicsScreenState extends State<ComicsScreen> {
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
              type: SearchBarType.comics,
              hintText: "Search comics",
            ),
            const SizedBox(height: 24.0),
            BlocBuilder<ComicsBloc, ComicsState>(
              builder: (context, state) {
                if (state is ComicsLoadingState) {
                  return const Expanded(child: LoadingIndicator());
                } else if (state is ComicsErrorState) {
                  return Center(
                    child: Text(
                      state.errorMessage,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                } else if (state is ComicsLoadedState) {
                  if (state.comics.isEmpty) {
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
                      child: ComicList(comics: state.comics),
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
