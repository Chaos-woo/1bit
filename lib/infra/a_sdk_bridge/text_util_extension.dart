import 'package:flustars_flutter3/flustars_flutter3.dart';

extension TextUtilBridge on TextUtil {
  /// 判断字符串是否为空
  bool isEmpty(
    String? text, {
    bool strip = true,
  }) =>
      TextUtil.isEmpty(text == null
          ? null
          : strip
              ? text.trim()
              : text);

  /// 判断字符串是否非空
  bool isNotEmpty(
    String? text, {
    bool strip = true,
  }) =>
      !isEmpty(text, strip: strip);

  /// 每隔 x位 加 pattern
  String formatDigitPattern(String text, {int digit = 4, String pattern = ' '}) =>
      TextUtil.formatDigitPattern(text, digit: digit, pattern: pattern);

  /// 每隔 x 位加 pattern, 从末尾开始
  String formatDigitPatternEnd(String text, {int digit = 4, String pattern = ' '}) =>
      TextUtil.formatDigitPatternEnd(text, digit: digit, pattern: pattern);

  /// 每隔 4 位加空格
  String formatSpace4(String text) => TextUtil.formatSpace4(text);

  /// 每隔 3 位加逗号, num 数字或数字字符串，int 型。
  String formatComma3(Object num) => TextUtil.formatComma3(num);

  /// 每隔 3 位加逗号, num 数字或数字字符串，double 型。
  String formatDoubleComma3(Object num, {int digit = 3, String pattern = ','}) =>
      TextUtil.formatDoubleComma3(num, digit: digit, pattern: pattern);

  /// 隐藏手机号
  String hideNumber(String phoneNo, {int start = 3, int end = 7, String replacement = '****'}) =>
      TextUtil.hideNumber(phoneNo, start: start, end: end, replacement: replacement);

  /// 替换字符串
  String replace(String text, Pattern from, String replacement) => TextUtil.replace(text, from, replacement);

  /// 按指定模式分割字符串
  List<String> split(String text, Pattern pattern) => TextUtil.split(text, pattern);

  /// 反转字符串
  String reverse(String text) => TextUtil.reverse(text);
}
