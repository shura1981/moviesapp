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
  final int _page = 1;
  List<Result> listMovies = [];
  List<Result> listMoviesPopular = [];
  getOnDisplayMovies() async {
    final url = Uri.parse(
        'https://api.themoviedb.org/3/movie/now_playing?api_key=$_apiKey&language=$_language&page=$_page');
    try {
      final result = await get(url);
      final Movies movies = moviesFromJson(result);
      listMovies = movies.results;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  getOnDisplayMoviesPopular() async {
    final url = Uri.parse(
        'https://api.themoviedb.org/3/movie/popular?api_key=$_apiKey&language=$_language&page=$_page');
    try {
      final result = await get(url);
      final MoviesPopular movies = moviesPopularFromJson(result);
      listMoviesPopular = [...listMoviesPopular, ...movies.results];
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  Future<String> get(Uri url) async {
    try {
      final response = await http.get(url);
      if (response.statusCode != 200) throw Exception('404 no encontrado');
      return response.body;
    } catch (e) {
      rethrow;
    }
  }
}
