import 'package:flutter/material.dart';
import 'package:moviesapp/providers/movies_provider.dart';
import 'package:provider/provider.dart';

import '../models/models.dart';

class CastingCards extends StatelessWidget {
  CastingCards(this.id, {super.key});
  int id;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MoviesProvier>(context, listen: false);
    return FutureBuilder(
      future: provider.getMovieCast(id),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text(''),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          final List<Cast>? listCast = snapshot.data;
          return Container(
            margin: const EdgeInsets.only(bottom: 30),
            height: 180,
            width: double.infinity,
            child: ListView.builder(
                itemCount: listCast!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => _CastCard(listCast[index])),
          );
        }
        return const SizedBox(
          height: 180,
          width: double.infinity,
          child: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

class _CastCard extends StatelessWidget {
  _CastCard(this.cast, {Key? key}) : super(key: key);
  Cast cast;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: FadeInImage(
              imageErrorBuilder: (context, error, stackTrace) {
                return Image.network(
                  'https://i.stack.imgur.com/GNhxO.png',
                  fit: BoxFit.cover,
                );
              },
              fit: BoxFit.cover,
              height: 140,
              width: 100,
              placeholder: Image.asset('assets/img/no-image.jpg').image,
              image: Image.network(cast.fullPosterImg).image),
        ),
        const SizedBox(height: 5),
        Text(
          cast.name,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        )
      ]),
    );
  }
}
