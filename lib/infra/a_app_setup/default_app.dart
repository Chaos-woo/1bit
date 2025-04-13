import 'package:flutter/widgets.dart';

import 'default_infra_boot.dart';

/// 默认应用处理器
class DefaultApp {
  /// 启动默认应用
  /// - [mainApp] : 用户应用
  /// - [preprocessed] : 应用数据初始化前回调自定义处理
  /// - [initCompleted] : 应用数据初始化完成回调自定义处理
  /// - [processAfterRunApp] : 应用运行后回调自定义处理
  static void run(
    Widget mainApp, {
    Function()? preprocessed,
    Function()? initCompleted,
    Function()? processAfterRunApp,
  }) async {
    WidgetsFlutterBinding.ensureInitialized();

    await DefaultInfraBoot.startup(
      preprocessed: preprocessed,
      initCompleted: initCompleted,
    );

    runApp(mainApp);

    processAfterRunApp?.call();
  }
}
