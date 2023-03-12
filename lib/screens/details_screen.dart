import 'package:flutter/material.dart';
import 'package:moviesapp/models/models.dart';
import '../widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Result movie = ModalRoute.of(context)!.settings.arguments as Result;
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _CustomAppBar(movie: movie),
        SliverList(
          delegate: SliverChildListDelegate([
            _PosterAndTitle(movie: movie),
            const SizedBox(height: 20),
            _Overview(movie),
            const SizedBox(height: 20),
            CastingCards(movie.id),
            const SizedBox(height: 20),
          ]),
        )
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  Result movie;
  _CustomAppBar({
    Key? key,
    required this.movie,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const double toolbarHeight = 45;
    return SliverAppBar(
      expandedHeight: 200,
      collapsedHeight: toolbarHeight,
      toolbarHeight: toolbarHeight,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.all(10),
            color: Colors.black26,
            child: Text(movie.title)),
        background: FadeInImage(
            alignment: Alignment.topCenter,
            fit: BoxFit.cover,
            placeholder: Image.asset('assets/img/loading.gif').image,
            image: Image.network(movie.fullPosterImg).image),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  _PosterAndTitle({
    Key? key,
    required this.movie,
  }) : super(key: key);
  Result movie;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      color: const Color.fromARGB(255, 239, 239, 239),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
                height: 150,
                fit: BoxFit.cover,
                placeholder: Image.asset('assets/img/no-image.jpg').image,
                image: Image.network(movie.fullPosterImg).image),
          ),
          const SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  movie.title,
                  style: textTheme.headlineSmall,
                  softWrap: false,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis, //
                ),
                Text(
                  movie.originalTitle,
                  style: textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                Row(
                  children: [
                    const Icon(Icons.star_outlined,
                        size: 15, color: Colors.grey),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      movie.voteAverage.toString(),
                      style: textTheme.bodySmall,
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  _Overview(this.movie);
  Result movie;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        movie.overview,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
