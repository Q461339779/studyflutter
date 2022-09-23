import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CatePage.dart';
import 'CategrotPage.dart';
import 'HomePage.dart';
import 'MemberPage.dart';
///承载首页，问答，体系，我的 相关页面
class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomtabs=[
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home),label: "首页"),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.search),label: "问答"),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.shopping_cart),label: "体系"),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.profile_circled),label: "我的"),
  ];
  final List taBodies=[HomePage(),CategrotPage(),MemberPage(),CatePage()];

  int currentIndex=0;
  var currentPage;

  @override
  void initState() {
    // TODO: implement initState
    currentPage=taBodies[currentIndex];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(147, 24, 24, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomtabs,
        onTap: (index){
          setState(() {
            currentIndex=index;
            currentPage=taBodies[currentIndex];
          });
        },
      ),
      body: currentPage,
    );

  }
}
