import 'package:flutter/material.dart';
import 'package:moviesapp/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../providers/movies_provider.dart';
import '../search/search_delegate.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvier = Provider.of<MoviesProvier>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          actions: [
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: MovieSearchDelegate());
                },
                icon: const Icon(Icons.search_outlined))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CardSwiper(
                movies: moviesProvier.listMovies,
              ),
              MovieSlider(
                moviesPopular: moviesProvier.listMoviesPopular,
                title: 'Populares',
                onNextpage: () => moviesProvier.getOnDisplayMoviesPopular(),
              )
            ],
          ),
        ));
  }
}
