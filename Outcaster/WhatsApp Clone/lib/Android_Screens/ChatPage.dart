import 'package:flutter/material.dart';
import 'package:flutter_app/Global.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemBuilder: (context, i) {
          return InkWell(
            onTap: () {
              Navigator.of(context)
                  .pushNamed('ChatsDetailsPage', arguments: androidChats[i]);
            },
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.grey[300],
                        backgroundImage:
                            NetworkImage('${androidChats[i]["Img"]}'),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${androidChats[i]["Name"]}',
                            style: Global.nameStyle,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            '${androidChats[i]["SubTitle"]}',
                            style: Global.subNameStyle,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${androidChats[i]["Time"]}',
                        style: Global.timeStyle,
                      ),
                      const SizedBox(
                        height: 29,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
        itemCount: androidChats.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.chat),
      ),
    );
  }
}
