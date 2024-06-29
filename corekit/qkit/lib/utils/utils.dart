import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:qkit/qkit.dart';

/// 公共工具类
class QKitUtils {
  QKitUtils._();

  /// 当前运行环境是否为Release环境
  static const bool isReleaseMode = kReleaseMode;

  /// 获取剪贴板内容
  static Future<String?> clipboardData({String? defaultValue}) async {
    ClipboardData? data = await Clipboard.getData(Clipboard.kTextPlain);
    if (data == null) {
      return defaultValue;
    }

    return data.text;
  }

  /// 复制数据至剪贴板
  static Future<void> copyToColipboard(String text) async {
    return await Clipboard.setData(ClipboardData(text: text));
  }

  /// 设置键盘隐藏
  static hideKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
  }

  /// 判断是否是基本类型
  static bool isBaseType(dynamic data) {
    return data.runtimeType is String ||
        data.runtimeType is double ||
        data.runtimeType is bool ||
        data.runtimeType is int;
  }

  /// 随机时间戳Key
  static Key randomTimestampKey() {
    return ValueKey(DateTime.now().millisecondsSinceEpoch);
  }

  /// 随机字符串Key
  static Key randomStringKey() {
    return ValueKey(QKit.idGen.uuidV4());
  }
}
