import 'package:flutter/material.dart';

custom(name, data) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    child: Column(
      children: [
        Row(
          children: [
            Text(
              "$name",
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Text(
              "$data",
              style: const TextStyle(
                fontSize: 17,
                color: Colors.black54,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        const Divider(
          height: 20,
          color: Colors.black54,
        ),
      ],
    ),
  );
}
