import 'package:flutter/material.dart';

class CastingCards extends StatelessWidget {
  const CastingCards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      height: 180,
      width: double.infinity,
      child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => const _CastCard()),
    );
  }
}

class _CastCard extends StatelessWidget {
  const _CastCard({Key? key}) : super(key: key);

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
              fit: BoxFit.cover,
              height: 140,
              width: 100,
              placeholder: Image.asset('assets/img/no-image.jpg').image,
              image: Image.network(
                      'https://es.web.img2.acsta.net/pictures/19/02/05/12/55/5474956.jpg')
                  .image),
        ),
        const SizedBox(height: 5),
        const Text(
          'actor.name askk jksdjfksjdf',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        )
      ]),
    );
  }
}
