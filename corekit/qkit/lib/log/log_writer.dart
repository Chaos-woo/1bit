
/// 日志抽象接口
abstract class LogWriter{
  void debug(dynamic message);

  void info(dynamic message);

  void warn(dynamic message);

  void error(dynamic message, {StackTrace? stackTrace});

  void fatal(dynamic message, {StackTrace? stackTrace});
}