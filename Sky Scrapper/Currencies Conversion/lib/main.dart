import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/home_page.dart';
import 'global.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return (Global.isIOS == false)
        ? const MaterialApp(
            debugShowCheckedModeBanner: false,
            home: HomePage(),
          )
        : const CupertinoApp(
            theme: CupertinoThemeData(
            ),
            debugShowCheckedModeBanner: false,
            home: HomePage(),
          );
  }
}
