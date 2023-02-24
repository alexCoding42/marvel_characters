import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:marvel_characters/bloc/movies/movies_bloc.dart';
import 'package:marvel_characters/constants/colors.dart';
import 'package:marvel_characters/models/movie.dart';
import 'package:marvel_characters/screens/movies/movie_details_screen.dart';
import 'package:marvel_characters/widgets/atoms/loading_indicator.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  late MoviesBloc _moviesBloc;

  @override
  void initState() {
    super.initState();
    _moviesBloc = BlocProvider.of<MoviesBloc>(context);
    _moviesBloc.add(FetchMoviesEvent());
  }

  void _navigateToDetailsScreen(BuildContext context, Movie movie) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MovieDetailsScreen(movie: movie),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: [
              const SizedBox(height: 8.0),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Movies",
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 12.0),
              BlocBuilder<MoviesBloc, MoviesState>(
                builder: (context, state) {
                  if (state is MoviesLoadingState) {
                    return const Expanded(child: LoadingIndicator());
                  } else if (state is MoviesErrorState) {
                    return Center(
                      child: Text(
                        state.errorMessage,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  } else if (state is MoviesLoadedState) {
                    if (state.movies.isEmpty) {
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
                        child: GridView.builder(
                          padding: const EdgeInsets.all(8.0),
                          itemCount: state.movies.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            final movie = state.movies[index];
                            return GestureDetector(
                              onTap: () =>
                                  _navigateToDetailsScreen(context, movie),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: CachedNetworkImage(
                                  imageUrl: state.movies[index].coverUrl
                                          ?.toString() ??
                                      "",
                                  placeholder: (context, url) =>
                                      const LoadingIndicator(),
                                  errorWidget: (context, url, error) =>
                                      const Icon(Icons.error),
                                ),
                              ),
                            );
                          },
                        ),
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
      ),
    );
  }
}
