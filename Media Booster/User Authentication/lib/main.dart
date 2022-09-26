import 'package:flutter/material.dart';
import 'package:flutter_app/login_page.dart';
import 'package:flutter_app/user_detail_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? isLogin = prefs.getBool("isLogin") ?? false;
  bool? isRemember = prefs.getBool("isRemember") ?? false;
  runApp(
    MaterialApp(
      initialRoute: (isLogin == false)
          ? "user_details_screens"
          : (isRemember == false)
              ? "login_page"
              : "/",
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const HomePage(),
        "login_page": (context) => const LoginPage(),
        "user_details_screens": (context) => const UserDetails(),
      },
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        centerTitle: true,
        title: const Text("Home Page"),
      ),
    );
  }
}
