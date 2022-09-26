import 'package:flutter/material.dart';
import 'package:flutter_app/CustomRow.dart';
import 'package:flutter_app/helpers/user_api_helper.dart';
import 'package:flutter_app/modals/user_modal.dart';

class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade400,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.arrow_forward_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {});
            },
          ),
          const SizedBox(
            width: 10,
          ),
        ],
        centerTitle: true,
        title: const Text(
          "User Details",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: FutureBuilder(
        future: UserDetailsAPI.userDetailsAPI.fetchUserDetailsAPI(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            UserDetails? data = snapshot.data;
            return Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(
                20,
              ),
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 160,
                          width: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.black,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                data!.image,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Text(
                          "${data.title} ${data.firstName} ${data.lastName}",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        custom("Username :", data.userName),
                        custom("Email :", data.email),
                        custom("Age :", data.age),
                        custom("Gender :", data.gender),
                        custom("Phone :", data.phone),
                        const Text(
                          "Address :- ",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            data.address,
                            style: const TextStyle(
                              fontSize: 17,
                              color: Colors.black54,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
        },
      ),
    );
  }
}
