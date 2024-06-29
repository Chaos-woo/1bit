
import 'package:flustars_flutter3/flustars_flutter3.dart';

extension TimelineUtilBridge on TimelineUtil {
  /// format time by DateTime.
  /// dateTime
  /// locDateTime: current time or schedule time.
  /// locale: output key.
  String formatByDateTime(
      DateTime dateTime, {
        DateTime? locDateTime,
        String? locale,
        DayFormat? dayFormat,
      }) => TimelineUtil.formatByDateTime(dateTime, locDateTime: locDateTime, locale: locale, dayFormat: dayFormat);

  /// format time by millis.
  /// dateTime : millis.
  /// locDateTime: current time or schedule time. millis.
  /// locale: output key.
  String format(
      int ms, {
        int? locTimeMs,
        String? locale,
        DayFormat? dayFormat,
      }) => TimelineUtil.format(ms, locTimeMs: locTimeMs, locale: locale, dayFormat: dayFormat);

  /// Timeline like QQ.
  ///
  /// today (HH:mm)
  /// yesterday (昨天;Yesterday)
  /// this week (星期一,周一;Monday,Mon)
  /// others (yyyy-MM-dd)
  String formatA(
      int ms, {
        int? locMs,
        String formatToday = 'HH:mm',
        String format = 'yyyy-MM-dd',
        String languageCode = 'en',
        bool short = false,
      }) => TimelineUtil.formatA(ms, locMs: locMs, formatToday: formatToday, format: format, languageCode: languageCode, short: short);
}
