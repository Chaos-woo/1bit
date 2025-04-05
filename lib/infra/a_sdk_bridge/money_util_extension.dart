import 'package:flustars_flutter3/flustars_flutter3.dart';

extension MoneyUtilBridge on MoneyUtil {
  /// 分 转 元, format格式输出.
  String changeF2y(int amount, {MoneyFormat format = MoneyFormat.NORMAL}) =>
      MoneyUtil.changeF2Y(amount, format: format);

  /// 分字符串 转 元, format 与 unit 格式 输出.
  String changeFStr2YWithUnit(String amountStr,
          {MoneyFormat format = MoneyFormat.NORMAL, MoneyUnit unit = MoneyUnit.NORMAL}) =>
      MoneyUtil.changeFStr2YWithUnit(amountStr, format: format, unit: unit);

  /// 分 转 元, format 与 unit 格式 输出.
  String changeF2YWithUnit(int amount, {MoneyFormat format = MoneyFormat.NORMAL, MoneyUnit unit = MoneyUnit.NORMAL}) =>
      MoneyUtil.changeF2YWithUnit(amount, format: format, unit: unit);

  /// 元, format 与 unit 格式 输出.
  String changeYWithUnit(Object yuan, MoneyUnit unit, {MoneyFormat? format}) =>
      MoneyUtil.changeYWithUnit(yuan, unit, format: format);

  /// 元 转 分，
  int changeY2f(Object yuan) => MoneyUtil.changeY2F(yuan);

  /// 拼接单位.
  String withUnit(String moneyText, MoneyUnit unit) => MoneyUtil.withUnit(moneyText, unit);
}
