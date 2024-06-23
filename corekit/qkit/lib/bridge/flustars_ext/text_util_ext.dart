
import 'package:flustars_flutter3/flustars_flutter3.dart';

extension QBridgetTextUtilExt on TextUtil {
  /// isEmpty
  bool isEmpty(String? text) => TextUtil.isEmpty(text);

  /// 每隔 x位 加 pattern
  String formatDigitPattern(String text,
      {int digit = 4, String pattern = ' '}) => TextUtil.formatDigitPattern(text, digit: digit, pattern: pattern);

  /// 每隔 x位 加 pattern, 从末尾开始
  String formatDigitPatternEnd(String text,
      {int digit = 4, String pattern = ' '}) => TextUtil.formatDigitPatternEnd(text, digit: digit, pattern: pattern);

  /// 每隔4位加空格
  String formatSpace4(String text) => TextUtil.formatSpace4(text);

  /// 每隔3三位加逗号
  /// num 数字或数字字符串。int型。
  String formatComma3(Object num) => TextUtil.formatComma3(num);

  /// 每隔3三位加逗号
  /// num 数字或数字字符串。double型。
  String formatDoubleComma3(Object num,
      {int digit = 3, String pattern = ','}) => TextUtil.formatDoubleComma3(num, digit: digit, pattern: pattern);

  /// hideNumber
  String hideNumber(String phoneNo,
      {int start = 3, int end = 7, String replacement = '****'}) => TextUtil.hideNumber(phoneNo, start: start, end: end, replacement: replacement);

  /// replace
  String replace(String text, Pattern from, String replacement) => TextUtil.replace(text, from, replacement);

  /// split
  List<String> split(String text, Pattern pattern) => TextUtil.split(text, pattern);

  /// reverse
  String reverse(String text) => TextUtil.reverse(text);
}
