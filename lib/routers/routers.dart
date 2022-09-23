import 'package:flutter/material.dart' hide Router;
import 'package:studyflutter/public.dart';


class Routes {
// 路由管理
  static FluroRouter fluroRouter;
  static String guidepage = '/guidepage';
  static String indexpage = '/indexpage';
  static String mainboardpage = '/mainboardpage';


  static void configureRoutes(FluroRouter fluroRouter) {

    fluroRouter.notFoundHandler = Handler(
        // ignore: missing_return
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print('route not found!');
    });

    fluroRouter.define(guidepage, handler: guidePageHandler);
    fluroRouter.define(indexpage, handler: indexPageHandler);
    fluroRouter.define(mainboardpage, handler: mainBoardpageHandler);


  }

  // 对参数进行encode，解决参数中有特殊字符，影响fluro路由匹配(https://www.jianshu.com/p/e575787d173c)
  static Future navigateTo(BuildContext context, String path,
      {Map<String, dynamic> params,
      bool clearStack = false,
      TransitionType transition = TransitionType.fadeIn}) {
    String query = "";
    if (params != null) {
      int index = 0;
      for (var key in params.keys) {
        var value = Uri.encodeComponent(params[key]);
        if (index == 0) {
          query = "?";
        } else {
          query = query + "\&";
        }
        query += "$key=$value";
        index++;
      }
    }
    print('我是navigateTo传递的参数：$query');

    path = path + query;
    return fluroRouter.navigateTo(context, path,
        clearStack: clearStack, transition: transition);
  }

  // 对参数进行encode，解决参数中有特殊字符，影响fluro路由匹配(https://www.jianshu.com/p/e575787d173c)
  static Future navigatepushAndRemoveUntil(BuildContext context, String path,
      {Map<String, dynamic> params,
      bool clearStack = false,
      TransitionType transition = TransitionType.fadeIn}) {
    String query = "";
    if (params != null) {
      int index = 0;
      for (var key in params.keys) {
        var value = Uri.encodeComponent(params[key]);
        if (index == 0) {
          query = "?";
        } else {
          query = query + "\&";
        }
        query += "$key=$value";
        index++;
      }
    }
    path = path + query;
    return fluroRouter.navigateTo(context, path,
        clearStack: clearStack, transition: transition);
  }
}
