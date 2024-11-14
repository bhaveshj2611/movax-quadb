import 'package:flutter/material.dart';
import 'package:movax_quadb/model/movie_model.dart';
import '../utils/api_service.dart';

class MovieController with ChangeNotifier {
  List<Movie> _movies = [];
  bool _isLoading = false;

  List<Movie> get movies => _movies;
  bool get isLoading => _isLoading;

  Future<void> fetchMovies() async {
    _isLoading = true;
    notifyListeners();

    try {
      print("3");
      _movies = await ApiService.fetchMovies();
      print("Movies loaded: ${_movies.length}");
      print("4");
    } catch (error) {
      print('Error fetching movies: $error');
    }

    _isLoading = false;
    notifyListeners();
  }

  Future<void> searchMovies(String query) async {
    _isLoading = true;
    notifyListeners();
    try {
      _movies = await ApiService.searchMovies(query);
    } catch (error) {
      print('Error searching movies: $error');
    }
    _isLoading = false;
    notifyListeners();
  }
}
