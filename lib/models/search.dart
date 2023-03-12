// To parse this JSON data, do
//
//     final searchMovie = searchMovieFromJson(jsonString);

import 'dart:convert';

import 'movies.dart';

SearchMovie searchMovieFromJson(String str) =>
    SearchMovie.fromJson(json.decode(str));

String searchMovieToJson(SearchMovie data) => json.encode(data.toJson());

class SearchMovie {
  SearchMovie({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<Result> results;
  int totalPages;
  int totalResults;

  factory SearchMovie.fromJson(Map<String, dynamic> json) => SearchMovie(
        page: json["page"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}
