import 'package:flutter/material.dart';
import 'test_push.dart';
import 'dart:core';


void main() {
  runApp(MyBaiTap());
}

class MyBaiTap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(home: BaiTapHomePage());
  }
}

class BaiTapHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BaiTapHomePageSate();
  }
}

class BaiTapHomePageSate extends State<BaiTapHomePage> {
  String account="";
  String password="";
  bool isValidEmail(String email) {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+(.[a-zA-Z]+)?$");
    return emailRegExp.hasMatch(email);
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: Text('Trang đăng nhập'),
        ),

        body: Center(

          child: Column(

              children: [
                SizedBox(height: 50),
                TextField(
                    onChanged: (text) {
                      account= text;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Nhập tên đăng nhập :')),
                SizedBox(height: 50),
                TextField(
                    obscureText: true,
                    onChanged: (text) {
                      password = text;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Nhập mật khẩu:')),
                SizedBox(height: 50),

                ElevatedButton(onPressed: (){
                  if(account.length>6 && password.isNotEmpty && isValidEmail(account)) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Trangtaikhoan(account)));
                  }
                  else{
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('Tên tài khoàn không hợp lệ!!!')));
                    setState(() {});
                  }

                }, child: Text("Đăng nhập")),
              ]
          ),
        ));
  }
}