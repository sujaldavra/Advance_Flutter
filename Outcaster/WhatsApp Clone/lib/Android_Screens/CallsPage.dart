import 'package:flutter/material.dart';
import 'package:flutter_app/Global.dart';

class CallsPage extends StatefulWidget {
  const CallsPage({Key? key}) : super(key: key);

  @override
  State<CallsPage> createState() => _CallsPageState();
}

class _CallsPageState extends State<CallsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        padding: const EdgeInsets.only(bottom: 100),
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.grey[300],
                      backgroundImage:
                      NetworkImage(androidChats[i]["Img"].toString()),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${androidChats[i]["Name"]}',
                          style: Global.nameStyle,
                        ),
                        Text(
                          '${androidCalls[i]}',
                          style: Global.subNameStyle,
                        ),
                      ],
                    ),
                  ],
                ),
                const Icon(
                  Icons.call,
                  color: Color(0xff075e54),
                ),
              ],
            ),
          );
        },
        itemCount: androidChats.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add_call),
      ),
    );
  }
}