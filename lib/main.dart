import 'package:flutter/material.dart';

import 'package:flutter_app_template/root_page.dart';
import 'package:flutter_app_template/pages/test_page.dart';
import 'package:flutter_app_template/pages/login_page.dart';
import 'package:flutter_app_template/pages/home_page.dart';
import 'package:flutter_app_template/pages/web_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RootPage(),
      routes: pageRoutes(),
    );
  }

  Map<String, WidgetBuilder> pageRoutes() {
    return {
      'cgs/test': (BuildContext context) => TestPage(),
      'cgs/login': (BuildContext context) => LoginPage(),
      'cgs/home': (BuildContext context) => HomePage(),
      'cgs/web': (BuildContext context) => WebPage("http://www.baidu.com", "title"),
    };
  }
}







