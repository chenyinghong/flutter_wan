import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wan/app/typedef/function.dart';
import 'package:flutter_wan/app/utils/ui/ui_adapter.dart';

class LoginView extends StatelessWidget {
  LoginView({
    this.onLogin,
    this.onPassword,
    this.onRegister,
    this.onUserName,
  });

  ///监听输入用户名信息
  final ParamSingleCallback<String> onUserName;

  ///监听输入密码信息
  final ParamSingleCallback<String> onPassword;

  ///点击注册回调
  final ParamVoidCallback onRegister;

  ///点击登录回调
  final ParamVoidCallback onLogin;

  @override
  Widget build(BuildContext context) {
    return _login();
  }

  Widget _login() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        //用户名
        _buildUserName(),

        //密码
        _buildPassword(),

        //注册
        _buildRegister(),

        //登录按钮
        _buildLogin(),
      ],
    );
  }

  Widget _buildLogin() {
    return Container(
      height: auto(100),
      width: ScreenUtil.screenWidth,
      margin: EdgeInsets.symmetric(
        horizontal: auto(50),
        vertical: auto(160),
      ),
      child: RawMaterialButton(
        onPressed: onLogin,
        fillColor: Colors.blue,
        shape: StadiumBorder(),
        child: Text(
          '登录',
          style: TextStyle(fontSize: auto(36), color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildRegister() {
    return Container(
      margin: EdgeInsets.only(right: auto(40)),
      child: InkWell(
        onTap: onRegister,
        customBorder: StadiumBorder(),
        child: Container(
          padding:
              EdgeInsets.symmetric(horizontal: auto(35), vertical: auto(8)),
          child: Text(
            '注册',
            style: TextStyle(color: Colors.blue, fontSize: setSp(30)),
          ),
        ),
      ),
    );
  }

  Widget _buildPassword() {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: auto(50),
        horizontal: auto(50),
      ),
      child: textField(
        labelText: 'Password',
        hintText: '请输入密码',
        icon: Icons.admin_panel_settings,
        onChanged: onPassword,
        isPassword: true,
      ),
    );
  }

  Widget _buildUserName() {
    return Container(
      margin: EdgeInsets.only(
        top: auto(120),
        left: auto(50),
        right: auto(50),
        bottom: auto(30),
      ),
      child: textField(
        labelText: 'UserName',
        hintText: '请输入用户名',
        icon: Icons.person,
        onChanged: onUserName,
        isPassword: false,
      ),
    );
  }

  TextField textField({
    String labelText,
    String hintText,
    IconData icon,
    ParamSingleCallback<String> onChanged,
    bool isPassword,
  }) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black.withOpacity(0.6)),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        labelText: labelText,
        prefixIcon: Icon(icon),
        filled: true,
        hintText: hintText,
        hintMaxLines: 1,
        hintStyle: TextStyle(color: Colors.black38),
      ),
      inputFormatters: [LengthLimitingTextInputFormatter(20)],
      onChanged: onChanged,
      obscureText: isPassword,
    );
  }
}
