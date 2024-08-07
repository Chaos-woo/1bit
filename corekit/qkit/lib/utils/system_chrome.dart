import 'package:flutter/services.dart';
import 'package:qkit/qkit.dart';

/// [SystemChrome]工具
class SystemChromes {
  /// 设置应用程序方向：竖直上
  void setDeviceOrientationPortraitUp() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  /// 设置应用程序方向：竖直下
  void setDeviceOrientationPortraitDown() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitDown]);
  }

  /// 设置应用程序方向：竖直左
  void setDeviceOrientationLandscapeLeft() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
  }

  /// 设置应用程序方向：竖直右
  void setDeviceOrientationLandscapeRight() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeRight]);
  }

  /// 设置系统状态栏、底部按钮栏是否隐藏
  Future<void> enableSystemUIOverlays({
    List<SystemUiOverlay> reservedOverlays = const [...SystemUiOverlay.values],
  }) async {
    /// 默认都保留
    await SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: reservedOverlays,
    );
  }

  /// 设置顶部状态栏颜色
  void setTopSystemOverlayStyle(Color color, Brightness iconBrightness) {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      statusBarColor: color,
      statusBarIconBrightness: iconBrightness,
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }

  /// 设置底部状态栏颜色
  void setBottomSystemOverlayStyle(Color color, Brightness iconBrightness) {
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
      systemNavigationBarColor: color,
      systemNavigationBarIconBrightness: iconBrightness,
    );
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }

  /// 设置应用程序在web中的展示描述
  // void setApplicationWebSwitcherDescription({String? label, Color? primaryColor}) async {
  //   await SystemChrome.setApplicationSwitcherDescription(
  //     ApplicationSwitcherDescription(
  //       label: label,
  //       primaryColor: primaryColor?.toHex(),
  //     ),
  //   );
  // }
}

class SystemUIOverlay {
  static final List<SystemUiOverlay> all = [...SystemUiOverlay.values];
  static final List<SystemUiOverlay> onlyTop = [SystemUiOverlay.top];
  static final List<SystemUiOverlay> onlyBottom = [SystemUiOverlay.bottom];
  static final List<SystemUiOverlay> empty = <SystemUiOverlay>[];
}
