import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Webview extends StatefulWidget {
  const Webview({super.key, required this.newsLink});
  final String? newsLink;

  @override
  State<Webview> createState() => _WebviewState();
}

class _WebviewState extends State<Webview> {
  late final controller;
  var lodingPercentage = 0;

  @override
  void initState() {
    super.initState();
        if (widget.newsLink != null) {
      controller = WebViewController()
        ..setJavaScriptMode(JavaScriptMode.disabled)
        ..loadRequest(
            method: LoadRequestMethod.get, Uri.parse(widget.newsLink!))
        ..enableZoom(true)
        ..setNavigationDelegate(NavigationDelegate(
          onPageStarted: (url) {
            setState(() {
              lodingPercentage = 0;
            });
          },
          onProgress: (progress) {
            setState(() {
              lodingPercentage = progress;
            });
          },
          onPageFinished: (url) {
            setState(() {
              lodingPercentage = 100;
            });
          },
        ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "News",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
            ),
            Text("Cloud",
                style: TextStyle(
                    color: Colors.orange, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
      body: Stack(
        children: [
          widget.newsLink != null
              ? WebViewWidget(controller: controller)
              : Center(
                  child: Text(
                    "URL not Found !",
                    style: TextStyle(fontSize: 45),
                  ),
                ),
                if(lodingPercentage < 100) LinearProgressIndicator(color: Colors.green, value: lodingPercentage/100,)
        ],
      ),
    );
  }
}
