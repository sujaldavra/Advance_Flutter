import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'global.dart';

class UserDetails extends StatefulWidget {
  const UserDetails({Key? key}) : super(key: key);

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  final GlobalKey<FormState> userDetails = GlobalKey<FormState>();

  final TextEditingController EmailController = TextEditingController();
  final TextEditingController PasswordController = TextEditingController();
  final TextEditingController NameController = TextEditingController();
  final TextEditingController NumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: const Text("User Details"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Form(
            key: userDetails,
            child: Column(
              children: [
                Image.asset("assets/images/1.png"),
                TextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please Enter Name";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    Global.name = val;
                  },
                  controller: NameController,
                  decoration:
                      textFieldDecoration(Icons.person, "Enter Your Name", "Name"),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please Enter Number";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    Global.number = val;
                  },
                  keyboardType: TextInputType.phone,
                  controller: NumberController,
                  decoration:
                      textFieldDecoration(Icons.call, "Enter Your Number", "Number"),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please Enter Email";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    Global.email = val;
                  },
                  controller: EmailController,
                  decoration:
                      textFieldDecoration(Icons.email, "Enter Your Email", "Email"),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please Enter Password";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    Global.password = val;
                  },
                  controller: PasswordController,
                  obscureText: true,
                  decoration: textFieldDecoration(
                      Icons.lock, "Enter Your Password", "Password"),
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () async {
                    if (userDetails.currentState!.validate()) {
                      userDetails.currentState!.save();
                      Navigator.of(context).pushReplacementNamed("login_page");
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setBool("isUserDetails", true);
                      prefs.setString("email", Global.email.toString());
                      prefs.setString("password", Global.password.toString());
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black54,
                    minimumSize: const Size(150, 50),
                    shape: const StadiumBorder(),
                  ),
                  child: const Text(
                    "Next",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }

  textFieldDecoration(icon, hint, label) {
    return InputDecoration(
      prefixIcon: Icon(icon),
      hintText: hint,
      label: Text(label),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
