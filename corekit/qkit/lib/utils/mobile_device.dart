import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';

/// 应用终端设备信息
class QMobileDevice {
  /// 安卓设备信息
  static late AndroidDeviceInfo _androidInfo;

  /// iOS设备信息
  static late IosDeviceInfo _iosDeviceInfo;

  static Future<void> init() async {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      _androidInfo = await deviceInfo.androidInfo;
    }

    if (Platform.isIOS) {
      _iosDeviceInfo = await deviceInfo.iosInfo;
    }
  }

  AndroidDeviceInfo get androidInfo => _androidInfo;

  IosDeviceInfo get iosDeviceInfo => _iosDeviceInfo;

  bool get isDesktop => !isWeb && (isWindows || isLinux || isMacOS);

  bool get isMobile => isAndroid || isIOS;

  bool get isWeb => kIsWeb;

  bool get isWindows => !isWeb && Platform.isWindows;

  bool get isLinux => !isWeb && Platform.isLinux;

  bool get isMacOS => !isWeb && Platform.isMacOS;

  bool get isAndroid => !isWeb && Platform.isAndroid;

  bool get isFuchsia => !isWeb && Platform.isFuchsia;

  bool get isIOS => !isWeb && Platform.isIOS;
}
