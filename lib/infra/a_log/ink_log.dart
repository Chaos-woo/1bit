import 'package:cw2bit/infra/INK/INKs.dart';
import 'package:cw2bit/infra/a_log/log_writer.dart';
import 'package:cw2bit/infra/a_sdk_bridge/date_util_extension.dart';
import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class INKLog extends GetxService implements LogWriter {
  static const String tag = '__pretty_print_logger__';

  static INKLog get getx => Get.find<INKLog>(tag: tag);

  late Logger _logger;

  INKLog({bool colors = true}) {
    _logger = Logger(
      printer: PrettyPrinter(
        noBoxingByDefault: true,
        methodCount: 2,
        errorMethodCount: 8,
        lineLength: 2048,
        colors: colors,
        printEmojis: true,
        printTime: true,
      ),
    );

    _setLevel(Level.info);
  }

  /// 设置日志级别
  /// [level] 日志级别
  void _setLevel(Level level) {
    Logger.level = level;
  }

  /// 设置日志级别
  /// [level] 日志级别
  void setLevel(Level level) {
    Logger.level = level;
  }

  /// 调试日志
  /// [message] 日志内容
  @override
  void debug(message) => _logger.d(_print(message));

  /// 警告日志
  /// [message] 日志内容
  @override
  void warn(message) {
    _logger.w(_print(message));
  }

  /// 错误日志
  /// [message] 日志内容
  /// [stack] 堆栈信息
  @override
  void error(message, {StackTrace? stack}) {
    _logger.e(_print(message), stackTrace: stack);
  }

  @override
  void fatal(message, {StackTrace? stack}) {
    _logger.f(_print(message), stackTrace: stack);
  }

  /// 信息日志
  /// [message] 日志内容
  @override
  void info(message) {
    _logger.i(_print(message));
  }

  /// 打印带时间的消息
  /// [message] 消息内容
  dynamic _print(dynamic message) {
    var formatDate = '${INKs.sdk.date.formatDate(
      DateTime.now(),
      format: DateFormats.full,
    )} : ';

    return formatDate + message.toString();
  }
}
