import 'package:flustars_flutter3/flustars_flutter3.dart';

extension DateUtilBridge on DateUtil {
  /// 通过日期字符串获取 [DateTime] 对象.
  DateTime? getDateTime(String dateStr, {bool? isUtc}) => DateUtil.getDateTime(dateStr, isUtc: isUtc);

  /// 通过毫秒数获取 [DateTime] 对象.
  DateTime getDateTimeByMs(int milliseconds, {bool isUtc = false}) =>
      DateUtil.getDateTimeByMs(milliseconds, isUtc: isUtc);

  /// 通过日期字符串获取日期毫秒数. 如果格式不正确，返回 null
  int? getDateMsByTimeStr(String dateStr, {bool? isUtc}) => DateUtil.getDateMsByTimeStr(dateStr, isUtc: isUtc);

  /// 获取当前时间的毫秒数
  int getNowDateMs() => DateUtil.getNowDateMs();

  /// 获取当前时间的日期字符串.(yyyy-MM-dd HH:mm:ss).
  String getNowDateStr() => DateUtil.getNowDateStr();

  /// 通过毫秒数格式化日期.
  String formatDateMs(int milliseconds, {bool isUtc = false, String? format}) =>
      DateUtil.formatDateMs(milliseconds, isUtc: isUtc, format: format);

  /// 格式化日期.
  String formatDateStr(String dateStr, {bool? isUtc, String? format}) =>
      DateUtil.formatDateStr(dateStr, isUtc: isUtc, format: format);

  /// 格式化日期.
  String formatDate(DateTime? dateTime, {String? format}) => DateUtil.formatDate(dateTime, format: format);

  /// 获取星期几. 例如：中文返回：'星期日'，英文返回：'Sunday'
  String getWeekday(DateTime? dateTime, {String languageCode = 'en', bool short = false}) =>
      DateUtil.getWeekday(dateTime, languageCode: languageCode, short: short);

  /// 通过毫秒数获取星期几.
  String getWeekdayByMs(int milliseconds, {bool isUtc = false, String languageCode = 'en', bool short = false}) =>
      DateUtil.getWeekdayByMs(milliseconds, isUtc: isUtc, languageCode: languageCode, short: short);

  /// 获取一年中的第几天.
  int getDayOfYear(DateTime dateTime) => DateUtil.getDayOfYear(dateTime);

  /// 通过毫秒数获取一年中的第几天.
  int getDayOfYearByMs(int milliseconds, {bool isUtc = false}) => DateUtil.getDayOfYearByMs(milliseconds, isUtc: isUtc);

  /// 是否是今天.
  bool isToday(int? milliseconds, {bool isUtc = false, int? locMs}) =>
      DateUtil.isToday(milliseconds, isUtc: isUtc, locMs: locMs);

  /// 是否是昨天(通过DateTime对象).
  bool isYesterday(DateTime dateTime, DateTime locDateTime) => DateUtil.isYesterday(dateTime, locDateTime);

  /// 是否是昨天(通过毫秒数).
  bool isYesterdayByMs(int milliseconds, int locMilliseconds) =>
      DateUtil.isYesterdayByMs(milliseconds, locMilliseconds);

  /// 是否是本周.
  bool isWeek(int? milliseconds, {bool isUtc = false, int? locMilliseconds}) =>
      DateUtil.isWeek(milliseconds, isUtc: isUtc, locMs: locMilliseconds);

  /// 是否是同一年(通过DateTime对象).
  bool yearIsEqual(DateTime dateTime, DateTime locDateTime) => DateUtil.yearIsEqual(dateTime, locDateTime);

  /// 是否是同一年(通过毫秒数).
  bool yearIsEqualByMs(int milliseconds, int locMilliseconds) =>
      DateUtil.yearIsEqualByMs(milliseconds, locMilliseconds);

  /// 是否是闰年
  bool isLeapYear(DateTime dateTime) => DateUtil.isLeapYear(dateTime);

  /// 是否是闰年
  bool isLeapYearByYear(int year) => DateUtil.isLeapYearByYear(year);
}
