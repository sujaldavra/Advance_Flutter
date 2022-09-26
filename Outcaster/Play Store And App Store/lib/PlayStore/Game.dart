import 'package:flutter/material.dart';
import 'package:flutter_app/widgets.dart';

import '../global.dart';

class Games extends StatefulWidget {
  const Games({Key? key}) : super(key: key);

  @override
  State<Games> createState() => _GamesState();
}

class _GamesState extends State<Games> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 20),
      child: ListView(
        children: [
          titleText("Game We Are Playing"),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: Global.game.map((e) => gameContainer(e)).toList(),
            ),
          ),
          titleText("Suggested For You"),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: Global.topGames.map((e) => gameContainer(e)).toList(),
            ),
          ),
          titleText("Editors' Choice games"),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: Global.allGames.map((e) => gameContainer(e)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: ListView.builder(
        itemCount: Global.topGames.length,
        itemBuilder: (context, i) {
          return topContainer(Global.topGames, i);
        },
      ),
    );
  }
}
