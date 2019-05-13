import 'package:flutter/material.dart';
import 'package:flutter_app_template/global/functions.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ActivityPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return ActivityPageState();
  }
}

class ActivityPageState extends State<ActivityPage> {

    List<String> _items = <String>[
    'test',
    'login',
    'home',
    'test1',
    'login1',
    'home1',
    'test2',
    'login2',
    'home3',
    'test3',
    'login3',
    'home4',
    'test4',
    'login5',
    'home5',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('活动'),
        backgroundColor: ColorManager.navColor,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.share), onPressed: () {}),
        ],
      ),
      body: SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        onRefresh: _onRefresh,
        controller: _refreshController,
        headerBuilder: _refreshHeader,
        footerBuilder: _refreshFooter,
        child: ListView.builder(
            itemCount: _items.length,
            itemExtent: 60.0,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(_items[index]),
                onTap: () {
                  String pageName = _items[index];
                  Navigator.pushNamed(context, 'cgs/' + pageName);
                },
              );
            }),
      ),
    );
  }

  RefreshController _refreshController = RefreshController();

  void _onRefresh(bool up) async {
    await Future.delayed(const Duration(milliseconds: 2000));
    if (up) {
      _refreshController.sendBack(up, RefreshStatus.completed);
      print('refresh');
    } else {
      _refreshController.sendBack(up, RefreshStatus.idle);
      print('loadMore...');
    }
    setState(() {});
  }

  Widget _refreshHeader(BuildContext context, RefreshStatus mode) {
    return ClassicHeader(
      mode: mode,
      height: 45.0,
      idleText: '下拉刷新',
      releaseText: '松开刷新',
      refreshingText: '正在刷新',
      completeText: '刷新完成',
      failedText: '刷新失败',
    );
  }

  Widget _refreshFooter(BuildContext context, RefreshStatus mode) {
    return ClassicFooter(
      mode: mode,
      height: 45.0,
      idleText: '上拉加载',
      releaseText: '松开加载',
      refreshingText: '正在加载',
      completeText: '加载完成',
      failedText: '加载失败',
      noDataText: '没有更多啦',
    );
  }

}