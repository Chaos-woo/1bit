import 'dart:ui';

import 'package:get/get.dart';

extension StringColorExt on String {
  Color get toColor {
    String colorString = '${this.padLeft(8, 'F')}';
    return Color(int.parse(colorString, radix: 16));
  }
}

extension StringListExt on List<String> {
  bool containsCaseInsensitive(String target) {
    for (String e in this) {
      if (e.isCaseInsensitiveContains(target)) return true;
    }
    return false;
  }
}
