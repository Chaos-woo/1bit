
import 'package:flustars_flutter3/flustars_flutter3.dart';

extension JsonUtilBridge on JsonUtil {
  /// Converts object [value] to a JSON string.
  String? encodeObj(dynamic value) => JsonUtil.encodeObj(value);

  /// Converts JSON string [source] to object.
  T? getObj<T>(String? source, T Function(Map v) convertor) => JsonUtil.getObj<T>(source, convertor);

  /// Converts JSON string or JSON map [source] to object.
  T? getObject<T>(dynamic source, T Function(Map v) convertor) => JsonUtil.getObject<T>(source, convertor);

  /// Converts JSON string list [source] to object list.
  List<T>? getObjList<T>(String? source, T Function(Map v) convertor) => JsonUtil.getObjList<T>(source, convertor);

  /// Converts JSON string or JSON map list [source] to object list.
  List<T>? getObjectList<T>(dynamic source, T Function(Map v) convertor) => JsonUtil.getObjectList<T>(source, convertor);

  /// get List
  /// [1, 2, 3, 4, 5, 6];
  /// "[\"tom\",\"tony\",\"jacky\"]";
  List<T>? getList<T>(dynamic source) => JsonUtil.getList<T>(source);
}