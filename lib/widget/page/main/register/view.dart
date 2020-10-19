import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wan/widget/page/main/register/widget/register_view.dart';

import 'action.dart';
import 'state.dart';

Widget buildView(RegisterState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    appBar: AppBar(title: Text('登录')),
    body: _body(state, dispatch),
  );
}


Widget _body(RegisterState state, Dispatch dispatch) {
  return SingleChildScrollView(
    child: RegisterView(
      onUserName: (String msg) {
        //用户名
      },
      onPassword: (String msg) {
        //密码
      },
      onRePassword: (String msg) {
        //注册
      },
      onLogin: () {
        //登录

      },
    ),
  );
}