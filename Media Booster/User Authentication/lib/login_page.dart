import 'package:flutter/material.dart';
import 'package:flutter_app/global.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> LoginPage = GlobalKey<FormState>();

  final TextEditingController Emailcontroller = TextEditingController();
  final TextEditingController PasswordController = TextEditingController();

  bool checkBoxVal = false;
  String? checkPassword;

  String? checkEmail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: const Text("Login Page"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Form(
            key: LoginPage,
            child: Column(
              children: [
                Image.asset("assets/images/1.png"),
                const SizedBox(height: 20),
                TextFormField(
                  validator: (val) {
                    if (val != checkEmail) {
                      return "Please Enter Valid Email";
                    }
                    return null;
                  },
                  onSaved: (val) {
                    Global.email = val;
                  },
                  controller: Emailcontroller,
                  decoration:
                      textFieldDecoration(Icons.email, "Enter Your Email", "Email"),
                ),
                const SizedBox(height: 15),
                TextFormField(
                  validator: (val) {
                    if (val != checkPassword) {
                      return "Please Enter Valid Password";
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
                    SharedPreferences prefs =
                        await SharedPreferences.getInstance();

                    checkEmail = prefs.getString("email");
                    checkPassword = prefs.getString("password");

                    if (LoginPage.currentState!.validate()) {
                      LoginPage.currentState!.save();

                      Navigator.of(context).pushReplacementNamed("/");

                      prefs.setBool("isLogin", true);
                      prefs.setBool("isRemember", checkBoxVal);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black54,
                    minimumSize: const Size(140, 45),
                    shape: const StadiumBorder(),
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    const Text("Remember me Login"),
                    Checkbox(
                      activeColor: Colors.black54,
                        value: checkBoxVal,
                        onChanged: (val) {
                          setState(() {
                            checkBoxVal = val!;
                          });
                        })
                  ],
                )
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
