// To parse this JSON data, do
//
//     final moviesPopular = moviesPopularFromJson(jsonString);

import 'dart:convert';

import 'package:moviesapp/models/movies.dart';

MoviesPopular moviesPopularFromJson(String str) =>
    MoviesPopular.fromJson(json.decode(str));

String moviesPopularToJson(MoviesPopular data) => json.encode(data.toJson());

class MoviesPopular {
  MoviesPopular({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<Result> results;
  int totalPages;
  int totalResults;

  factory MoviesPopular.fromJson(Map<String, dynamic> json) => MoviesPopular(
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
