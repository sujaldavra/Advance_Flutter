import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Onboarding_Screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool? isIntroVisited = prefs.getBool("isOnboardingVisited") ?? false;
  runApp(
    MaterialApp(
      initialRoute: (isIntroVisited == false) ? "intro_page" : "/",
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const HomePage(),
        "Onboarding_Screen": (context) => const Onboarding_Screen(),
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
        centerTitle: true,
        title: const Text("Home Page"),
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setBool('isOnboardingVisited', false);

              Navigator.of(context).pushReplacementNamed('Onboarding_Screen');
            },
            icon: Icon(Icons.logout_outlined),
          ),
        ],
      ),
    );
  }
}
