import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:moviesapp/models/models.dart';

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
  Map<int, List<Cast>> movieCast = {};
  bool _isLoad = false;
  getOnDisplayMovies() async {
    try {
      final result = await get('movie/now_playing', 1);
      final Movies movies = moviesFromJson(result);
      listMovies = movies.results;
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }

  getOnDisplayMoviesPopular() async {
    if (_isLoad == true) {
      return null;
    }
    _page++;
    try {
      _isLoad = true;
      final result = await get('movie/popular', _page);
      final MoviesPopular movies = moviesPopularFromJson(result);
      listMoviesPopular = [...listMoviesPopular, ...movies.results];
      notifyListeners();
    } catch (e) {
      print(e);
    } finally {
      _isLoad = false;
    }
  }

  Future<List<Cast>?> getMovieCast(int movieId) async {
    try {
      if (movieCast.containsKey(movieId)) return movieCast[movieId];
      final result = await get('movie/$movieId/credits', _page);
      final Creditos credits = creditosFromJson(result);
      movieCast[movieId] = credits.cast;
      return credits.cast;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<Result>?> searchMovie(String movie) async {
    if (_isLoad == true) {
      return null;
    }
    try {
      _isLoad = true;
      final result = await get('search/movie', _page, movie);
      final SearchMovie movies = searchMovieFromJson(result);
      print(movies);
      return movies.results;
    } catch (e) {
      rethrow;
    } finally {
      _isLoad = false;
    }
  }

  Future<String> get(String path, int page, [String query = '']) async {
    try {
      final url = Uri.parse(
          'https://api.themoviedb.org/3/$path?api_key=$_apiKey&language=$_language&page=$page&query=$query');
      final response = await http.get(url);
      if (response.statusCode != 200) throw Exception('404 no encontrado');
      return response.body;
    } catch (e) {
      rethrow;
    }
  }
}
