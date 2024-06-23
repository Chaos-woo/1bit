import 'package:flutter/foundation.dart';

/// 延时工具
class QDelay {
  Future<void> delay(VoidCallback callback) => delayAny(callback);

  Future<void> delayAny(
    VoidCallback callback, {
    Duration? duration,
  }) =>
      Future.delayed(duration ?? Duration.zero).whenComplete(callback);

  Future<R> delayReturn<R>(
    TinyDelayCallback<R> callable, {
    Duration? duration,
  }) async =>
      await Future<R>.delayed(duration ?? Duration.zero).whenComplete(callable);
}

typedef TinyDelayCallback<R> = R Function();
