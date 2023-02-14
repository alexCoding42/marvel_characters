import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

class Requests {
  static const String baseUrl = 'https://gateway.marvel.com:443/v1/public';
  static const String charactersEndpoint = '/characters';
  static const String mcuApiUrl = 'https://mcuapi.herokuapp.com/api/v1/movies';

  final String? apiKey = dotenv.env['MARVEL_API_KEY'];
  final String? privateKey = dotenv.env['MARVEL_PRIVATE_KEY'];

  String _getHash(String ts) {
    final bytes = utf8.encode('$ts$privateKey$apiKey');
    final digest = md5.convert(bytes);
    return digest.toString();
  }

  Future<List> getCharacters(String name) async {
    final ts = DateTime.now().millisecondsSinceEpoch.toString();
    final hash = _getHash(ts);
    final response = await http.get(
      Uri.parse(
          '$baseUrl$charactersEndpoint?nameStartsWith=$name&apikey=$apiKey&ts=$ts&hash=$hash'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final characters = data['data']['results'];
      return characters;
    } else {
      throw Exception('Failed to load characters');
    }
  }

  Future<List> getMovies() async {
    final response = await http.get(Uri.parse(mcuApiUrl));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final movies = data['data'];
      return movies;
    } else {
      throw Exception('Failed to load movies');
    }
  }
}
