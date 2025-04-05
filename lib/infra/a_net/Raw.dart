class Raw {
  dynamic raw;

  Raw._();

  Raw.data(this.raw);

  T data<T>(T Function(Map<String, dynamic>) transformer) {
    if (raw is T) {
      return raw;
    }
    return transformer(raw as Map<String, dynamic>);
  }

  T as<T>() => raw as T;

  T dataOrThrow<T>(T Function(Map<String, dynamic>) transformer) {
    try {
      return data(transformer);
    } catch (e) {
      rethrow;
    }
  }
}
