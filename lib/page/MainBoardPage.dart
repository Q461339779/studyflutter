

import 'package:flutter/material.dart';
import 'package:studyflutter/page/HiBoardPage.dart';
import 'package:studyflutter/page/IndexPage.dart';

///主屏页面  加载负一屏和indexPage
class MainBoardPage extends StatefulWidget {
  const MainBoardPage({Key key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MainBoardPageState createState() => _MainBoardPageState();
}

class _MainBoardPageState extends State<MainBoardPage> {



  final PageController _pageController = PageController(initialPage: 1);
  HiBoardPage _hiBoardPage;
  IndexPage _indexPage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyContent(),
    );
  }

  Widget _bodyContent() {
    return PageView.builder(
        controller: _pageController,
        //physics: const NeverScrollableScrollPhysics(),
        itemCount: 2,
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return _hiBoardPage ??= HiBoardPage();
          }
          if (index == 1) {
            return _indexPage ??=  IndexPage();
          }

          return Container();
        });
  }
}





