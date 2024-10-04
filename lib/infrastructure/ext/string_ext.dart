import 'dart:ui';

import 'package:get/get.dart';

extension StringColorExtension on String {
  Color get to_color {
    String colorString = '${this.padLeft(8, 'F')}';
    return Color(int.parse(colorString, radix: 16));
  }
}

extension StringListExtension on List<String> {
  bool contains_case_insensitive(String target) {
    for (String e in this) {
      if (e.isCaseInsensitiveContains(target)) return true;
    }
    return false;
  }
}

extension StringDateTimeExtension on String {
  /// 是否是指定时间格式的字符串
  bool is_strict_date_time_format_YYYY_MM_DD() {
    // 定义正则表达式，用于匹配 YYYY-MM-DD 格式
    final RegExp regex = RegExp(r'^\d{4}-\d{2}-\d{2}$');

    // 检查字符串是否匹配格式
    if (!regex.hasMatch(this)) {
      return false;
    }

    // 如果格式匹配，再确认是否是有效的日期
    try {
      DateTime parsedDate = DateTime.parse(this);
      // 确保解析的时间与原始字符串相同（只检查日期部分）
      return parsedDate.toIso8601String().substring(0, 10) == this;
    } catch (e) {
      return false;
    }
  }
}
