import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movax_quadb/model/movie_model.dart';
import 'package:movax_quadb/utils/api_error_handler.dart';

class ApiService {
  static const String baseUrl = 'https://api.tvmaze.com';

  static Future<List<Movie>> fetchMovies() async {
    final response = await http.get(Uri.parse('$baseUrl/search/shows?q=all'));
    print("1");
    if (response.statusCode == 200) {
      List jsonList = jsonDecode(response.body);
      print(jsonList);
      print("2");
      return jsonList.map((json) => Movie.fromJson(json['show'])).toList();
    } else {
      throw ApiException('Failed to load movies');
    }
  }

  static Future<List<Movie>> searchMovies(String query) async {
    final response =
        await http.get(Uri.parse('$baseUrl/search/shows?q=$query'));
    if (response.statusCode == 200) {
      List jsonList = jsonDecode(response.body);
      return jsonList.map((json) => Movie.fromJson(json['show'])).toList();
    } else {
      throw ApiException('Failed to search movies');
    }
  }

  static Future<Movie> fetchMovieDetails(int movieId) async {
    final response = await http.get(Uri.parse('$baseUrl/shows/$movieId'));
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      return Movie.fromJson(json);
    } else {
      throw ApiException('Failed to load movie details');
    }
  }
}
