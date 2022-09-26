import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

permission({required ic, required PermissionStatus satus}) {
  return Row(
    children: [
      Icon(ic),
      const Spacer(),
      (satus.isGranted)
          ? const Text("Permission Granted ")
          : const Text("Permission Denide  "),
    ],
  );
}

