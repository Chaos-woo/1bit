import 'package:flustars_flutter3/flustars_flutter3.dart';

extension TimelineUtilBridge on TimelineUtil {
  /// 通过 DateTime 格式化时间。
  /// dateTime 需要格式化的时间
  /// locDateTime: 当前时间或计划时间
  /// locale: 输出的键
  String formatByDatetime(
    DateTime datetime, {
    DateTime? localDatetime,
    String? locale,
    DayFormat? dayFormat,
  }) =>
      TimelineUtil.formatByDateTime(datetime, locDateTime: localDatetime, locale: locale, dayFormat: dayFormat);

  /// 通过毫秒格式化时间。
  /// dateTime: 需要格式化的时间，毫秒。
  /// locDateTime: 当前时间或计划时间，毫秒。
  /// locale: 输出的键。
  String format(
    int ms, {
    int? localTimeMs,
    String? locale,
    DayFormat? dayFormat,
  }) =>
      TimelineUtil.format(ms, locTimeMs: localTimeMs, locale: locale, dayFormat: dayFormat);

  /// 类似于 QQ 的时间线显示。
  /// 今天 (HH:mm)
  /// 昨天 (昨天;Yesterday)
  /// 本周 (星期一,周一;Monday,Mon)
  /// 其他 (yyyy-MM-dd)
  String formatA(
    int ms, {
    int? localTimeMs,
    String formatToday = 'HH:mm',
    String format = 'yyyy-MM-dd',
    String languageCode = 'en',
    bool short = false,
  }) =>
      TimelineUtil.formatA(ms,
          locMs: localTimeMs, formatToday: formatToday, format: format, languageCode: languageCode, short: short);
}
