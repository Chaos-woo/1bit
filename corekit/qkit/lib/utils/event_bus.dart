import 'dart:async';

import 'package:event_bus/event_bus.dart';
import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:qkit/qkit.dart';

class Eventbus {
  static final EventBus _bus = EventBus();

  /// 立即触发一个事件
  Future<void> publish<T>(T event) async => _bus.fire(event);

  /// 在dart单线程时间循环的下一个循环触发一个事件
  Future<void> publish_immediately<T>(T event) async {
    Future.delayed(
      Duration.zero,
      () => _bus.fire(event),
    );
  }

  /// 延时[duration]后触发一个事件
  Future<void> publish_delay<T>(T event, {Duration? duration}) async {
    Future.delayed(
      duration ?? Duration.zero,
      () => _bus.fire(event),
    );
  }

  /// 订阅T类型事件，并在异常错误时自动取消订阅
  StreamSubscription subscribe_cancelable_if_error<T>(
    void Function(T event) on_data, {
    Function? on_error,
    void Function()? on_done,
  }) {
    return subscribe<T>(
      on_data,
      on_error: on_error,
      on_done: on_done,
      cancel_on_error: true,
    );
  }

  /// 订阅T类型事件
  StreamSubscription subscribe<T>(
    void Function(T event) on_data, {
    Function? on_error,
    void Function()? on_done,
    bool? cancel_on_error,
  }) {
    StreamSubscription subscription = _bus.on<T>().listen(
          on_data,
          onError: on_error,
          onDone: on_done,
          cancelOnError: cancel_on_error,
        );
    return subscription;
  }

  void log<T extends SubscribeEvent>(T e, {String? date_format}) {
    PPLog.singl.debug(
      '接收【${e.publisher}\\.${e.runtimeType}】(${q0_.bridge.flustars.date.format_date(
        e.timestamp,
        format: date_format ?? DateFormats.full,
      )})，发布原因：${e.publish_reason}',
    );
  }
}

abstract class SubscribeEvent {
  final String publisher;
  final String publish_reason;
  late final DateTime timestamp;

  SubscribeEvent(this.publisher, this.publish_reason) {
    timestamp = DateTime.now();
  }
}
