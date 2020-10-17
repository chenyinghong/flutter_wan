import 'package:flutter/material.dart';
import 'package:flutter_wan/app/typedef/function.dart';
import 'package:flutter_wan/widget/page/main/state.dart';

class MainDrawer extends StatelessWidget {
  MainDrawer({
    this.data,
    this.onTap,
  });

  ///数据源
  final MainState data;

  ///监听点击的item
  final ParamSingleCallback<String> onTap;

  @override
  Widget build(BuildContext context) {
    return _drawer();
  }

  Widget _drawer() {
    return Drawer(
      child: Column(
        children: <Widget>[
          //顶部背景
          Container(child: Image.asset("images/ttxs.jpg")),

          //功能Item
          Expanded(child: functionItem()),
        ],
      ),
    );
  }

  Widget functionItem() {
    return ListView(
      children: data.drawerItems.map((e) {
        return InkWell(
          child: ListTile(
            leading: e.icon,
            title: Text(e.title),
          ),
          onTap: () {
            onTap(e.tag);
          },
        );
      }).toList(),
    );
  }
}