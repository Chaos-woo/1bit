import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:qkit/qkit.dart';

/// PrettyPrintLogWriter
class PPLog extends GetxService implements LogWriter {
  static const String tag = 'PrettyPrintLogWriter';

  static PPLog get singl => Get.find<PPLog>(tag: tag);

  late Logger _logger;

  PPLog({bool colors = true}) {
    _logger = Logger(
      printer: PrettyPrinter(
        noBoxingByDefault: true,
        methodCount: 2,
        errorMethodCount: 8,
        lineLength: 120,
        colors: colors,
        printEmojis: true,
        printTime: true,
      ),
    );

    setLevel(Level.info);
  }

  void setLevel(Level level) {
    Logger.level = level;
  }

  @override
  void debug(message) {
    _logger.d(printWithDatetime(message));
  }

  @override
  void error(message, {StackTrace? stackTrace}) {
    _logger.e(printWithDatetime(message), stackTrace: stackTrace);
  }

  @override
  void fatal(message, {StackTrace? stackTrace}) {
    _logger.f(printWithDatetime(message), stackTrace: stackTrace);
  }

  @override
  void info(message) {
    _logger.i(printWithDatetime(message));
  }

  @override
  void warn(message) {
    _logger.w(printWithDatetime(message));
  }

  dynamic printWithDatetime(dynamic message) {
    var formatDatetime = '${QKit.bridge.flustars.date.formatDate(
      DateTime.now(),
      format: DateFormats.full,
    )} : ';

    return formatDatetime + message.toString();
  }
}
