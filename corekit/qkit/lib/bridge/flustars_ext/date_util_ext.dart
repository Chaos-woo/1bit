import 'package:flustars_flutter3/flustars_flutter3.dart';

extension DateUtilBridge on DateUtil {
  /// get DateTime By DateStr.
  DateTime? getDateTime(String dateStr, {bool? isUtc}) => DateUtil.getDateTime(dateStr, isUtc: isUtc);

  /// get DateTime By Milliseconds.
  DateTime getDateTimeByMs(int ms, {bool isUtc = false}) => DateUtil.getDateTimeByMs(ms, isUtc: isUtc);

  /// get DateMilliseconds By DateStr.
  int? getDateMsByTimeStr(String dateStr, {bool? isUtc}) => DateUtil.getDateMsByTimeStr(dateStr, isUtc: isUtc);

  /// get Now Date Milliseconds.
  int getNowDateMs() => DateUtil.getNowDateMs();

  /// get Now Date Str.(yyyy-MM-dd HH:mm:ss)
  String getNowDateStr() => DateUtil.getNowDateStr();

  /// format date by milliseconds.
  /// milliseconds 日期毫秒
  String formatDateMs(int ms, {bool isUtc = false, String? format}) =>
      DateUtil.formatDateMs(ms, isUtc: isUtc, format: format);

  /// format date by date str.
  /// dateStr 日期字符串
  String formatDateStr(String dateStr, {bool? isUtc, String? format}) =>
      DateUtil.formatDateStr(dateStr, isUtc: isUtc, format: format);

  /// format date by DateTime.
  /// format 转换格式(已提供常用格式 DateFormats，可以自定义格式：'yyyy/MM/dd HH:mm:ss')
  /// 格式要求
  /// year -> yyyy/yy   month -> MM/M    day -> dd/d
  /// hour -> HH/H      minute -> mm/m   second -> ss/s
  String formatDate(DateTime? dateTime, {String? format}) => DateUtil.formatDate(dateTime, format: format);

  /// get WeekDay.
  /// dateTime
  /// isUtc
  /// languageCode zh or en
  /// short
  String getWeekday(DateTime? dateTime, {String languageCode = 'en', bool short = false}) =>
      DateUtil.getWeekday(dateTime, languageCode: languageCode, short: short);

  /// get WeekDay By Milliseconds.
  String getWeekdayByMs(int milliseconds, {bool isUtc = false, String languageCode = 'en', bool short = false}) =>
      DateUtil.getWeekdayByMs(milliseconds, isUtc: isUtc, languageCode: languageCode, short: short);

  /// get day of year.
  /// 在今年的第几天.
  int getDayOfYear(DateTime dateTime) => DateUtil.getDayOfYear(dateTime);

  /// get day of year.
  /// 在今年的第几天.
  int getDayOfYearByMs(int ms, {bool isUtc = false}) => DateUtil.getDayOfYearByMs(ms, isUtc: isUtc);

  /// is today.
  /// 是否是当天.
  bool isToday(int? milliseconds, {bool isUtc = false, int? locMs}) =>
      DateUtil.isToday(milliseconds, isUtc: isUtc, locMs: locMs);

  /// is yesterday by dateTime.
  /// 是否是昨天.
  bool isYesterday(DateTime dateTime, DateTime locDateTime) => DateUtil.isYesterday(dateTime, locDateTime);

  /// is yesterday by millis.
  /// 是否是昨天.
  bool isYesterdayByMs(int ms, int locMs) => DateUtil.isYesterdayByMs(ms, locMs);

  /// is Week.
  /// 是否是本周.
  bool isWeek(int? ms, {bool isUtc = false, int? locMs}) => DateUtil.isWeek(ms, isUtc: isUtc, locMs: locMs);

  /// year is equal.
  /// 是否同年.
  bool yearIsEqual(DateTime dateTime, DateTime locDateTime) => DateUtil.yearIsEqual(dateTime, locDateTime);

  /// year is equal.
  /// 是否同年.
  bool yearIsEqualByMs(int ms, int locMs) => DateUtil.yearIsEqualByMs(ms, locMs);

  /// Return whether it is leap year.
  /// 是否是闰年
  bool isLeapYear(DateTime dateTime) => DateUtil.isLeapYear(dateTime);

  /// Return whether it is leap year.
  /// 是否是闰年
  bool isLeapYearByYear(int year) => DateUtil.isLeapYearByYear(year);
}
