import 'package:flutter/material.dart';
import 'package:flutter_app/widgets.dart';

import '../global.dart';

class Movies extends StatefulWidget {
  const Movies({Key? key}) : super(key: key);

  @override
  State<Movies> createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 20),
      child: ListView(
        children: [
          titleText("Suggested For You"),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: Global.topSellerMovies.map((e) => movieContainer(e)).toList(),
            ),
          ),
          titleText("Top Seller Movie"),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children:
                  Global.topMovie.map((e) => movieContainer(e)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class Movie extends StatefulWidget {
  const Movie({Key? key}) : super(key: key);

  @override
  State<Movie> createState() => _MovieState();
}

class _MovieState extends State<Movie> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: ListView.builder(
        itemCount: Global.topMovie.length,
        itemBuilder: (context, i) {
          return topContainer(Global.topMovie, i);
        },
      ),
    );
  }
}
