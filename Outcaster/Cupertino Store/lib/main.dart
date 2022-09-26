import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Products.dart';
import 'package:flutter_app/cartPage.dart';
import 'package:flutter_app/searchPage.dart';

void main() {
  runApp(
    const CupertinoApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  String name = "";
  String email = "";
  String location = "";

  String date = "";
  List data = [];

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  List tabs = [
    const Productspage(),
    const searchPage(),
    const cartPage(),
  ];
  int Currentindex = 3;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        currentIndex: tabController.index,
        onTap: (val) {
          tabController.index = val;
          setState(() {});
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: "Products",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.search),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.shopping_cart),
            label: "Cart",
          ),
        ],
      ),
      tabBuilder: (context, index) {
        return CupertinoTabView(
          builder: (context) {
            return tabs[index];
          },
        );
      },
    );
  }
}