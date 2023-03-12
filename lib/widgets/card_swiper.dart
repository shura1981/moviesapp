// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import 'package:moviesapp/models/models.dart';

class CardSwiper extends StatelessWidget {
  List<Result> movies = [];

  CardSwiper({Key? key, required this.movies}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    if (movies.isEmpty) {
      return SizedBox(
        width: double.infinity,
        height: size.height * 0.5,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return SizedBox(
      width: double.infinity,
      height: size.height * 0.5,
      child: Swiper(
        itemCount: movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.6,
        itemHeight: size.height * 0.4,
        itemBuilder: (context, index) {
          Result movie = movies[index];
          return GestureDetector(
            onTap: () {
            
              Map<String, dynamic> arg = {'movie': movie, 'id': '${movie.id}$index' };
              Navigator.pushNamed(context, 'details', arguments: arg);
            },
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Hero(
                  tag: '${movie.id}$index',
                  child: FadeInImage(
                    placeholder: Image.asset('assets/img/no-image.jpg').image,
                    image: Image.network(movie.fullPosterImg).image,
                    fit: BoxFit.cover,
                  ),
                )),
          );
        },
      ),
    );
  }
}
