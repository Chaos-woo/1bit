import 'package:decimal/decimal.dart';
import 'package:flustars_flutter3/flustars_flutter3.dart';

extension NumUtilBridge on NumUtil {
  /// The parameter [fractionDigits] must be an integer satisfying: `0 <= fractionDigits <= 20`.
  num? getNumByValueStr(String valueStr, {int? fractionDigits}) =>
      NumUtil.getNumByValueStr(valueStr, fractionDigits: fractionDigits);

  /// The parameter [fractionDigits] must be an integer satisfying: `0 <= fractionDigits <= 20`.
  num? getNumByValueDouble(double? value, int fractionDigits) => NumUtil.getNumByValueDouble(value, fractionDigits);

  /// get int by value str.
  int? getIntByValueStr(String valueStr, {int? defValue = 0}) => NumUtil.getIntByValueStr(valueStr, defValue: defValue);

  /// get double by value str.
  double? getDoubleByValueStr(String valueStr, {double? defValue = 0}) =>
      NumUtil.getDoubleByValueStr(valueStr, defValue: defValue);

  ///isZero
  bool isZero(num? value) => NumUtil.isZero(value);

  /// 加 (精确相加,防止精度丢失).
  /// add (without loosing precision).
  double add(num a, num b) => NumUtil.add(a, b);

  /// 减 (精确相减,防止精度丢失).
  /// subtract (without loosing precision).
  double subtract(num a, num b) => NumUtil.subtract(a, b);

  /// 乘 (精确相乘,防止精度丢失).
  /// multiply (without loosing precision).
  double multiply(num a, num b) => NumUtil.multiply(a, b);

  /// 除 (精确相除,防止精度丢失).
  /// divide (without loosing precision).
  double divide(num a, num b) => NumUtil.divide(a, b);

  /// 加 (精确相加,防止精度丢失).
  /// add (without loosing precision).
  Decimal addDec(num a, num b) => NumUtil.addDec(a, b);

  /// 减 (精确相减,防止精度丢失).
  /// subtract (without loosing precision).
  Decimal subtractDec(num a, num b) => NumUtil.subtractDec(a, b);

  /// 乘 (精确相乘,防止精度丢失).
  /// multiply (without loosing precision).
  Decimal multiplyDec(num a, num b) => NumUtil.multiplyDec(a, b);

  /// 除 (精确相除,防止精度丢失).
  /// divide (without loosing precision).
  Decimal divideDec(num a, num b) => NumUtil.divideDec(a, b);

  /// 余数
  Decimal remainder(num a, num b) => NumUtil.remainder(a, b);

  /// Relational less than operator.
  bool lessThan(num a, num b) => NumUtil.lessThan(a, b);

  /// Relational less than or equal operator.
  bool thanOrEqual(num a, num b) => NumUtil.thanOrEqual(a, b);

  /// Relational greater than operator.
  bool greaterThan(num a, num b) => NumUtil.greaterThan(a, b);

  /// Relational greater than or equal operator.
  bool greaterOrEqual(num a, num b) => NumUtil.greaterOrEqual(a, b);

  /// 加
  Decimal addDecStr(String a, String b) => NumUtil.addDecStr(a, b);

  /// 减
  Decimal subtractDecStr(String a, String b) => NumUtil.subtractDecStr(a, b);

  /// 乘
  Decimal multiplyDecStr(String a, String b) => NumUtil.multiplyDecStr(a, b);

  /// 除
  Decimal divideDecStr(String a, String b) => NumUtil.divideDecStr(a, b);

  /// 余数
  Decimal remainderDecStr(String a, String b) => NumUtil.remainderDecStr(a, b);

  /// Relational less than operator.
  bool lessThanDecStr(String a, String b) => NumUtil.lessThanDecStr(a, b);

  /// Relational less than or equal operator.
  bool thanOrEqualDecStr(String a, String b) => NumUtil.thanOrEqualDecStr(a, b);

  /// Relational greater than operator.
  bool greaterThanDecStr(String a, String b) => NumUtil.greaterThanDecStr(a, b);

  /// Relational greater than or equal operator.
  bool greaterOrEqualDecStr(String a, String b) => NumUtil.greaterOrEqualDecStr(a, b);
}
