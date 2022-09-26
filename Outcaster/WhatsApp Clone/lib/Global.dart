import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Global {
  static bool isIOS = false;
  static Color cupertinoAppColor = CupertinoColors.systemBlue;

  static TextStyle nameStyle = const TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static TextStyle subNameStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: Colors.grey,
  );

  static TextStyle timeStyle = const TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: Colors.grey,
  );

  static TextStyle cupertinoHeadings = const TextStyle(
    fontSize: 35,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static TextStyle cupertinoBlueText = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w400,
    color: Colors.blue,
  );

  static TextStyle cupertinoName = const TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );

  static TextStyle cupertinoTime = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Colors.grey,
  );
}

List<Map> androidChats = [
  {
    "Name": 'Aryan',
    "SubTitle": 'Photo',
    "Img":
        'https://images.unsplash.com/photo-1581803118522-7b72a50f7e9f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
    "Time": '10:45 pm',
  },
  {
    "Name": 'Jeet',
    "SubTitle": 'Video',
    "Img":
        'https://images.unsplash.com/photo-1496345875659-11f7dd282d1d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    "Time": '1:05 pm',
  },
  {
    "Name": 'Paras',
    "SubTitle": 'Ok',
    "Img":
        'https://images.unsplash.com/photo-1615109398623-88346a601842?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fG1hbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    "Time": '6:39 PM',
  },
  {
    "Name": 'Viral',
    "SubTitle": 'Nice',
    "Img":
        'https://images.unsplash.com/photo-1600486913747-55e5470d6f40?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fG1hbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    "Time": '2:45 PM',
  },
  {
    "Name": 'Rajan',
    "SubTitle": 'Hey',
    "Img":
        'https://images.unsplash.com/photo-1537511446984-935f663eb1f4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjR8fG1hbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
    "Time": '8:33 PM',
  },
];

List<Map> androidStatus = [
  {
    "Name": 'My status',
    "Time": 'Tap to add status',
    "Img":
        'https://images.unsplash.com/photo-1662913497683-0934ae1958b9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDZ8NnNNVmpUTFNrZVF8fGVufDB8fHx8&auto=format&fit=crop&w=500&q=60',
  },
  {
    "Name": 'Aryan',
    "Time": 'Today, 7:47 am',
    "Img":
        'https://images.unsplash.com/photo-1662763215880-e8b93d5ff38c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
  },
  {
    "Name": 'Jeet',
    "Time": 'Today, 5:17 am',
    "Img":
        'https://images.unsplash.com/photo-1662770603902-f92efce0aa2b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80',
  },
  {
    "Name": 'Paras',
    "Time": 'Today, 5:03 am',
    "Img":
        'https://images.unsplash.com/photo-1662659827439-8c17644efb00?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
  },
  {
    "Name": 'Vivek',
    "Time": 'Today, 4:25 am',
    "Img":
        'https://images.unsplash.com/photo-1662627015683-1bb877c0808c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
  },
  {
    "Name": 'Viral',
    "Time": 'Today, 10:45 pm',
    "Img":
        'https://images.unsplash.com/photo-1662662049081-be6d261348ed?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80',
  },
  {
    "Name": 'Rajan',
    "Time": 'Yesterday, 7:23 pm',
    "Img":
        'https://images.unsplash.com/photo-1662721111685-5b1d2c0d46ec?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
  },
];

List androidCalls = [
  "4 April, 11:08 am",
  "3 June, 10:03 am",
  "3 Feb, 10:03 am",
  "3 April, 10:03 am",
  "3 Feb, 12:03 pm",
  "3 March, 08:03 am",
  "22 March, 11:03 am",
];

List<Map> iOSCalls = [
  {
    "Name": 'Aryan',
    "Date": '1/02/22',
    "Status": 'Outgoing',
    "IsCall": true,
  },
  {
    "Name": 'Jeet',
    "Date": '3/02/22',
    "Status": 'Incoming',
    "IsCall": true,
  },
  {
    "Name": 'Paras',
    "Date": '6/02/22',
    "Status": 'Outgoing',
    "IsCall": true,
  },
  {
    "Name": 'Viral',
    "Date": '10/02/22',
    "Status": 'Missed',
    "IsCall": true,
  },
  {
    "Name": 'Rajan',
    "Date": '14/02/22',
    "Status": 'Outgoing',
    "IsCall": true,
  },
];

List<Map> iOSChats = [
  {
    "Msg": 'Hey',
    "Time": '7:55 PM',
  },
  {
    "Msg": 'Photo',
    "Time": '8:20 AM',
  },
  {
    "Msg": 'Video ',
    "Time": '2:12 AM',
  },
  {
    "Msg": 'typing...',
    "Time": '06:30 AM',
  },
  {
    "Msg": 'Ok',
    "Time": '05:22 AM',
  },
];
