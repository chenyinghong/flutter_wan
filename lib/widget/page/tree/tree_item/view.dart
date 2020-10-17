import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wan/widget/page/tree/tree_item/widget/tree_item_style.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(
    TreeItemState state, Dispatch dispatch, ViewService viewService) {
  return _body(state, dispatch);
}

//item布局总样式(处理点击效果,点击事件等)
Widget _body(state, dispatch) {
  return TreeItemStyle(
    data: state,
    onTap: () {
      dispatch(TreeItemActionCreator.toTreeDetail());
    },
  );
}
