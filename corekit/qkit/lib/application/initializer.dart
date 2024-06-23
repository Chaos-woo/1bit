import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

/// 框架初始化器
class QKitInitializer {
  /// 启动框架
  /// - [preprocessed] : 应用数据初始化前回调自定义处理
  /// - [initCompleted] : 应用数据初始化完成回调自定义处理
  static Future<void> startup({
    Function()? preprocessed,
    Function()? initCompleted,
  }) async {
    await _bootstrap();
    await preprocessed?.call();
    await _startup();
    await initCompleted?.call();
  }

  static _bootstrap() {
    /// 初始化基础日志工具
    Get.put(PPLog(), tag: PPLog.tag);
  }

  static _startup() async {
    /// 初始化设备屏幕信息
    ScreenUtil.getInstance();

    /// 初始化设备信息
    await QMobileDevice.init();

    /// 初始化应用包信息
    await QPackage.init();

    /// 初始化外部存储信息
    await QStorageDirectory.init();

    /// 初始化本地缓存信息，SpUtil不做封装
    await SpUtil.getInstance();

    /// 初始化路由
    QDispatcher.dispatch();
  }
}
