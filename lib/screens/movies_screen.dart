import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../services/webservice.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  List<dynamic> movies = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchMovies();
  }

  void _fetchMovies() async {
    setState(() {
      isLoading = true;
    });

    // final results = await Requests().getMovies();
    setState(() {
      // movies = results;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: movies.isNotEmpty
            ? GridView.builder(
                padding: EdgeInsets.all(8.0),
                itemCount: movies.length,
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
                      imageUrl: movies[index]['cover_url']?.toString() ?? "",
                      placeholder: (context, url) => SizedBox(
                        width: 30,
                        height: 30,
                        child: Image.asset(
                          'images/place_holder.png',
                        ),
                      ),
                      errorWidget: (context, url, error) => Image.asset(
                        'images/place_holder.png',
                        width: 50,
                        height: 50,
                      ),
                    ),
                  );
                },
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
    );
  }
}
