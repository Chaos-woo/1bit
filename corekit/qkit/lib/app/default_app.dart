import 'package:flutter/widgets.dart';

import 'kit_initializer.dart';

/// 默认应用处理器
class DefaultApp {
  /// 启动默认应用
  /// - [main_app] : 用户应用
  /// - [preprocessed] : 应用数据初始化前回调自定义处理
  /// - [init_completed] : 应用数据初始化完成回调自定义处理
  /// - [post_run_app_processed] : 应用运行后回调自定义处理
  static void run(
    Widget main_app, {
    Function()? preprocessed,
    Function()? init_completed,
    Function()? post_run_app_processed,
  }) async {
    WidgetsFlutterBinding.ensureInitialized();

    await KitInitializer.startup(
      preprocessed: preprocessed,
      init_completed: init_completed,
    );

    runApp(main_app);

    post_run_app_processed?.call();
  }
}
