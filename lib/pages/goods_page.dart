import 'package:flutter/material.dart';
import 'package:flutter_app_template/global/functions.dart';

class GoodsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GoodsPageState();
  }
}

class GoodsPageState extends State<GoodsPage> with SingleTickerProviderStateMixin {

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
        title: Text('商品'),
        backgroundColor: ColorManager.navColor,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.share), onPressed: () {
            Navigator.pushNamed(context, 'cgs/test');
          }),
          IconButton(icon: Icon(Icons.share), onPressed: () {
            Navigator.pushNamed(context, 'cgs/web');
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
