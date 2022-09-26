import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Golobal.dart';

class searchPage extends StatefulWidget {
  const searchPage({Key? key}) : super(key: key);

  @override
  State<searchPage> createState() => _searchPageState();
}

class _searchPageState extends State<searchPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Container(
              height: 65,
              padding: const EdgeInsets.all(11),
              child: const CupertinoSearchTextField(),
            ),
            Expanded(
              child: ListView(
                children: Global.Productslist.map(
                  (e) => Container(
                    color: CupertinoColors.white,
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          height: 100,
                          width: width * 0.27,
                          child: Container(
                            decoration: BoxDecoration(
                              color:
                                  CupertinoColors.systemGrey.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(e["image"]),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 100,
                          width: width * 0.73,
                          padding: const EdgeInsets.only(right: 12, left: 3),
                          child: Container(
                            decoration: const BoxDecoration(
                              border: BorderDirectional(
                                bottom: BorderSide(
                                  color: CupertinoColors.systemGrey,
                                ),
                              ),
                            ),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Spacer(),
                                    Text(
                                      e["name"],
                                      style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(height: 7),
                                    Text(
                                      "\$${e["price"]}",
                                      style: const TextStyle(
                                        color: CupertinoColors.systemGrey,
                                      ),
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                                const Spacer(),
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        Global.Listcart.add(e);
                                        Global.Listcart =
                                            Global.Listcart.toSet().toList();
                                      });
                                    },
                                    child: const Icon(
                                      CupertinoIcons.add_circled,
                                    )),
                                const SizedBox(width: 10),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
