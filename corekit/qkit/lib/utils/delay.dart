import 'dart:async';

import 'package:flutter/foundation.dart';

/// 延时工具
class Delayer {
  Future<void> delay(VoidCallback callback) => delay_any(callback);

  Future<void> delay_any(
    VoidCallback callback, {
    Duration? duration,
  }) =>
      Future.delayed(duration ?? Duration.zero).whenComplete(callback);

  Future<R> delay_return<R>(
    TinyDelayCallback<R> callable, {
    Duration? duration,
  }) async =>
      await Future<R>.delayed(duration ?? Duration.zero).whenComplete(callable);

  Timer delay_timer(VoidCallback callback, {required Duration duration}) {
    return Timer(duration, callback);
  }
}

typedef TinyDelayCallback<R> = R Function();
