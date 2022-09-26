import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int initialStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Stepper App",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          Stepper(
            currentStep: initialStep,
            onStepTapped: (val) {
              setState(() {
                initialStep = val;
              });
            },
            onStepContinue: () {
              setState(() {
                if (initialStep < 2) initialStep++;
              });
            },
            onStepCancel: () {
              setState(() {
                if (initialStep > 0) initialStep--;
              });
            },
            steps: [
              Step(
                title: const Text("Sing up"),
                content: Column(
                  children: [
                    TextField(
                      decoration: decoration(Icons.person_outline, "Full Name"),
                    ),
                    TextField(
                      decoration: decoration(Icons.email_outlined, "Email id"),
                    ),
                    TextField(
                      decoration: decoration(Icons.lock_outline, "Password"),
                    ),
                    TextField(
                      decoration:
                      decoration(Icons.lock_outline, "Conform Password"),
                    ),
                  ],
                ),
              ),
              Step(
                title: const Text("Login"),
                content: Column(
                  children: [
                    TextField(
                      decoration: decoration(Icons.person_outline, "User Name"),
                    ),
                    TextField(
                      decoration: decoration(Icons.lock_outline, "Password"),
                    ),
                  ],
                ),
              ),
              Step(
                title: const Text("Home"),
                content: Container(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  decoration(icon, String hint) {
    return InputDecoration(
      icon: Icon(icon),
      hintText: hint,
    );
  }
}