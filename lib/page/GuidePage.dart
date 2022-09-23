import 'package:flutter/material.dart';
import 'package:studyflutter/public.dart';

import '../constant/constant.dart';
///引导页面
class GuidePage extends StatefulWidget {
  @override
  _GuidePageState createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage>
    with SingleTickerProviderStateMixin {
  PageController _pageController;
  bool isVisablea = true;
  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      if (_tabController?.index == 2) {
        setState(() {
          isVisablea = false;
        });
      } else {
        setState(() {
          isVisablea = true;
        });
      }
    });
  }

  final List<Widget> listImage = [
    Image.asset(
      Constant.ASSETS_IMG + "a.png",
      fit: BoxFit.fill,
      width: double.infinity,
      height: double.infinity,
    ),
    Image.asset(
      Constant.ASSETS_IMG + "b.png",
      fit: BoxFit.fill,
      width: double.infinity,
      height: double.infinity,
    ),
    Image.asset(
      Constant.ASSETS_IMG + "c.png",
      fit: BoxFit.fill,
      width: double.infinity,
      height: double.infinity,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          TabBarView(
            controller: _tabController,
            children: [
              listImage[0],
              listImage[1],
              Stack(
                children: [
                  listImage[2],
                  Container(
                    margin: EdgeInsets.only(bottom: 80),
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: InkWell(
                        onTap: (){
                          //跳转去======mian
                          //跳转到引导页面
                          Navigator.pop(context);
                          Routes.navigateTo(context, Routes.mainboardpage, clearStack: true);
                        },
                        child: Container(
                          width: 150,
                          height: 40,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(40)),
                          child: Text("欢迎使用App"),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          Visibility(
              visible: isVisablea,
              child: Container(
                margin: EdgeInsets.only(bottom: 40),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: TabPageSelector(
                    controller: _tabController,
                    selectedColor: Colors.amberAccent,
                    indicatorSize: 7,
                    color: Colors.black12,
                  ),
                ),
              ))
        ],
      ),
    );
  }


}
