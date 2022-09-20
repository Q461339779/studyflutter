import 'dart:async';

import 'package:flutter/material.dart';
import 'package:studyflutter/constant/constant.dart';
import 'package:studyflutter/public.dart';


///欢迎页面
class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  int index = 4;
  // ignore: unused_field
  Timer _timer;
  bool isFrist=true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SpUtil.getInstance();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (index > 0) {
          index--;
        } else {
          //跳转到引导页面

          if (UserUtil.isNotFirstIn()) {
            Navigator.pop(context);
            Routes.navigateTo(context, Routes.homepage, clearStack: true);

          } else {
            Navigator.pop(context);
            Routes.navigateTo(context, Routes.guidepage, clearStack: true);
          }

          index = 0;
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(

            Constant.ASSETS_IMG + "welcome_android_slogan.png",
            fit: BoxFit.fill,
            width: MediaQuery.of(context).size.width, // 屏幕宽度
            height: MediaQuery.of(context).size.height, // 屏幕高度
          ),
          Positioned(
              top: 40,
              right: 20,
              child: Container(
                width: 50,
                height: 27,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: Colors.amber,borderRadius: BorderRadius.circular(40) ),
                child: Text("${index}"),
              ))
        ],
      ),
    );
  }
}