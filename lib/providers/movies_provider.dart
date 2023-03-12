import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:moviesapp/models/movies_popular.dart';

import '../models/movies.dart';

class MoviesProvier with ChangeNotifier {
  MoviesProvier() {
    getOnDisplayMovies();
    getOnDisplayMoviesPopular();
  }
  final String _apiKey = '1865f43a0549ca50d341dd9ab8b29f49';
  final String _language = 'es-Es';
  int _page = 0;
  List<Result> listMovies = [];
  List<Result> listMoviesPopular = [];
  getOnDisplayMovies() async {
    try {
      final result = await get('now_playing');
      final Movies movies = moviesFromJson(result);
      listMovies = movies.results;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  getOnDisplayMoviesPopular() async {
    try {
      final result = await get('popular');
      final MoviesPopular movies = moviesPopularFromJson(result);
      listMoviesPopular = [...listMoviesPopular, ...movies.results];
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<String> get(String path) async {
    try {
      _page++;
      final url = Uri.parse(
          'https://api.themoviedb.org/3/movie/$path?api_key=$_apiKey&language=$_language&page=$_page');
      final response = await http.get(url);
      if (response.statusCode != 200) throw Exception('404 no encontrado');
      return response.body;
    } catch (e) {
      rethrow;
    }
  }
}
