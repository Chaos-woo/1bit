import 'dart:math';

import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

final class IdGenerator {
  static const _uuid = Uuid();

  /// 生成 UUID v4 字符串
  ///
  /// 返回一个符合 UUID v4 规范的字符串。
  String uuidV4() => _uuid.v4();

  /// 生成时间戳字符串
  ///
  /// 返回当前时间的毫秒级时间戳字符串。
  String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();

  /// 生成一个随机的数字字符串，指定长度。
  ///
  /// [length] 为生成的数字字符串的长度，默认为8。
  /// 返回一个指定长度的随机数字字符串。
  String randomNumeric([int length = 8]) {
    final random = Random();
    final buffer = StringBuffer();
    for (int i = 0; i < length; i++) {
      buffer.write(random.nextInt(10));
    }
    return buffer.toString();
  }

  /// 生成一个时间戳加随机数的字符串，避免短时间内生成的ID重复
  /// [length] 随机数的长度, 默认是5
  String randomTimestamp([int length = 5]) => '${timestamp()}-${randomNumeric(length)}';

  /// 使用uuid_v4生成ValueKey
  Key uuidValueKey() => ValueKey(uuidV4());

  /// 使用timestamp生成ValueKey
  Key timestampValueKey() => ValueKey(timestamp());
}
