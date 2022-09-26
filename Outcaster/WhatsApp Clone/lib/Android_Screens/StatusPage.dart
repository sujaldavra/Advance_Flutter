import 'package:flutter/material.dart';
import 'package:flutter_app/Global.dart';

class StatusPage extends StatefulWidget {
  const StatusPage({Key? key}) : super(key: key);

  @override
  State<StatusPage> createState() => _StatusPageState();
}

class _StatusPageState extends State<StatusPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.only(bottom: 100),
        itemBuilder: (context, i) {
          return Padding(
            padding:
                const EdgeInsets.only(top: 14, left: 14, right: 14, bottom: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    (i == 0)
                        ? Row(
                            children: [
                              CircleAvatar(
                                radius: 25,
                                backgroundColor: Colors.grey[300],
                                backgroundImage:
                                    NetworkImage('${androidStatus[i]["Img"]}'),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${androidStatus[i]["Name"]}',
                                    style: Global.nameStyle,
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    '${androidStatus[i]["Time"]}',
                                    style: Global.subNameStyle,
                                  ),
                                ],
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              Stack(
                                alignment: Alignment.center,
                                children: [
                                  const CircleAvatar(
                                    radius: 29,
                                    backgroundColor: Colors.green,
                                  ),
                                  const CircleAvatar(
                                    radius: 27,
                                    backgroundColor: Colors.white,
                                  ),
                                  CircleAvatar(
                                    radius: 25,
                                    backgroundColor: Colors.grey[300],
                                    backgroundImage: NetworkImage(
                                        '${androidStatus[i]["Img"]}'),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${androidStatus[i]["Name"]}',
                                    style: Global.nameStyle,
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    '${androidStatus[i]["Time"]}',
                                    style: Global.subNameStyle,
                                  ),
                                ],
                              ),
                            ],
                          ),
                  ],
                ),
                (i == 0)
                    ? const Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Text(
                          'Recent updates',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                      )
                    : Container(),
              ],
            ),
          );
        },
        itemCount: androidStatus.length,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
