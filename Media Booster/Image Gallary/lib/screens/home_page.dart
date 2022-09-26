import 'dart:convert';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/images.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Store> photos = [];

  lodeJasonBank() async {
    String jsonData = await rootBundle.loadString("assets/json/data.json");

    List res = jsonDecode(jsonData);

    setState(() {
      photos = res.map((e) => Store.fromJSON(e)).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    lodeJasonBank();
  }

  CarouselController buttonCarouselController = CarouselController();
  int initialPage = 0;
  bool toggle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Gallery"),
        // backgroundColor: Colors.blueAccent.withOpacity(0.7),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(25),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: StaggeredGrid.count(
            crossAxisCount: 10,
            mainAxisSpacing: 15,
            crossAxisSpacing: 15,
            children: photos
                .map(
                  (e) => StaggeredGridTile.count(
                    crossAxisCellCount: e.crossAxisCellCount,
                    mainAxisCellCount: e.mainAxisCellCount,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      onTap: () {
                        Navigator.of(context).pushNamed("slider", arguments: e);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(e.image),
                            fit: BoxFit.fill,
                          ),
                        ),
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          child: Text(
                            "${e.category}",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
