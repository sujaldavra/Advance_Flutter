import 'package:flutter/material.dart';
import 'package:flutter_app/global.dart';
import 'package:flutter_app/widgets.dart';

class Apps extends StatefulWidget {
  const Apps({Key? key}) : super(key: key);

  @override
  State<Apps> createState() => _AppsState();
}

class _AppsState extends State<Apps> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 20),
      child: ListView(
        children: [
          titleText("Top Apps"),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: Global.topApps.map((e) => appContainer(e)).toList(),
            ),
          ),
          titleText("Popular Apps"),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: Global.popularApps.map((e) => appContainer(e)).toList(),
            ),
          ),
          titleText("Google Apps"),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: Global.googleApp.map((e) => appContainer(e)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: ListView.builder(
        itemCount: Global.topApps.length,
        itemBuilder: (context, i) {
          return topContainer(Global.topApps, i);
        },
      ),
    );
  }
}
