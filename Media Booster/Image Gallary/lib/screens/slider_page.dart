import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Photo_slider extends StatefulWidget {
  const Photo_slider({Key? key}) : super(key: key);

  @override
  State<Photo_slider> createState() => _Photo_sliderState();
}

class _Photo_sliderState extends State<Photo_slider> {
  CarouselController buttonCarouselController = CarouselController();
  int initialPage = 0;
  bool view = false;
  @override
  Widget build(BuildContext context) {
    dynamic res = ModalRoute.of(context)!.settings.arguments;
    List images = res.images as List;
    return Scaffold(
      appBar: AppBar(
        title: Text(res.category),
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CarouselSlider(
            carouselController: buttonCarouselController,
            options: CarouselOptions(
              scrollPhysics: const BouncingScrollPhysics(),
              clipBehavior: Clip.antiAlias,
              height: 400.0,
              viewportFraction: 0.7,
              initialPage: initialPage,
              enableInfiniteScroll: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 10),
              autoPlayAnimationDuration: const Duration(milliseconds: 1000),
              autoPlayCurve: Curves.slowMiddle,
              enlargeCenterPage: true,
              onPageChanged: (val, _) {
                setState(() {
                  initialPage = val;
                });
              },
              scrollDirection: Axis.horizontal,
            ),
            items: images.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: const BoxDecoration(),
                    child: Image.asset(
                      i,
                      fit: BoxFit.fill,
                      filterQuality: FilterQuality.high,
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ],
      ),
      floatingActionButton: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(
            width: 30,
          ),
          FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: () => buttonCarouselController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.slowMiddle),
            child: Icon(Icons.arrow_back_sharp),
            mini: true,
          ),
          const Spacer(),
          FloatingActionButton(
            backgroundColor: Colors.black,
            onPressed: () => buttonCarouselController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.slowMiddle),
            child: Icon(Icons.arrow_forward),
            mini: true,
          ),
        ],
      ),
    );
  }
}
