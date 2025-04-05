import 'package:flutter/material.dart';

extension IntDurationExtension on int {
  /// 获取天数
  Duration get days => Duration(days: this);

  /// 获取小时数
  Duration get hours => Duration(hours: this);

  /// 获取分钟数
  Duration get minutes => Duration(minutes: this);

  /// 获取秒数
  Duration get seconds => Duration(seconds: this);

  /// 获取毫秒数
  Duration get milliseconds => Duration(milliseconds: this);

  /// 获取微秒数
  Duration get microseconds => Duration(microseconds: this);
}

extension IntKeyExtension on int {
  /// 转为value key
  ValueKey<int> get toValueKey => ValueKey(this);
}
