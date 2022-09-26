import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/AppStore/AppsPage.dart';
import 'package:flutter_app/AppStore/GamePage.dart';
import 'package:flutter_app/AppStore/SearchPage.dart';
import 'package:flutter_app/AppStore/TodayPage.dart';
import 'package:flutter_app/AppStore/UpdatePage.dart';
import 'package:flutter_app/global.dart';
import 'package:flutter_app/main.dart';

class AppStore extends StatefulWidget {
  const AppStore({Key? key}) : super(key: key);

  @override
  State<AppStore> createState() => _AppStoreState();
}

class _AppStoreState extends State<AppStore>
    with SingleTickerProviderStateMixin {
  List data = [
    const TodayPage(),
    const GamePage(),
    const AppsPage(),
    const UpdatePage(),
    const SearchPage(),
  ];

  late TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        backgroundColor: CupertinoColors.white,
        border: const Border(),
        trailing: CupertinoSwitch(
          activeColor: CupertinoColors.systemBlue.withOpacity(0.7),
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
      child: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          currentIndex: tabController.index,
          onTap: (val) {
            tabController.index = val;
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.today_fill,
              ),
              label: "Today",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.rocket,
              ),
              label: "Games",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.app,
              ),
              label: "Apps",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.arrow_down_circle,
              ),
              label: "Updates",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                CupertinoIcons.search_circle,
              ),
              label: "Search",
            ),
          ],
        ),
        tabBuilder: (context, index) {
          return CupertinoTabView(
            builder: (context) {
              return data[index];
            },
          );
        },
      ),
    );
  }
}
