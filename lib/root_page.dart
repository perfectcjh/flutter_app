import 'package:flutter/material.dart';
import 'package:flutter_app_template/global/functions.dart';

import 'package:flutter_app_template/pages/home_page.dart';
import 'package:flutter_app_template/pages/mine_page.dart';
import 'package:flutter_app_template/pages/goods_page.dart';
import 'package:flutter_app_template'
    '/pages/activity_page.dart';

class RootPage extends StatefulWidget {
  @override
  createState() => new RootPageState();
}

class RootPageState extends State<RootPage> {
  int selectIndex = 0;
  var tabTitles = List<String>();
  var tabNormalImages = List<Image>();
  var tabSelectedImages = List<Image>();
  var pageList = [];

  @override
  Widget build(BuildContext context) {
    initData();
    return Scaffold(
      body: getTabPage(selectIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: getTabIcon(0), title: getTabText(0)),
          BottomNavigationBarItem(icon: getTabIcon(1), title: getTabText(1)),
          BottomNavigationBarItem(icon: getTabIcon(2), title: getTabText(2)),
          BottomNavigationBarItem(icon: getTabIcon(3), title: getTabText(3)),
        ],
        currentIndex: selectIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            selectIndex = index;
          });
        },
      ),
    );
  }

  void initData() {
    tabTitles = ['首页', '商品', '活动', '我的'];
    pageList = [HomePage(), GoodsPage(), ActivityPage(), MinePage()];

    var tabNormalImageNames = [
      'tabbar_home_normal.png',
      'tabbar_goods_normal.png',
      'tabbar_activity_normal.png',
      'tabbar_workbench_normal.png'
    ];
    var tabSelectedImageNames = [
      'tabbar_home_selected.png',
      'tabbar_goods_selected.png',
      'tabbar_activity_selected.png',
      'tabbar_workbench_selected.png'
    ];
    tabNormalImages = tabNormalImageNames.map((e) {
      return ImageManager.getTabImage(e);
    }).toList();
    tabSelectedImages = tabSelectedImageNames.map((e) {
      return ImageManager.getTabImage(e);
    }).toList();
  }

  Image getTabIcon(int index) {
    if (selectIndex == index) {
      return tabSelectedImages[index];
    } else {
      return tabNormalImages[index];
    }
  }

  Text getTabText(int index) {
    if (selectIndex == index) {
      return Text(tabTitles[index], style: TextStyle(fontSize: 10, color: ColorManager.tabSelected));
    } else {
      return Text(tabTitles[index], style: TextStyle(fontSize: 10, color: ColorManager.tabNormal));
    }
  }

  Widget getTabPage(int index) {
    return pageList[index];
  }
}
