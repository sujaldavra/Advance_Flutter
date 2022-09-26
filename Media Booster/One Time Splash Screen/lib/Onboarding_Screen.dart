import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Onboarding_Screen extends StatefulWidget {
  const Onboarding_Screen({Key? key}) : super(key: key);

  @override
  State<Onboarding_Screen> createState() => _Onboarding_ScreenState();
}

class _Onboarding_ScreenState extends State<Onboarding_Screen> {
  int initialIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: IndexedStack(
            index: initialIndex,
            children: [
              indexPage("assets/images/Businessman.png", "Office Furnitures"),
              indexPage("assets/images/Relaxingathome.png", "Relaxing Furnitures"),
              indexPage("assets/images/Furniturestore.png", "Home Furnitures"),
            ],
          ),
        ),
      ),
      floatingActionButton: Row(
        children: [
          const Spacer(),
          ElevatedButton(
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              setState(() {
                Navigator.of(context).pushReplacementNamed("/");

                prefs.setBool("isOnboardingVisited", true);
              });
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              shape: const StadiumBorder(),
            ),
            child: const Text("Skip"),
          ),
          const SizedBox(
            width: 230,
          ),
          ElevatedButton(
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              setState(() {
                if (initialIndex < 2) {
                  initialIndex++;
                } else {
                  Navigator.of(context).pushReplacementNamed("/");

                  prefs.setBool("isIntroVisited", true);
                }
              });
            },
            style: ElevatedButton.styleFrom(
              primary: Colors.black,
              shape: const StadiumBorder(),
            ),
            child: const Text("Next"),
          ),
        ],
      ),
    );
  }

  indexPage(String image, String text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(width: 20,),
        Image.asset(image),
        const SizedBox(height: 20),
        Text(
          text,
          style: const TextStyle(
            fontSize: 27,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
