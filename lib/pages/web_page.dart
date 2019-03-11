import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebPage extends StatefulWidget {
  String title;
  String urlStr;

  WebPage(this.urlStr, this.title);

  @override
  State<StatefulWidget> createState() {
    return _WebPageState(urlStr, title);
  }
}

class _WebPageState extends State<WebPage> {
  String title;
  String urlStr;

  _WebPageState(this.urlStr, this.title);

  @override
  Widget build(BuildContext context) {
    print(urlStr);
    return WebviewScaffold(
      url: urlStr,
      appBar: AppBar(
        title: Text(title),
      ),
      withZoom: false,
      withLocalStorage: true,
      withJavascript: true,
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
