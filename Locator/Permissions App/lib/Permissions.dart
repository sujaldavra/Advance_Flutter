import 'package:flutter/material.dart';
import 'package:flutter_app/Permissions_Status.dart';
import 'package:permission_handler/permission_handler.dart';

class Permissions extends StatefulWidget {
  const Permissions({Key? key}) : super(key: key);

  @override
  State<Permissions> createState() => _PermissionsState();
}

class _PermissionsState extends State<Permissions> {
  @override
  build(BuildContext context) {
    PermissionStatus camera = PermissionStatus.denied;
    PermissionStatus mic = PermissionStatus.denied;
    PermissionStatus location = PermissionStatus.denied;
    PermissionStatus phone = PermissionStatus.denied;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Permission App"),
        elevation: 0,
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              await openAppSettings();
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt_outlined),
              title: const Text("Camera"),
              onTap: () async {
                camera = await Permission.camera.request();

                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  duration: const Duration(seconds: 1),
                  content: Text("${camera}"),
                  backgroundColor:
                      (camera.isGranted) ? Colors.green : Colors.red,
                  behavior: SnackBarBehavior.floating,
                ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.location_on_outlined),
              title: const Text("Location"),
              onTap: () async {
                location = await Permission.location.request();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  duration: const Duration(seconds: 1),
                  content: Text("${location}"),
                  backgroundColor:
                      (location.isGranted) ? Colors.green : Colors.red,
                  behavior: SnackBarBehavior.floating,
                ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.mic),
              title: const Text("Microphone"),
              onTap: () async {
                mic = await Permission.microphone.request();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  duration: const Duration(seconds: 1),
                  content: Text("${mic}"),
                  backgroundColor: (mic.isGranted) ? Colors.green : Colors.red,
                  behavior: SnackBarBehavior.floating,
                ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text("Phone"),
              onTap: () async {
                phone = await Permission.phone.request();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    duration: const Duration(seconds: 1),
                    content: Text("${phone}"),
                    backgroundColor:
                        (phone.isGranted) ? Colors.green : Colors.red,
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: const Icon(Icons.done),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Center(
                child: Text("Permission Status"),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  permission(ic: Icons.location_on_outlined, satus: location),
                  const SizedBox(
                    height: 10,
                  ),
                  permission(ic: Icons.mic_none_rounded, satus: mic),
                  const SizedBox(
                    height: 10,
                  ),
                  permission(ic: Icons.phone, satus: phone),
                  const SizedBox(
                    height: 10,
                  ),
                  permission(ic: Icons.camera_alt, satus: camera),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
