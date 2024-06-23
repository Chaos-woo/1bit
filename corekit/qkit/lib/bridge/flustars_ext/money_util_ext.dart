
import 'package:flustars_flutter3/flustars_flutter3.dart';

extension QBridgeMoneyUtilExt on MoneyUtil {
  /// fen to yuan, format output.
  /// 分 转 元, format格式输出.
  String changeF2Y(int amount,
      {MoneyFormat format = MoneyFormat.NORMAL}) => MoneyUtil.changeF2Y(amount, format: format);

  /// fen str to yuan, format & unit  output.
  /// 分字符串 转 元, format 与 unit 格式 输出.
  String changeFStr2YWithUnit(String amountStr,
      {MoneyFormat format = MoneyFormat.NORMAL,
        MoneyUnit unit = MoneyUnit.NORMAL}) => MoneyUtil.changeFStr2YWithUnit(amountStr, format: format, unit: unit);

  /// fen to yuan, format & unit  output.
  /// 分 转 元, format 与 unit 格式 输出.
  String changeF2YWithUnit(int amount,
      {MoneyFormat format = MoneyFormat.NORMAL,
        MoneyUnit unit = MoneyUnit.NORMAL}) => MoneyUtil.changeF2YWithUnit(amount, format: format, unit: unit);

  /// yuan, format & unit  output.(yuan is int,double,str).
  /// 元, format 与 unit 格式 输出.
  String changeYWithUnit(Object yuan, MoneyUnit unit,
      {MoneyFormat? format}) => MoneyUtil.changeYWithUnit(yuan, unit, format: format);

  /// yuan to fen.F
  /// 元 转 分，
  int changeY2F(Object yuan) => MoneyUtil.changeY2F(yuan);

  /// with unit.
  /// 拼接单位.
  String withUnit(String moneyTxt, MoneyUnit unit) => MoneyUtil.withUnit(moneyTxt, unit);

}