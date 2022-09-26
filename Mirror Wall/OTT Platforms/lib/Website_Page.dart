import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_app/Global.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class Website_Page extends StatefulWidget {
  const Website_Page({Key? key}) : super(key: key);

  @override
  State<Website_Page> createState() => _Website_PageState();
}

class _Website_PageState extends State<Website_Page> {
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;

  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  late PullToRefreshController pullToRefreshController;
  String url = "";
  final urlController = TextEditingController();

  @override
  void initState() {
    super.initState();

    pullToRefreshController = PullToRefreshController(
      options: PullToRefreshOptions(
        color: Colors.black,
      ),
      onRefresh: () async {
        if (Platform.isAndroid) {
          webViewController?.reload();
        } else if (Platform.isIOS) {
          webViewController?.loadUrl(
              urlRequest: URLRequest(url: await webViewController?.getUrl()));
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "${Global.Currentwebsite["Name"]}",
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.bookmark_border,
              color: Colors.black,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext dialogContext) {
                  return AlertDialog(
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    title: const Center(
                        child: Text(
                      'All Bookmarks',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    )),
                    content: SizedBox(
                      height: MediaQuery.of(context).size.width * 0.75,
                      width: MediaQuery.of(context).size.width * 0.75,
                      child: ListView.separated(
                        itemCount: Global.BookMarks.length,
                        itemBuilder: (context, i) {
                          return ListTile(
                            onTap: () {
                              Navigator.of(context).pop();
                              Global.Currentwebsite["Website"] =
                                  Global.BookMarks[i];
                              Navigator.of(context).pushNamed("Website_page");
                            },
                            title: Text(
                              Global.BookMarks[i],
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(color: Colors.black),
                            ),
                          );
                        },
                        separatorBuilder: (context, i) {
                          return const Divider(
                            color: Colors.black,
                            endIndent: 30,
                            indent: 30,
                          );
                        },
                      ),
                    ),
                  );
                },
              );
            },
          ),
          const SizedBox(
            width: 15,
          )
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            InAppWebView(
              key: webViewKey,
              initialUrlRequest: URLRequest(
                url: Uri.parse("${Global.Currentwebsite["Website"]}"),
              ),
              initialOptions: options,
              pullToRefreshController: pullToRefreshController,
              onWebViewCreated: (controller) {
                webViewController = controller;
              },
              onLoadStop: (controller, url) async {
                pullToRefreshController.endRefreshing();
                setState(() {
                  this.url = url.toString();
                  urlController.text = this.url;
                });
              },
            ),
            Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    backgroundColor: Colors.black,
                    onPressed: () {
                      webViewController?.goBack();
                    },
                    mini: true,
                    child: const Icon(Icons.arrow_back_ios_new_outlined),
                  ),
                  FloatingActionButton(
                    backgroundColor: Colors.black,
                    onPressed: () {
                      webViewController?.loadUrl(
                        urlRequest: URLRequest(
                          url: Uri.parse(Global.Currentwebsite["Website"]),
                        ),
                      );
                    },
                    mini: true,
                    child: const Icon(Icons.home),
                  ),
                  FloatingActionButton(
                    backgroundColor: Colors.black,
                    onPressed: () {
                      webViewController?.reload();
                    },
                    mini: true,
                    child: const Icon(Icons.refresh),
                  ),
                  FloatingActionButton(
                    backgroundColor: Colors.black,
                    onPressed: () {
                      webViewController?.goForward();
                    },
                    mini: true,
                    child: const Icon(Icons.arrow_forward_ios_sharp),
                  ),
                  FloatingActionButton(
                    backgroundColor: Colors.black,
                    onPressed: () {
                      Global.BookMarks.add(url);
                      Global.BookMarks = Global.BookMarks.toSet().toList();
                    },
                    mini: true,
                    child: const Icon(Icons.bookmark_add_outlined),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
