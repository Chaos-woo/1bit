import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:qkit/qkit.dart';

typedef FlutterErrorReporter = void Function(FlutterErrorDetails details);

/// 默认应用初始化处理器
class AppStarter {
  /// 自定义异常处理器
  static FlutterErrorReporter? _errorReporter;

  /// 启动默认应用
  /// - [myApp] : 用户应用
  /// - [preprocessed] : 应用数据初始化前回调自定义处理
  /// - [initCompleted] : 应用数据初始化完成回调自定义处理
  /// - [afterRunAppProcessed] : 应用运行后回调自定义处理
  /// - [errorReporter] : 应用异常统一处理器
  static void run(
    Widget myApp, {
    Function()? preprocessed,
    Function()? initCompleted,
    Function()? afterRunAppProcessed,
    FlutterErrorReporter? errorReporter,
  }) async {
    _errorReporter = errorReporter;

    /// 异常捕获处理
    _exceptionCapture(() => MyApp.run(
          myApp,
          preprocessed: preprocessed,
          initCompleted: initCompleted,
          afterRunAppProcessed: afterRunAppProcessed,
        ));
  }

  ///
  static void _exceptionCapture(void Function() executor) {
    FlutterError.onError = (FlutterErrorDetails details) {
      if (QKitUtils.is_release_mode) {
        /// release模式异常由Zone处理
        Zone.current.handleUncaughtError(details.exception, details.stack!);
        _reportErrorLog(details);
      } else {
        /// 开发模式直接打印异常信息
        FlutterError.dumpErrorToConsole(details);
      }
    };

    /// flutter异常日志的处理：https://juejin.cn/post/6919684792124440584
    runZonedGuarded(
      () async {
        executor.call();
      },
      (Object error, StackTrace stackTrace) async {
        var details = _makeErrorDetails(error, stackTrace);
        _reportErrorLog(details);
      },
      zoneSpecification: ZoneSpecification(
        print: (
          Zone self,
          ZoneDelegate parent,
          Zone zone,
          String line,
        ) {
          _collectLogs(parent, zone, line);
        },
      ),
    );
  }

  static void _reportErrorLog(FlutterErrorDetails details) {
    _errorReporter?.call(details);
  }

  static _makeErrorDetails(Object error, StackTrace stackTrace) {
    return FlutterErrorDetails(exception: error, stack: stackTrace);
  }

  static void _collectLogs(ZoneDelegate parent, Zone zone, String line) {
    parent.print(zone, '&ZoneGuarded&print: $line');
  }
}
