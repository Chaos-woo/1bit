import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final class Keyboard {
  /// 获取剪贴板内容
  Future<String?> getClipboardData({String? defaultValue}) async {
    ClipboardData? data = await Clipboard.getData(Clipboard.kTextPlain);
    if (data == null) {
      return defaultValue;
    }

    return data.text;
  }

  /// 复制数据至剪贴板
  Future<void> setClipboardData(String text) async {
    return await Clipboard.setData(ClipboardData(text: text));
  }

  /// 设置键盘隐藏
  void hideKeyboard(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
  }
}
