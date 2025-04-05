import 'package:flustars_flutter3/flustars_flutter3.dart';

extension JsonUtilBridge on JsonUtil {
  /// 将对象 [value] 转换为 JSON 字符串。
  String? encodeObj(dynamic value) => JsonUtil.encodeObj(value);

  /// 将 JSON 字符串 [source] 转换为对象。
  T? getObj<T>(String? source, T Function(Map v) convertor) => JsonUtil.getObj<T>(source, convertor);

  /// 将 JSON 字符串或 JSON Map [source] 转换为对象。
  T? getObject<T>(dynamic source, T Function(Map v) convertor) => JsonUtil.getObject<T>(source, convertor);

  /// 将 JSON 字符串列表 [source] 转换为对象列表。
  List<T>? getObjList<T>(String? source, T Function(Map v) convertor) => JsonUtil.getObjList<T>(source, convertor);

  /// 将 JSON 字符串或 JSON Map 列表 [source] 转换为对象列表。
  List<T>? getObjectList<T>(dynamic source, T Function(Map v) convertor) =>
      JsonUtil.getObjectList<T>(source, convertor);

  /// 获取List 例如[1, 2, 3, 4, 5, 6]; 或者"[\"tom\",\"tony\",\"jacky\"]";
  List<T>? getList<T>(dynamic source) => JsonUtil.getList<T>(source);
}
