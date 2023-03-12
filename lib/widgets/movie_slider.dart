// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:moviesapp/models/models.dart';

class MovieSlider extends StatefulWidget {
  MovieSlider(
      {Key? key,
      required this.moviesPopular,
      this.title,
      required this.onNextpage})
      : super(key: key);
  List<Result> moviesPopular = [];
  String? title;
  Function onNextpage;
  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {
  final scrollController = ScrollController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(() {
      final position = scrollController.position;
      if (position.pixels >= (position.maxScrollExtent - 500)) {
        widget.onNextpage();
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 260,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (widget.title != null)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              widget.title!,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        const SizedBox(height: 5),
        Expanded(
          child: ListView.builder(
            controller: scrollController,
            itemCount: widget.moviesPopular.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              Result movie = widget.moviesPopular[index];
              return _MoviePoster(movie: movie, index: index);
            },
          ),
        ),
      ]),
    );
  }
}

class _MoviePoster extends StatelessWidget {
  Result movie;
  int index;
  _MoviePoster({
    Key? key,
    required this.movie,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UniqueKey id = UniqueKey();
    return Container(
      width: 140,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: SingleChildScrollView(
        child: Column(children: [
          GestureDetector(
            onTap: () {
              movie.heroId = 'slider-${movie.id}';
              Navigator.pushNamed(context, 'details', arguments: movie);
            },
            child: Hero(
              tag: 'slider-${movie.id}',
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
          ),
          const SizedBox(height: 5),
          Text(
            movie.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            // textAlign: TextAlign.center,
          )
        ]),
      ),
    );
  }
}
