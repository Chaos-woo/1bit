import 'dart:async';

import 'package:flutter/foundation.dart';

/// 延时回调函数
typedef DelayCallback<R> = R Function();

/// 延时工具
class Delay {
  /// 延时执行回调函数
  Future<void> run(VoidCallback callback) => until(callback);

  /// 延时执行回调函数, 可以指定延时时间
  Future<void> until(
    VoidCallback callback, {
    Duration? duration,
  }) =>
      Future.delayed(duration ?? Duration.zero).whenComplete(callback);

  /// 延时执行回调函数, 可以指定延时时间, 并返回回调函数的返回值
  Future<R> runCall<R>(
    DelayCallback<R> callable, {
    Duration? duration,
  }) async =>
      await Future<R>.delayed(duration ?? Duration.zero).whenComplete(callable);

  /// 定时器延时执行回调函数
  /// [callback] 回调函数
  /// [duration] 延时时间
  /// 返回一个[Timer]对象, 可以用来取消定时器
  Timer runTimer(VoidCallback callback, {required Duration duration}) {
    return Timer(duration, callback);
  }
}

extension DelayDurationExtension on Duration {
  /// 延时执行回调函数
  /// [callback] 回调函数
  Future<void> delayRun(VoidCallback callback) => Delay().run(callback);

  /// 延时执行回调函数, 可以指定延时时间
  /// [callback] 回调函数
  /// [duration] 延时时间
  Future<void> delayRunUntil(
    VoidCallback callback, {
    Duration? duration,
  }) =>
      Delay().until(callback, duration: this);

  /// 延时执行回调函数, 可以指定延时时间, 并返回回调函数的返回值
  /// [callable] 回调函数
  /// [duration] 延时时间
  Future<R> delayRunCall<R>(DelayCallback<R> callable, {Duration? duration}) async =>
      await Delay().runCall(callable, duration: this);

  /// 定时器延时执行回调函数
  Timer delayRunTimer(VoidCallback callback) {
    return Delay().runTimer(callback, duration: this);
  }
}
