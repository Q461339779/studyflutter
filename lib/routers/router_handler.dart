import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:studyflutter/page/IndexPage.dart';
import 'package:studyflutter/public.dart';

import '../page/GuidePage.dart';

var indexPageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return GuidePage();
    });

var homepageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      return IndexPage();
    });