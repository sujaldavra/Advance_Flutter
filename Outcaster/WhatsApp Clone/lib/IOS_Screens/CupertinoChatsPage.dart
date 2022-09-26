import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Global.dart';

class CupertinoChatsPage extends StatefulWidget {
  const CupertinoChatsPage({Key? key}) : super(key: key);

  @override
  State<CupertinoChatsPage> createState() => _CupertinoChatsPageState();
}

class _CupertinoChatsPageState extends State<CupertinoChatsPage> {
  get cupertinoMainColor => null;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.grey[50],
      navigationBar: CupertinoNavigationBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Text(
            'Edit',
            style: Global.cupertinoBlueText,
          ),
        ),
        trailing: const Icon(
          CupertinoIcons.add,
          color: Colors.blue,
          size: 25,
        ),
        middle: const Text(
          'Chats',
          style: TextStyle(fontSize: 19),
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey, width: 0.3)),
              height: MediaQuery.of(context).size.height * 0.75,
              child: ListView.separated(
                padding: const EdgeInsets.only(
                    right: 20, left: 15, top: 10, bottom: 50),
                itemBuilder: (context, i) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 23,
                            backgroundColor: Colors.grey[300],
                            backgroundImage:
                            NetworkImage('${androidChats[i]["Img"]}'),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${androidChats[i]["Name"]}',
                                style: Global.cupertinoName,
                              ),
                              const SizedBox(height: 3),
                              Text(
                                '${iOSChats[i]["Msg"]}',
                                style: Global.cupertinoTime,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text(
                            '${iOSChats[i]["Time"]}',
                            style: Global.cupertinoTime,
                          ),
                          Container(height: 20),
                        ],
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, i) {
                  return Divider(
                    color: Colors.grey.shade500,
                    height: 30,
                    indent: 60,
                  );
                },
                itemCount: iOSCalls.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}