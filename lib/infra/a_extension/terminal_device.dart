import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';

/// 应用终端设备信息
final class TerminalDevice {
  /// 安卓设备信息
  static late AndroidDeviceInfo _androidInfo;

  /// iOS设备信息
  static late IosDeviceInfo _iosInfo;

  /// 初始化设备信息
  static Future<void> initDeviceInfo() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      _androidInfo = await deviceInfo.androidInfo;
    }
    if (Platform.isIOS) {
      _iosInfo = await deviceInfo.iosInfo;
    }
  }

  /// 获取Android设备信息
  AndroidDeviceInfo get androidInfo => _androidInfo;

  /// 获取IOS设备信息
  IosDeviceInfo get iosDeviceInfo => _iosInfo;

  /// 是否是桌面端
  bool get isDesktop => !isWeb && (isWindows || isLinux || isMacos);

  /// 是否是移动端
  bool get isMobile => isAndroid || isIos;

  /// 是否是web端
  bool get isWeb => kIsWeb;

  /// 是否是windows
  bool get isWindows => !isWeb && Platform.isWindows;

  bool get isLinux => !isWeb && Platform.isLinux;

  /// 是否是macos
  bool get isMacos => !isWeb && Platform.isMacOS;

  /// 是否是android
  bool get isAndroid => !isWeb && Platform.isAndroid;

  /// 是否是fuchsia
  bool get isFuchsia => !isWeb && Platform.isFuchsia;

  /// 是否是ios
  bool get isIos => !isWeb && Platform.isIOS;
}
