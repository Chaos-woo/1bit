import 'package:flutter/foundation.dart';

extension ListMultiSortExtension on List {
  /// @param rawPropsAscCriteria  升降序标准：升序为true，降序为false
  /// @param rawProps             类属姓名
  multiPropSort(List<bool> rawPropsAscCriteria, dynamic rawProps) {
    if (rawProps.length == 0 || rawPropsAscCriteria.isEmpty || isEmpty) {
      return this;
    }
    if (rawProps.length != rawPropsAscCriteria.length) {
      debugPrint('Criteria length is not equal to rawProps');
      return this;
    }

    sort((a, b) => _sortAll(a, b, rawPropsAscCriteria, rawProps));
  }
}

// 所有属性比较，直到传入的最后一个属性
int _sortAll(a, b, List<bool> rawPropsAscCriteria, dynamic rawProps) {
  int i = 0, result = 0; // 默认相等
  while (i < rawProps.length) {
    result = _compare(i, a, b, rawPropsAscCriteria, rawProps);
    if (result != 0) break;
    i++;
  }
  return result;
}

/// 比较a和b的第i个属性
/// 若a的i属性为null时，则默认b大于的情况，反之
int _compare(int i, dynamic a, dynamic b, List<bool> rawPropsAscCriteria, dynamic rawProps) {
  if (a.get(rawProps[i]) == null && b.get(rawProps[i]) == null) {
    return 0;
  }

  if (a.get(rawProps[i]) == null) {
    return rawPropsAscCriteria[i] ? -1 : 1;
  }

  if (b.get(rawProps[i]) == null) {
    return rawPropsAscCriteria[i] ? 1 : -1;
  }

  if (a.get(rawProps[i]) is DateTime && b.get(rawProps[i]) is DateTime) {
    DateTime dateA = a.get(rawProps[i]);
    DateTime dateB = b.get(rawProps[i]);

    if (dateA.compareTo(dateB) == 0) {
      return 0;
    } else if (dateA.isAfter(dateB)) {
      return rawPropsAscCriteria[i] ? 1 : -1;
    } else {
      return rawPropsAscCriteria[i] ? -1 : 1;
    }
  }

  if (a.get(rawProps[i]) is String && b.get(rawProps[i]) is String) {
    String stringA = a.get(rawProps[i]);
    String stringB = b.get(rawProps[i]);

    return stringA.compareTo(stringB);
  }

  if (a.get(rawProps[i]) == b.get(rawProps[i])) {
    return 0;
  } else if (a.get(rawProps[i]) > b.get(rawProps[i])) {
    return rawPropsAscCriteria[i] ? 1 : -1;
  } else {
    return rawPropsAscCriteria[i] ? -1 : 1;
  }
}
