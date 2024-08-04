import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'state.dart';

class TextbookHomepageLogic extends GetxController {
  final TextbookHomepageState state = TextbookHomepageState();

  TabController? tabbar_controller;

  int get tabbar_current_index => tabbar_controller != null ? tabbar_controller!.index : 0;
}
