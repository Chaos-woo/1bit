import 'package:cw2bit/infra/a_value/sort_value.dart';

extension FutureUnwrap<T> on Future<T?> {
  /// 剔除为空的值
  Future<T> filteredIsNull() => then(
        (value) => value != null ? Future<T>.value(value) : Future.any([]),
      );
}

extension StreamUnwrap<T> on Stream<T?> {
  /// 剔除为空的值
  Stream<T> filteredIsNull() => where((event) => event != null).cast();
}

extension Flatten<T extends Object> on Iterable<T> {
  /// 展平所有元素
  Iterable<T> flatten() {
    Iterable<T> localFlatten(Iterable<T> list) sync* {
      for (final value in list) {
        if (value is List<T>) {
          yield* localFlatten(value);
        } else {
          yield value;
        }
      }
    }

    return localFlatten(this);
  }
}

extension InlineAdd<T> on Iterable<T> {
  /// 添加新元素
  Iterable<T> operator +(T other) => followedBy([other]);

  /// 批量添加新元素
  Iterable<T> operator &(Iterable<T> other) => followedBy(other);
}

extension CompactMap<T> on Iterable<T?> {
  /// 剔除为空的值
  /// [transform]函数有1次机会进行数值转换，可把非NULL值转为NULL，或把NULL值转为非NULL值
  Iterable<T> compactMap<E>([
    E? Function(T?)? transform,
  ]) =>
      map(transform ?? (e) => e).where((e) => e != null).cast();
}

extension DetailedWhere<K, V> on Map<K, V> {
  /// 接受一个函数作为参数，该函数接受 Map 的键和值作为参数，并返回一个布尔值。
  Map<K, V> where(bool Function(K key, V value) f) => Map<K, V>.fromEntries(
        entries.where((entry) => f(entry.key, entry.value)),
      );

  /// 接受一个只接受键作为参数的函数。
  Map<K, V> whereKey(bool Function(K key) f) => {...where((key, value) => f(key))};

  /// 这个方法接受一个只接受值作为参数的函数。
  Map<K, V> whereValue(bool Function(V value) f) => {...where((key, value) => f(value))};

  /// 合并两个Map，并且key相同时，保留原有Map的值
  Map<K, V> operator |(Map<K, V> other) => {...this}..addEntries(other.entries);

  /// 合并两个Map，并且key相同时，保留新Map的值
  Map<K, V> operator &(Map<K, V> other) {
    other.forEach((key, value) => update(key, (original) => value, ifAbsent: () => value));
    return this;
  }
}

extension IterableToMap<T> on Iterable<T> {
  /// 根据条件转为Map
  Map<K, List<V>> toMap<K, V>(
    K Function(T element) keySelector,
    V Function(T element) valueSelector, {
    V Function(V oldValue, V newValue)? merged,
  }) {
    final result = <K, List<V>>{};
    for (final element in this) {
      final k = keySelector(element);
      if (result.containsKey(k)) {
        final list = result[k]!;
        var newValue = valueSelector(element);
        if (list.contains(newValue)) {
          if (merged != null) {
            var oldValue = list[list.indexOf(newValue)];
            var mergedValue = merged(oldValue, newValue);
            list[list.indexOf(newValue)] = mergedValue;
          } else {
            // 不存在合并函数时，默认使用存在的value，不进行新值的处理
          }
        } else {
          list.add(newValue);
          result[k] = list;
        }
      } else {
        result[k] = [valueSelector(element)];
      }
    }
    return result;
  }

  /// 根据条件转为Map，并且只保留第一个元素
  Map<K, V> toMapFirst<K, V>(K Function(T element) keySelector, V Function(T element) valueSelector) {
    var result = toMap(keySelector, valueSelector);
    Map<K, V> merged = {};
    result.forEach((key, value) {
      merged[key] = value.first;
    });
    return merged;
  }

  /// 根据条件转为Map，并且只保留最后一个元素
  Map<K, V> toMapLast<K, V>(K Function(T element) keySelector, V Function(T element) valueSelector) {
    var result = toMap(keySelector, valueSelector);
    Map<K, V> merged = {};
    result.forEach((key, value) {
      merged[key] = value.last;
    });
    return merged;
  }
}

extension DynamicAs on dynamic {
  T forceAs<T>() {
    return this as T;
  }
}

extension IterableSort<T extends Comparable> on Iterable<T> {
  /// 自定义排序
  /// [criteria]: 排序规则，默认使用自然顺序比较，顺序按照自定义排序规则执行
  Iterable<T> sorted([List<ObjectSortCriteria<T>>? criteria]) => List<T>.from(this)
    ..sort((a, b) {
      for (var rule in criteria ?? []) {
        int result = rule.compare(a, b);
        if (result != 0) {
          return rule.criteria == SortCriteria.ascending ? result : -result;
        }
      }

      return a.compareTo(b);
    });
}

extension IterableSplit<T> on Iterable<T> {
  /// 将序列中的元素按照固定个数分为多个部分
  List<List<T>> split(int size) {
    if (size <= 0) {
      throw ArgumentError('Size must be greater than zero');
    }
    List<List<T>> result = [];
    List<T> currentChunk = [];
    for (var item in this) {
      currentChunk.add(item);
      if (currentChunk.length == size) {
        result.add(currentChunk);
        currentChunk = [];
      }
    }
    if (currentChunk.isNotEmpty) {
      result.add(currentChunk);
    }
    return result;
  }
}
