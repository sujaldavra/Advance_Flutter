import 'package:flutter/material.dart';
import 'package:flutter_app/Global.dart';
import 'package:flutter_app/Website_Page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => const MyApp(),
        "Website_page": (context) => const Website_Page(),
      },
    ),
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
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text("OTT platforms"),
        actions: [
          IconButton(
            icon: const Icon(Icons.bookmark_border),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext dialogContext) {
                  return AlertDialog(
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    title: const Center(
                        child: Text(
                      'All Bookmarks',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    )),
                    content: SizedBox(
                      height: MediaQuery.of(context).size.width * 0.75,
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: ListView.separated(
                        itemCount: Global.BookMarks.length,
                        itemBuilder: (context, i) {
                          return ListTile(
                            onTap: () {
                              Navigator.of(context).pop();
                              Global.Currentwebsite["Website"] =
                                  Global.BookMarks[i];
                              Navigator.of(context).pushNamed("Website_page");
                            },
                            title: Text(
                              Global.BookMarks[i],
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(color: Colors.black),
                            ),
                          );
                        },
                        separatorBuilder: (context, i) {
                          return const Divider(
                            color: Colors.black,
                            endIndent: 30,
                            indent: 30,
                          );
                        },
                      ),
                    ),
                  );
                },
              );
            },
          ),
          const SizedBox(
            width: 15,
          )
        ],
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: Global.Web.length,
        itemBuilder: (context, i) {
          return Container(
            margin: const EdgeInsets.only(left: 15, top: 15, right: 15),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {
                Global.Currentwebsite = Global.Web[i];
                Navigator.of(context).pushNamed("Website_page");
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15),
                ),
                height: 70,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SizedBox(
                      width: 50,
                    ),
                    CircleAvatar(
                      radius: 29,
                      backgroundImage:
                          NetworkImage(Global.Web[i]["Image"]),
                    ),
                    const Spacer(
                      flex: 30,
                    ),
                    Text(
                      "${Global.Web[i]["Name"]}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 23,
                      ),
                    ),
                    const Spacer(
                      flex: 40,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
