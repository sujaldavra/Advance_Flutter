import 'package:flutter/material.dart';
import 'package:flutter_app/PlayStore/Apps.dart';
import 'package:flutter_app/PlayStore/Game.dart';
import 'package:flutter_app/PlayStore/Movies.dart';
import 'package:flutter_app/main.dart';

import 'global.dart';

class PlayStore extends StatefulWidget {
  const PlayStore({Key? key}) : super(key: key);

  @override
  State<PlayStore> createState() => _PlayStoreState();
}

class _PlayStoreState extends State<PlayStore>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  var scaffoldKey = GlobalKey<ScaffoldState>();

  int initialIndex = 1;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const Drawer(),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            scaffoldKey.currentState?.openDrawer();
          },
          icon: const Icon(
            Icons.menu,
            color: Colors.grey,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Search for apps and games",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
        bottom: TabBar(
          indicatorWeight: 1,
          indicator: const BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.green, width: 2),
            ),
          ),
          labelColor: Colors.green,
          unselectedLabelColor: Colors.black.withOpacity(0.5),
          controller: tabController,
          indicatorColor: Colors.white,
          tabs: const [
            Tab(text: "For you"),
            Tab(text: "Top chart"),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.mic,
              color: Colors.grey,
            ),
          ),
          Center(
            child: Switch(
              value: Global.isIos,
              onChanged: (val) {
                Global.isIos = val;
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const MyApp(),
                    ),
                    (route) => false);
              },
            ),
          ),
        ],
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          initialIndex == 1
              ? const Apps()
              : initialIndex == 0
                  ? const Games()
                  : const Movies(),
          initialIndex == 1
              ? const App()
              : initialIndex == 0
                  ? const Game()
                  : const Movie(),
        ],
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.all(
            const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
        ),
        child: NavigationBar(
          height: 70,
          selectedIndex: initialIndex,
          onDestinationSelected: (val) {
            setState(() {
              initialIndex = val;
            });
          },
          destinations: const [
            NavigationDestination(
              selectedIcon: Icon(
                Icons.videogame_asset_rounded,
              ),
              icon: Icon(
                Icons.videogame_asset_outlined,
              ),
              label: "Games",
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.grid_view_sharp,
              ),
              icon: Icon(
                Icons.grid_view_outlined,
              ),
              label: "Apps",
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.movie,
              ),
              icon: Icon(
                Icons.movie_creation_outlined,
              ),
              label: "Movies",
            ),
          ],
        ),
      ),
    );
  }
}
