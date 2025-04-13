import 'dart:async';

import 'package:cw2bit/infra/INK/INKs.dart';
import 'package:cw2bit/infra/a_ddd/domain_event.dart';
import 'package:cw2bit/infra/a_sdk_bridge/date_util_extension.dart';
import 'package:event_bus/event_bus.dart';
import 'package:flustars_flutter3/flustars_flutter3.dart';

final class INKEventDispatcher {
  static final EventBus _bus = EventBus();

  /// 立即触发一个事件
  Future<void> publish<T extends DomainEvent>(T event) async => _bus.fire(event);

  /// 延时[duration]后触发一个事件
  Future<void> publishDelay<T extends DomainEvent>(T event, {Duration? duration}) async {
    INKs.tool.delay.until(
      () => _bus.fire(event),
      duration: duration,
    );
  }

  /// 订阅
  StreamSubscription subscribe<T extends DomainEvent>(
    void Function(T event) onData, {
    Function? onError,
    void Function()? onDone,
    bool cancelOnError = true,
  }) {
    wrapOnData(event) {
      INKs.log.info('''
      Received event(#${event.runtimeType}#) from #${event.publisher}# at ${INKs.sdk.date.formatDate(event.timestamp, format: DateFormats.full)}
      ''');

      onData.call(event);
    }

    return _bus.on<T>().listen(
          wrapOnData,
          onError: onError,
          onDone: onDone,
          cancelOnError: cancelOnError,
        );
  }
}
