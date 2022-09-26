import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/Golobal.dart';

void main() {
  runApp(const Settings_Ui());
}

class Settings_Ui extends StatefulWidget {
  const Settings_Ui({Key? key}) : super(key: key);

  @override
  State<Settings_Ui> createState() => _Settings_UiState();
}

class _Settings_UiState extends State<Settings_Ui> {
  TextStyle titelStyle = const TextStyle(
    fontSize: 18,
    color: Colors.red,
    fontWeight: FontWeight.w800,
  );

  TextStyle IOSstyle1 = const TextStyle(
    color: Colors.black,
    fontSize: 20,
  );

  TextStyle IOSstyle2 = const TextStyle(
    color: Colors.grey,
    fontSize: 20,
  );

  @override
  Widget build(BuildContext context) {
    return (Global.isIOS == false)
        ? MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              appBar: AppBar(
                title: const Text(
                  "Setting UI",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                actions: [
                  Switch(
                      value: Global.isIOS,
                      onChanged: (val) {
                        setState(() {
                          Global.isIOS = val;
                        });
                      })
                ],
                backgroundColor: Colors.red,
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 5),
                    Container(
                      padding: const EdgeInsets.all(15),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Common",
                        style: titelStyle,
                      ),
                    ),
                    Container(
                      child: ListTile(
                        leading: IconButton(
                          icon: const Icon(
                            Icons.language,
                          ),
                          onPressed: () {},
                        ),
                        title: const Text("Language"),
                        subtitle: const Text("English"),
                      ),
                    ),
                    Divider(),
                    Container(
                      child: ListTile(
                        leading: IconButton(
                          icon: const Icon(
                            Icons.cloud_outlined,
                          ),
                          onPressed: () {},
                        ),
                        title: const Text("Environment"),
                        subtitle: const Text("Production"),
                      ),
                    ),
// Account
                    Container(
                      padding: const EdgeInsets.all(15),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Account",
                        style: titelStyle,
                      ),
                    ),
                    Container(
                      child: ListTile(
                        leading: IconButton(
                          icon: const Icon(
                            Icons.phone,
                          ),
                          onPressed: () {},
                        ),
                        title: const Text("Phone Number"),
                      ),
                    ),
                    Divider(),
                    Container(
                      child: ListTile(
                        leading: IconButton(
                          icon: const Icon(
                            Icons.email,
                          ),
                          onPressed: () {},
                        ),
                        title: const Text("Email"),
                      ),
                    ),
                    Divider(),
                    Container(
                      child: ListTile(
                        leading: IconButton(
                          icon: const Icon(
                            Icons.logout,
                          ),
                          onPressed: () {},
                        ),
                        title: const Text("Sign Out"),
                      ),
                    ),
                    // Security
                    Container(
                      padding: const EdgeInsets.all(15),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Security",
                        style: titelStyle,
                      ),
                    ),
                    Container(
                      child: ListTile(
                        leading: IconButton(
                          icon: const Icon(
                            Icons.phonelink_lock_outlined,
                          ),
                          onPressed: () {},
                        ),
                        title: const Text("Lock App in Background"),
                        trailing: Switch(
                          activeColor: Colors.red,
                          onChanged: (val) {
                            setState(() {
                              Global.lock = val;
                            });
                          },
                          value: Global.lock,
                        ),
                      ),
                    ),
                    Divider(),
                    Container(
                      child: ListTile(
                        leading: IconButton(
                          icon: const Icon(
                            Icons.fingerprint,
                          ),
                          onPressed: () {},
                        ),
                        title: const Text("Use Fingerprint"),
                        trailing: Switch(
                          activeColor: Colors.red,
                          onChanged: (val) {
                            setState(() {
                              Global.fingerprint = val;
                            });
                          },
                          value: Global.fingerprint,
                        ),
                      ),
                    ),
                    Divider(),
                    Container(
                      child: ListTile(
                        leading: IconButton(
                          icon: const Icon(
                            Icons.lock,
                          ),
                          onPressed: () {},
                        ),
                        title: const Text("Change Password"),
                        trailing: Switch(
                          activeColor: Colors.red,
                          onChanged: (val) {
                            setState(() {
                              Global.password = val;
                            });
                          },
                          value: Global.password,
                        ),
                      ),
                    ),
