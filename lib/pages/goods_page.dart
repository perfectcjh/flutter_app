import 'package:flutter/material.dart';
import 'package:flutter_app_template/global/functions.dart';

class GoodsPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GoodsPageState();
  }
}

class GoodsPageState extends State<GoodsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商品'),
        backgroundColor: ColorManager.navColor,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.share), onPressed: () {}),
        ],
      ),
    );
  }
}
