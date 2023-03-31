import 'package:flutter/material.dart';
import 'package:moviesapp/models/movies.dart';
import 'package:moviesapp/providers/movies_provider.dart';
import 'package:provider/provider.dart';

class MovieSearchDelegate extends SearchDelegate {
  @override
  // TODO: implement searchFieldLabel
  String? get searchFieldLabel => 'Buscar película';

  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return const Text('buildresults');
  }

  Widget _emptyContainer() {
    return const Center(
      child: Icon(
        Icons.movie_creation_outlined,
        color: Colors.black38,
        size: 130,
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    if (query.isEmpty) {
      return _emptyContainer();
    }
    final _provider = Provider.of<MoviesProvier>(context, listen: false);
    _provider.getSugestionByQuery(query);
    return StreamBuilder<List<Result>?>(
        stream: _provider.sugestionStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return _emptyContainer();
          return ListView.separated(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return ItemMovie(
                movie: snapshot.data![index],
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                color: Color.fromARGB(255, 232, 231, 231),
              );
            },
          );
        });
  }
}

class ItemMovie extends StatelessWidget {
  const ItemMovie({Key? key, required this.movie}) : super(key: key);
 final Result movie;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        movie.heroId = 'search-${movie.id}';
        Navigator.pushNamed(context, 'details', arguments: movie);
      },
      leading: Hero(
        tag: 'search-${movie.id}',
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: FadeInImage(
              height: 64,
              width: 64,
              fit: BoxFit.cover,
              placeholder: Image.asset('assets/img/no-image.jpg').image,
              image: Image.network(movie.fullPosterImg).image),
        ),
      ),
      title: Text(movie.title),
      subtitle: Text(movie.originalTitle),
    );
  }
}




