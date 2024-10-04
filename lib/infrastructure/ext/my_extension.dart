extension FutureUnwrap<T> on Future<T?> {
  /// 剔除为空的值
  Future<T> filteredNull() => then(
        (value) => value != null ? Future<T>.value(value) : Future.any([]),
      );
}

extension StreamUnwrap<T> on Stream<T?> {
  /// 剔除为空的值
  Stream<T> filteredNull() => where((event) => event != null).cast();
}

extension Flatten<T extends Object> on Iterable<T> {
  /// 展平所有元素
  Iterable<T> flatten() {
    Iterable<T> _flatten(Iterable<T> list) sync* {
      for (final value in list) {
        if (value is List<T>) {
          yield* _flatten(value);
        } else {
          yield value;
        }
      }
    }

    return _flatten(this);
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
