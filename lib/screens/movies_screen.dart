import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:marvel_characters/view_models/movie_list_view_model.dart';
import 'package:marvel_characters/widgets/atoms/loading_indicator.dart';
import 'package:provider/provider.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  late MovieListViewModel _movieListViewModel;

  @override
  void initState() {
    super.initState();
    _movieListViewModel =
        Provider.of<MovieListViewModel>(context, listen: false);
    _movieListViewModel.fetchMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<MovieListViewModel>(
          builder: (context, movieListViewModel, child) {
            if (movieListViewModel.isLoading) {
              return const LoadingIndicator();
            } else if (movieListViewModel.movies.isEmpty) {
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
              return GridView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: movieListViewModel.movies.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2 / 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: CachedNetworkImage(
                      imageUrl: movieListViewModel.movies[index].coverUrl
                              ?.toString() ??
                          "",
                      placeholder: (context, url) => const LoadingIndicator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
