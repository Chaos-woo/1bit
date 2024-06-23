import 'dart:async';

import 'package:event_bus/event_bus.dart';
import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:qkit/qkit.dart';

class QEventBus {
  static final EventBus _bus = EventBus();

  /// 立即触发一个事件
  Future<void> publish<T>(T event) async => _bus.fire(event);

  /// 在dart单线程时间循环的下一个循环触发一个事件
  Future<void> publishImmediately<T>(T event) async {
    Future.delayed(
      Duration.zero,
      () => _bus.fire(event),
    );
  }

  /// 延时[duration]后触发一个事件
  Future<void> publishDelay<T>(T event, {Duration? duration}) async {
    Future.delayed(
      duration ?? Duration.zero,
      () => _bus.fire(event),
    );
  }

  /// 订阅T类型事件，并在异常错误时自动取消订阅
  StreamSubscription subscribeAutoCancelOnError<T>(
    void Function(T event) onData, {
    Function? onError,
    void Function()? onDone,
  }) {
    return subscribe<T>(
      onData,
      onError: onError,
      onDone: onDone,
      cancelOnError: true,
    );
  }

  /// 订阅T类型事件
  StreamSubscription subscribe<T>(
    void Function(T event) onData, {
    Function? onError,
    void Function()? onDone,
    bool? cancelOnError,
  }) {
    StreamSubscription subscription = _bus.on<T>().listen(
          onData,
          onError: onError,
          onDone: onDone,
          cancelOnError: cancelOnError,
        );
    return subscription;
  }

  void log<T extends SubscribeEvent>(T e, {required String usage, String? dateFormat}) {
    PPLog.singl.debug(
      '接收【${e.publisher}\\.${e.runtimeType}】(${QKit.bridge.flustars.date.formatDate(
        e.timestamp,
        format: dateFormat ?? DateFormats.full,
      )})，用途：【$usage】',
    );
  }
}

abstract class SubscribeEvent {
  final String publisher;
  late final DateTime timestamp;

  SubscribeEvent(this.publisher) {
    timestamp = DateTime.now();
  }
}
