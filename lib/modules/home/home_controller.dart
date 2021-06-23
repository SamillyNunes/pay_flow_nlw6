import 'package:flutter/material.dart';

class HomeController {
  var currentPageNotifier = ValueNotifier<int>(0);
  int get getPage => currentPageNotifier.value;
  set setPage(int index) => currentPageNotifier.value = index;
}
