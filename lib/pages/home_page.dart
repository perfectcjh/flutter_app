import 'package:flutter/material.dart';
import 'package:flutter_app_template/global/functions.dart';
import 'package:flutter_app_template/pages/test_page.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:english_words/english_words.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {

  TabController _tabController;
  List<String> tabs = ["首页", "视频", "小视频", "我的"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
        backgroundColor: ColorManager.navColor,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.share), onPressed: () {
            Navigator.pushNamed(context, 'cgs/test');
          }),
        ],
        bottom: TabBar(
          tabs: tabs.map((e) {
            return Tab(text: e);
          }).toList(),
          controller: _tabController,
        ),
      ),
      body: TabBarView(
          controller: _tabController,
          children: tabs.map((e) {
            return Container(
              alignment: Alignment.center,
              child: Text(e, textScaleFactor: 5),
            );
          }).toList()),
    );
  }
}

