import 'package:flutter/material.dart';
import 'package:flutter_app/Global.dart';

class Educational extends StatefulWidget {
  const Educational({Key? key}) : super(key: key);

  @override
  State<Educational> createState() => _EducationalState();
}

class _EducationalState extends State<Educational> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: const Text("Educational Websites"),
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
          const SizedBox(width: 15,)
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
                height: 65,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "${Global.Web[i]["Name"]}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 23,
                      ),
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
