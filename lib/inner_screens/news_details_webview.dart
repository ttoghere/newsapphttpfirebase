import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:newsapphttpfirebase/widgets/horizontal_spacing.dart';
import 'package:newsapphttpfirebase/widgets/vertical_spacing.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../services/utils.dart';

class NewsDetailsWebView extends StatefulWidget {
  static const routeName = "/newsdetailsscreen";
  const NewsDetailsWebView({Key? key}) : super(key: key);

  @override
  State<NewsDetailsWebView> createState() => _NewsDetailsWebViewState();
}

class _NewsDetailsWebViewState extends State<NewsDetailsWebView> {
  late WebViewController _webViewController;
  double _progress = 0.0;
  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(_url))) {
      throw 'Could not launch $_url';
    }
  }

  Future<void> errorDialog({required String errorMessage}) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(
              IconlyBold.danger,
              color: Colors.red[900]!,
            ),
            HorizontalSpacing(width: 8, child: Container()),
            const Text("An Error Occured"),
          ],
        ),
        content: Text(
          errorMessage,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        actions: [
          ElevatedButton(
            onPressed: () {},
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  final String _url =
      "https://techcrunch.com/2022/06/17/marc-lores-food-delivery-startup-wonder-raises-350m-3-5b-valuation/";
  Future<void> _showModalBottomSheetFCT() async {
    await showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (context) => Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            VerticalSpacing(height: 20, child: Container()),
            Center(
              child: Container(
                height: 5,
                width: 35,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
            VerticalSpacing(height: 20, child: Container()),
            const Text(
              "More Options",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            VerticalSpacing(
              height: 20,
              child: Container(),
            ),
            const Divider(
              thickness: 3,
              color: Colors.black,
            ),
            VerticalSpacing(
              height: 20,
              child: Container(),
            ),
            ListTile(
              leading: Icon(
                Icons.share,
                color: Colors.grey[700],
              ),
              title: const Text("Share"),
              onTap: () async {
                try {
                  await Share.share("URL",
                      subject: "Linked in profilime bakabilirsiniz");
                } catch (error) {
                  log(error.toString());
                }
              },
            ),
            ListTile(
              leading: Icon(
                Icons.web,
                color: Colors.grey[700],
              ),
              title: const Text("Open in browser"),
              onTap: () async {
                await _launchUrl();
              },
            ),
            ListTile(
              leading: Icon(
                Icons.refresh,
                color: Colors.grey[700],
              ),
              title: const Text("Refresh"),
              onTap: () async {
                await _webViewController
                    .reload()
                    .then((value) => Navigator.of(context).pop());
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Color color = Utils(context: context).getColor;
    return WillPopScope(
      onWillPop: () async {
        if (await _webViewController.canGoBack()) {
          _webViewController.goBack();
          // stay inside
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(IconlyLight.arrowLeft2)),
            iconTheme: IconThemeData(color: color),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            centerTitle: true,
            title: Text(
              "URL",
              style: TextStyle(color: color),
            ),
            actions: [
              IconButton(
                onPressed: () async {
                  await _showModalBottomSheetFCT();
                },
                icon: const Icon(
                  Icons.more_horiz,
                ),
              ),
            ]),
        body: Column(
          children: [
            LinearProgressIndicator(
              value: _progress,
              color: _progress == 1.0 ? Colors.transparent : Colors.blue,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            ),
            Expanded(
              child: WebView(
                initialUrl:
                    "https://techcrunch.com/2022/06/17/marc-lores-food-delivery-startup-wonder-raises-350m-3-5b-valuation/",
                zoomEnabled: true,
                onProgress: (progress) {
                  setState(() {
                    _progress = progress / 100;
                  });
                },
                onWebViewCreated: (controller) {
                  _webViewController = controller;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
