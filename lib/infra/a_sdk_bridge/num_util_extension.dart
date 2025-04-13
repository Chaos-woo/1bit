import 'package:decimal/decimal.dart';
import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:number_display/number_display.dart';

extension NumUtilBridge on NumUtil {
  /// [fractionDigits] 小数位数，参数必须是一个整数，满足： `0 <= fractionDigits <= 20`。
  num? getNumByStr(String valueStr, {int? fractionDigits}) =>
      NumUtil.getNumByValueStr(valueStr, fractionDigits: fractionDigits);

  /// [fractionDigits] 小数位数，参数必须是一个整数，满足： `0 <= fractionDigits <= 20`。
  num? getNumByDouble(double? value, int fractionDigits) => NumUtil.getNumByValueDouble(value, fractionDigits);

  /// 通过 valueStr 获取 int。
  int? getInt(String valueStr, {int? defaultValue = 0}) => NumUtil.getIntByValueStr(valueStr, defValue: defaultValue);

  /// 通过 valueStr 获取 double。
  double? getDouble(String valueStr, {double? defaultValue = 0}) =>
      NumUtil.getDoubleByValueStr(valueStr, defValue: defaultValue);

  /// 是否为零。
  bool isZero(num? value) => NumUtil.isZero(value);

  /// 加 (精确相加，防止精度丢失)。
  double addNum(num a, num b) => NumUtil.add(a, b);

  /// 减 (精确相减，防止精度丢失)。
  double subtract(num a, num b) => NumUtil.subtract(a, b);

  /// 乘 (精确相乘，防止精度丢失)。
  double multiply(num a, num b) => NumUtil.multiply(a, b);

  /// 除 (精确相除，防止精度丢失)。
  double divide(num a, num b) => NumUtil.divide(a, b);

  /// 加 (精确相加，防止精度丢失)。
  Decimal addDecimal(num a, num b) => NumUtil.addDec(a, b);

  /// 减 (精确相减，防止精度丢失)。
  Decimal subtractDecimal(num a, num b) => NumUtil.subtractDec(a, b);

  /// 乘 (精确相乘，防止精度丢失)。
  Decimal multiplyDecimal(num a, num b) => NumUtil.multiplyDec(a, b);

  /// 除 (精确相除，防止精度丢失)。
  Decimal divideDecimal(num a, num b) => NumUtil.divideDec(a, b);

  /// 余数
  Decimal remainderNum(num a, num b) => NumUtil.remainder(a, b);

  /// Relational less than operator.
  bool lt(num a, num b) => NumUtil.lessThan(a, b);

  /// 小于等于
  bool le(num a, num b) => NumUtil.thanOrEqual(a, b);

  /// 大于
  bool gt(num a, num b) => NumUtil.greaterThan(a, b);

  /// 大于等于
  bool ge(num a, num b) => NumUtil.greaterOrEqual(a, b);

  /// 加
  Decimal addDecimalStr(String a, String b) => NumUtil.addDecStr(a, b);

  /// 减
  Decimal subtractDecimalStr(String a, String b) => NumUtil.subtractDecStr(a, b);

  /// 乘
  Decimal multiplyDecimalStr(String a, String b) => NumUtil.multiplyDecStr(a, b);

  /// 除
  Decimal divideDecimalStr(String a, String b) => NumUtil.divideDecStr(a, b);

  /// 余数
  Decimal remainderDecimalStr(String a, String b) => NumUtil.remainderDecStr(a, b);

  /// 小于
  bool ltDecimalStr(String a, String b) => NumUtil.lessThanDecStr(a, b);

  /// 小于等于
  bool leDecimalStr(String a, String b) => NumUtil.thanOrEqualDecStr(a, b);

  /// 大于
  bool gtDecimalStr(String a, String b) => NumUtil.greaterThanDecStr(a, b);

  /// 大于等于
  bool geDecimalStr(String a, String b) => NumUtil.greaterOrEqualDecStr(a, b);

  /// 构建紧凑数字展示配置
  Display buildCompactNumDisplayConfig({
    int length = 9,
    int? decimal,
    String placeholder = '',
    String? separator = ',',
    String? decimalPoint = '.',
    RoundingType roundingType = RoundingType.round,
    List<String> units = const ['k', 'M', 'G', 'T', 'P'],
  }) {
    return createDisplay(
      length: length,
      decimal: decimal,
      placeholder: placeholder,
      separator: separator,
      decimalPoint: decimalPoint,
      roundingType: roundingType,
      units: units,
    );
  }

  /// 紧凑数字展示
  String compact(num number, {Display? displayConfig}) {
    return (null == displayConfig ? buildCompactNumDisplayConfig().call(number) : displayConfig(number));
  }

  /// 紧凑数字展示
  String stringCompact(String numberStr, {int? radix, Display? displayConfig}) {
    int? number = int.tryParse(numberStr, radix: radix);
    return (null == displayConfig ? buildCompactNumDisplayConfig().call(number) : displayConfig(number));
  }
}
