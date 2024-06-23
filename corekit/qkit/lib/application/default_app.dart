import 'package:flutter/widgets.dart';
import 'package:qkit/application/initializer.dart';

/// 默认应用处理器
class DefaultApp {
  /// 启动默认应用
  /// - [myApp] : 用户应用
  /// - [preprocessed] : 应用数据初始化前回调自定义处理
  /// - [initCompleted] : 应用数据初始化完成回调自定义处理
  /// - [afterRunAppProcessed] : 应用运行后回调自定义处理
  static void run(
    Widget myApp, {
    Function()? preprocessed,
    Function()? initCompleted,
    Function()? afterRunAppProcessed,
  }) async {
    WidgetsFlutterBinding.ensureInitialized();

    await QKitInitializer.startup(
      preprocessed: preprocessed,
      initCompleted: initCompleted,
    );

    runApp(myApp);

    afterRunAppProcessed?.call();
  }
}
