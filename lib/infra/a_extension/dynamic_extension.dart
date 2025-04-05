extension DynamicExtension on dynamic {
  /// 判断是否是基本类型
  bool isDartBaseType() {
    return runtimeType is String || runtimeType is double || runtimeType is bool || runtimeType is int;
  }
}