// Misc
                    Container(
                      padding: const EdgeInsets.all(15),
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Misc",
                        style: titelStyle,
                      ),
                    ),
                    Container(
                      child: ListTile(
                        leading: IconButton(
                          icon: const Icon(
                            Icons.file_open_outlined,
                          ),
                          onPressed: () {},
                        ),
                        title: const Text("Terms of Service"),
                      ),
                    ),
                    Divider(),
                    Container(
                      child: ListTile(
                        leading: IconButton(
                          icon: const Icon(
                            Icons.file_copy_outlined,
                          ),
                          onPressed: () {},
                        ),
                        title: const Text("Open source license"),
                      ),
                    ),
                  ],
                ),
              ),
            ))
        : CupertinoApp(
            debugShowCheckedModeBanner: false,
            home: CupertinoPageScaffold(
              navigationBar: CupertinoNavigationBar(
                backgroundColor: CupertinoColors.destructiveRed,
                trailing: CupertinoSwitch(
                  value: Global.isIOS,
                  activeColor: Colors.green,
                  onChanged: (val) {
                    setState(() {
                      Global.isIOS = val;
                    });
                  },
                ),
                middle: const Text(
                  "Settings UI",
                  style: TextStyle(
                    color: CupertinoColors.white,
                    //    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              child: SingleChildScrollView(
                child: Container(
                  //alignment: Alignment.center,
                  padding: EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Common",
                        style: IOSstyle2,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        color: CupertinoColors.extraLightBackgroundGray,
                        padding: const EdgeInsets.only(
                            left: 10, top: 10, bottom: 10),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.language,
                              color: CupertinoColors.systemGrey2,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Language",
                              style: IOSstyle1,
                            ),
                            const Spacer(),
                            Text(
                              "English",
                              style: IOSstyle2,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            const Icon(
                              CupertinoIcons.forward,
                              color: CupertinoColors.systemGrey2,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1,
                      ),
                      Container(
                        color: CupertinoColors.extraLightBackgroundGray,
                        padding: const EdgeInsets.only(
                            left: 10, top: 10, bottom: 10),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.cloud,
                              color: CupertinoColors.systemGrey2,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Environment",
                              style: IOSstyle1,
                            ),
                            const Spacer(),
                            Text(
                              "Production",
                              style: IOSstyle2,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            const Icon(
                              CupertinoIcons.forward,
                              color: CupertinoColors.systemGrey2,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          "Account",
                          style: IOSstyle2,
                        ),
                      ),
                      Container(
                        color: CupertinoColors.extraLightBackgroundGray,
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(top: 1),
                        child: Row(
                          children: [
                            const Icon(
                              CupertinoIcons.phone_fill,
                              color: CupertinoColors.systemGrey2,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Phone number",
                              style: IOSstyle1,
                            ),
                            const Spacer(),
                            const Icon(
                              CupertinoIcons.forward,
                              color: CupertinoColors.systemGrey2,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: CupertinoColors.extraLightBackgroundGray,
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(top: 1),
                        child: Row(
                          children: [
                            const Icon(
                              CupertinoIcons.mail,
                              color: CupertinoColors.systemGrey2,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Email",
                              style: IOSstyle1,
                            ),
                            const Spacer(),
                            const Icon(
                              CupertinoIcons.forward,
                              color: CupertinoColors.systemGrey2,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: CupertinoColors.extraLightBackgroundGray,
                        margin: const EdgeInsets.only(top: 1),
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.logout,
                              color: CupertinoColors.systemGrey2,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Sign out",
                              style: IOSstyle1,
                            ),
                            const Spacer(),
                            const Icon(
                              CupertinoIcons.forward,
                              color: CupertinoColors.systemGrey2,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 10, top: 15, bottom: 5),
                        child: Text(
                          "Security",
                          style: IOSstyle2,
                        ),
                      ),
                      Container(
                        color: CupertinoColors.extraLightBackgroundGray,
                        margin: const EdgeInsets.only(top: 1),
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.phonelink_lock_outlined,
                              color: CupertinoColors.systemGrey2,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Lock app in background",
                              style: IOSstyle1,
                            ),
                            const Spacer(),
                            CupertinoSwitch(
                                value: Global.lock,
                                activeColor: Colors.red,
                                onChanged: (val) {
                                  setState(() {
                                    Global.lock = val;
                                  });
                                }),
                          ],
                        ),
                      ),
                      Container(
                        color: CupertinoColors.extraLightBackgroundGray,
                        margin: const EdgeInsets.only(top: 1),
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.fingerprint,
                              color: CupertinoColors.systemGrey2,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Use fingerprint",
                              style: IOSstyle1,
                            ),
                            const Spacer(),
                            CupertinoSwitch(
                                value: Global.fingerprint,
                                activeColor: Colors.red,
                                onChanged: (val) {
                                  setState(() {
                                    Global.fingerprint = val;
                                  });
                                }),
                          ],
                        ),
                      ),
                      Container(
                        color: CupertinoColors.extraLightBackgroundGray,
                        margin: const EdgeInsets.only(top: 1),
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.lock,
                              color: CupertinoColors.systemGrey2,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Change password",
                              style: IOSstyle1,
                            ),
                            const Spacer(),
                            CupertinoSwitch(
                                value: Global.password,
                                activeColor: Colors.red,
                                onChanged: (val) {
                                  setState(() {
                                    Global.password = val;
                                  });
                                }),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Text(
                          "Misc",
                          style: IOSstyle2,
                        ),
                      ),
                      Container(
                        color: CupertinoColors.extraLightBackgroundGray,
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(top: 1),
                        child: Row(
                          children: [
                            const Icon(
                              CupertinoIcons.doc_text,
                              color: CupertinoColors.systemGrey2,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Terms of Service",
                              style: IOSstyle1,
                            ),
                            const Spacer(),
                            const Icon(
                              CupertinoIcons.forward,
                              color: CupertinoColors.systemGrey2,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        color: CupertinoColors.extraLightBackgroundGray,
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(top: 1),
                        child: Row(
                          children: [
                            const Icon(
                              CupertinoIcons.book,
                              color: CupertinoColors.systemGrey2,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Open source license",
                              style: IOSstyle1,
                            ),
                            const Spacer(),
                            const Icon(
                              CupertinoIcons.forward,
                              color: CupertinoColors.systemGrey2,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
