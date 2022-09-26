import 'package:flutter/material.dart';
import 'package:flutter_app/Videos_Page.dart';
import 'package:flutter_app/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const HomePage(),
        "Videos_Page": (context) => const VideosPage(),
      },
    ),
  );
}
