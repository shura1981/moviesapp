import 'package:flutter/material.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({Key? key}) : super(key: key);

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
            itemCount: 20,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => _MoviePoster(),
          ),
        ),
      ]),
    );
  }
}

class _MoviePoster extends StatelessWidget {
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
                image:
                    Image.network('https://via.placeholder.com/300x400').image),
          ),
        ),
        const SizedBox(height: 5),
        const Text(
          'Starwars: EL retorno del nuevo Jedi silvestre de Monte',
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          // textAlign: TextAlign.center,
        )
      ]),
    );
  }
}
