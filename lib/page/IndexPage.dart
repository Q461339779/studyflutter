import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'CatePage.dart';
import 'CategrotPage.dart';
import 'HomePage.dart';
import 'MemberPage.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomtabs=[
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.home),label: "首页"),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.search),label: "分类"),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.shopping_cart),label: "购物车"),
    BottomNavigationBarItem(icon: Icon(CupertinoIcons.profile_circled),label: "会员中心"),
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
