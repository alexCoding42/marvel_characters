import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:marvel_characters/constants/api_endpoints.dart';
import 'package:marvel_characters/models/character.dart';
import 'package:marvel_characters/models/comic.dart';
import 'package:marvel_characters/models/movie.dart';
import 'package:marvel_characters/models/tvshow.dart';

class Webservice {
  final String? apiKey = dotenv.env['MARVEL_API_KEY'];
  final String? privateKey = dotenv.env['MARVEL_PRIVATE_KEY'];

  String _getHash(String ts) {
    final bytes = utf8.encode('$ts$privateKey$apiKey');
    final digest = md5.convert(bytes);
    return digest.toString();
  }

  Future<List<Character>> fetchCharacters(String name) async {
    final ts = DateTime.now().millisecondsSinceEpoch.toString();
    final hash = _getHash(ts);
    final url =
        '$marvelApiBaseUrl$marvelApiCharactersEndpoint?nameStartsWith=$name&apikey=$apiKey&ts=$ts&hash=$hash';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable json = body["data"]['results'];
      return json.map((character) => Character.fromJson(character)).toList();
    } else {
      throw Exception('Failed to load characters');
    }
  }

  Future<List<Comic>> fetchComics(String name) async {
    final ts = DateTime.now().millisecondsSinceEpoch.toString();
    final hash = _getHash(ts);
    final url =
        '$marvelApiBaseUrl$marvelApiComicsEndpoint?titleStartsWith=$name&apikey=$apiKey&ts=$ts&hash=$hash';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable json = body["data"]['results'];
      return json.map((comic) => Comic.fromJson(comic)).toList();
    } else {
      throw Exception('Failed to load comics');
    }
  }

  Future<List<Movie>> fetchMovies() async {
    const url = '$mcuApiBaseUrl$mcuApiMoviesEndpoint';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable json = body["data"];
      return json.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<List<TvShow>> fetchTvShows() async {
    const url = '$mcuApiBaseUrl$mcuApiTvShowsEndpoint';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);
      final Iterable json = body["data"];
      return json.map((show) => TvShow.fromJson(show)).toList();
    } else {
      throw Exception('Failed to load TV shows');
    }
  }
}
