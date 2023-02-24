import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:marvel_characters/bloc/tvshows/tv_shows_bloc.dart';
import 'package:marvel_characters/constants/colors.dart';
import 'package:marvel_characters/models/tvshow.dart';
import 'package:marvel_characters/screens/tvshows/tv_show_details_screen.dart';
import 'package:marvel_characters/widgets/atoms/loading_indicator.dart';

class TvShowsScreen extends StatefulWidget {
  const TvShowsScreen({Key? key}) : super(key: key);

  @override
  State<TvShowsScreen> createState() => _TvShowsScreenState();
}

class _TvShowsScreenState extends State<TvShowsScreen> {
  late TvShowsBloc _tvShowsBloc;

  @override
  void initState() {
    super.initState();
    _tvShowsBloc = BlocProvider.of<TvShowsBloc>(context);
    _tvShowsBloc.add(FetchTvShowsEvent());
  }

  void _navigateToDetailsScreen(BuildContext context, TvShow show) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TvShowDetailsScreen(show: show),
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
                  "Tv Shows",
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 12.0),
              BlocBuilder<TvShowsBloc, TvShowsState>(
                builder: (context, state) {
                  if (state is TvShowsLoadingState) {
                    return const Expanded(child: LoadingIndicator());
                  } else if (state is TvShowsErrorState) {
                    return Center(
                      child: Text(
                        state.errorMessage,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  } else if (state is TvShowsLoadedState) {
                    if (state.tvShows.isEmpty) {
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
                          itemCount: state.tvShows.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 2 / 3,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            final movie = state.tvShows[index];
                            return GestureDetector(
                              onTap: () =>
                                  _navigateToDetailsScreen(context, movie),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: CachedNetworkImage(
                                  imageUrl: state.tvShows[index].coverUrl
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
