// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:moviesapp/models/movies_popular.dart';

import '../models/movies.dart';

class MovieSlider extends StatelessWidget {
  MovieSlider({
    Key? key,
    required this.moviesPopular,
  }) : super(key: key);
  List<ResultPopular> moviesPopular = [];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 260,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'Populares',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 5),
        Expanded(
          child: ListView.builder(
            itemCount: moviesPopular.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              ResultPopular movie = moviesPopular[index];
              return _MoviePoster(movie: movie);
            },
          ),
        ),
      ]),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  ResultPopular movie;
  _MoviePoster({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(children: [
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, 'details',
                arguments: 'movie-instance');
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
                width: double.infinity,
                height: 190,
                fit: BoxFit.cover,
                placeholder: Image.asset('assets/img/no-image.jpg').image,
                image: Image.network(movie.fullPosterImg).image),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          movie.title,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          // textAlign: TextAlign.center,
        )
      ]),
    );
  }
}
