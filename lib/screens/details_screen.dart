import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String movie =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie';
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _CustomAppBar(),
        SliverList(
          delegate: SliverChildListDelegate([
            const _PosterAndTitle(),
            _Overview(),
            _Overview(),
            const CastingCards()
          ]),
        )
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
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
            padding: const EdgeInsets.only(bottom: 10),
            color: Colors.black26,
            child: const Text('movie.title')),
        background: FadeInImage(
            fit: BoxFit.cover,
            placeholder: Image.asset('assets/img/loading.gif').image,
            image: Image.network(
                    'http://t3.gstatic.com/licensed-image?q=tbn:ANd9GcSK7tFSJPsJW3XXDj8x64bnNc6-tv846qOPV5X5RFXOyPovh40XkngoEcaAp4zomnIN')
                .image),
      ),
    );
  }
}

class _PosterAndTitle extends StatelessWidget {
  const _PosterAndTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: FadeInImage(
                height: 150,
                fit: BoxFit.cover,
                placeholder: Image.asset('assets/img/no-image.jpg').image,
                image:
                    Image.network('https://via.placeholder.com/200x300').image),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'movie.title',
                style: textTheme.headlineMedium,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
              Text(
                'movie.title',
                style: textTheme.bodySmall,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Row(
                children: [
                  const Icon(Icons.star_outlined, size: 15, color: Colors.grey),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    'movie.voteAverage',
                    style: textTheme.bodySmall,
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        'Nisi Lorem deserunt enim deserunt sint exercitation dolor nostrud. Veniam est occaecat esse irure cupidatat mollit aliquip pariatur aliqua consectetur ipsum aute occaecat sint. Do ex est enim id aliqua esse consectetur anim eiusmod aliqua ex consectetur id anim. Nisi incididunt ipsum sit adipisicing adipisicing laborum aliquip.',
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
