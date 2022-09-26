import 'package:flutter/material.dart';

class ChatsDetailsPage extends StatefulWidget {
  const ChatsDetailsPage({Key? key}) : super(key: key);

  @override
  State<ChatsDetailsPage> createState() => _ChatsDetailsPageState();
}

class _ChatsDetailsPageState extends State<ChatsDetailsPage> {
  @override
  Widget build(BuildContext context) {
    dynamic res = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_rounded),
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey[300],
              backgroundImage: NetworkImage('${res["Img"]}'),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${res["Name"]}'),
                Text('last seen ${res["Time"]}',
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w400)),
              ],
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.video_call_rounded),
          ),
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.call),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Column(
        children: [
          const Spacer(),
          Row(
            children: [
              Container(
                height: 55,
                margin: const EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width * 0.78,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  children: const [
                    SizedBox(width: 5),
                    Text(
                      '🙂',
                      style: TextStyle(fontSize: 30),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Message',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey,
                      ),
                    ),
                    Spacer(),
                    Icon(
                      Icons.camera_alt,
                    ),
                    SizedBox(width: 20),
                  ],
                ),
              ),
              FloatingActionButton(
                onPressed: () {},
                child: const Icon(Icons.mic),
              )
            ],
          ),
        ],
      ),
    );
  }
}