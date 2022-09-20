import 'dart:io';

import 'package:flutter/material.dart' hide Router;
import 'package:flutter/services.dart';
import 'package:studyflutter/page/SplashPage.dart';
import 'package:studyflutter/public.dart';

void main() {
  runApp(MyApp());
  if (Platform.isAndroid) {
    SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xffffffff),
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: Color(0xffffffff),
      statusBarColor: Colors.black,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.light,
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final fluroRouter = FluroRouter();
    Routes.configureRoutes(fluroRouter);
    Routes.fluroRouter = fluroRouter;

    return Container(
      child: MaterialApp(
          title: "HRL微博",
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primaryColor: Colors.white),
          onGenerateRoute: Routes.fluroRouter.generator,
          home: SplashPage()),
    );
  }
}