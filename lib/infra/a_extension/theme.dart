import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Themes {
  /// 当前主题
  ThemeData get data => Theme.of(Get.context!);
}

extension ThemeContextExtension on BuildContext {
  ThemeData get theme => Themes().data;
}
