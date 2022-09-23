import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:studyflutter/page/IndexPage.dart';
import 'package:studyflutter/page/MainBoardPage.dart';
import 'package:studyflutter/public.dart';

import '../page/GuidePage.dart';

var guidePageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return GuidePage();
    });

var indexPageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return IndexPage();
    });

var mainBoardpageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return MainBoardPage();
    });