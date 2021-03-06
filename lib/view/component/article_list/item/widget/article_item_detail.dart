import 'package:flutter/material.dart';
import 'package:flutter_wan/app/typedef/function.dart';
import 'package:flutter_wan/app/utils/ui/ui_adapter.dart';

import '../state.dart';

class ArticleItemDetail extends StatelessWidget {
  ArticleItemDetail({
    this.data,
    this.onTap,
  });

  ///数据源
  final ArticleItemState data;

  ///点击事件
  final ParamVoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return _item();
  }

  ///item主体
  Widget _item() {
    return _itemBg(
      child: Column(
        children: <Widget>[
          //第一层: 技术分类
          _buildSort(),

          //第二层: 标题
          _buildTitle(),

          //第三层: 标题底下时间,作者
          _timeAndAuthor(),
        ],
      ),
    );
  }

  ///整个item布局背景
  Widget _itemBg({Widget child}) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(auto(20)),
      ),
      margin: EdgeInsets.all(5),
      child: InkWell(
        //点击效果
        borderRadius: BorderRadius.circular(auto(20)),
        child: child,
        onTap: onTap,
      ),
    );
  }

  Widget _timeAndAuthor() {
    return Container(
      margin: EdgeInsets.only(
          left: auto(25), right: auto(25), top: auto(20), bottom: auto(30)),
      child: Stack(
        children: <Widget>[
          Container(
            child: Text(
                '作者: ${data.itemDetail.author == "" ? "未知" : data.itemDetail.author}'),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text('时间: '),
                Text(data.itemDetail.niceShareDate),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(left: auto(25), right: auto(25), top: auto(20)),
      child: Text(data.itemDetail.title, style: TextStyle(fontSize: setSp(32))),
    );
  }

  Widget _buildSort() {
    return Container(
      margin: EdgeInsets.only(left: auto(25), top: auto(30), right: auto(25)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          //写俩层，方便以后要处理字体颜色
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: '分类：',
                style: TextStyle(color: Colors.black),
              ),
              TextSpan(
                text:
                    '${data.itemDetail.superChapterName}/${data.itemDetail.chapterName}',
                style: TextStyle(color: Colors.lightBlueAccent),
              )
            ]),
          ),

          //显示收藏
          Icon(
            Icons.favorite,
            color:
                data.itemDetail.collect ? Colors.deepOrangeAccent : Colors.grey,
          ),
        ],
      ),
    );
  }
}
