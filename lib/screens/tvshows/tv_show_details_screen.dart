import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:marvel_characters/models/tvshow.dart';

class TvShowDetailsScreen extends StatelessWidget {
  final TvShow show;

  const TvShowDetailsScreen({Key? key, required this.show}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          show.title ?? "",
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
              aspectRatio: 4 / 5,
              child: CachedNetworkImage(
                imageUrl: show.coverUrl ?? '',
                fit: BoxFit.cover,
                width: double.infinity,
                height: 200.0,
              ),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    show.title ?? '',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    show.releaseDate ?? '',
                    style: TextStyle(
                      color: Colors.grey[500],
                      fontSize: 14.0,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Text(
                    show.overview ?? '',
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  const SizedBox(height: 16.0),

                  if (show.season != null)
                    Text(
                      'Season: ${show.season}',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 14.0,
                      ),
                    ),
                  if (show.numberEpisodes != null)
                    Text(
                      'Number of episodes: ${show.numberEpisodes}',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 14.0,
                      ),
                    ),
                  if (show.phase != null)
                    Text(
                      'Phase: ${show.phase}',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 14.0,
                      ),
                    ),
                  if (show.saga != null)
                    Text(
                      'Saga: ${show.saga}',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 14.0,
                      ),
                    ),
                  if (show.directedBy != null)
                    Text(
                      'Directed by: ${show.directedBy}',
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 14.0,
                      ),
                    ),
                  const SizedBox(height: 32.0),
                  // Add additional widgets below as needed
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
