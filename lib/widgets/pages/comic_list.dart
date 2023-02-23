import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:marvel_characters/models/comic.dart';
import 'package:marvel_characters/screens/comic_details_screen.dart';
import 'package:marvel_characters/widgets/atoms/loading_indicator.dart';

class ComicList extends StatelessWidget {
  final List<Comic> comics;

  const ComicList({Key? key, required this.comics}) : super(key: key);

  void _navigateToDetailsScreen(BuildContext context, Comic comic) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ComicDetailsScreen(comic: comic),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return comics.isEmpty
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
            itemCount: comics.length,
            itemBuilder: (context, index) {
              final comic = comics[index];
              return InkWell(
                onTap: () => _navigateToDetailsScreen(context, comic),
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
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5.0),
                          child: CachedNetworkImage(
                            imageUrl: comic.thumbnail?.imageUrl ?? "",
                            fit: BoxFit.cover,
                            placeholder: (context, url) =>
                                const LoadingIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              comic.title ?? "",
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
                                  comic.description ?? "",
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
