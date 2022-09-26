import 'package:flutter/material.dart';
import 'package:flutter_app/Educational.dart';
import 'package:flutter_app/Website_Page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const Educational(),
        "Website_page": (context) => const Website_Page(),
      },
    ),
  );
}