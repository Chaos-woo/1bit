/// 表示域事件的基类。
///
/// 域事件用于表示域中发生了重要事件。它们是
/// 通常用于触发副作用、更新其他聚合体或与外部系统通信。
///
/// 示例用法：
/// ```dart
/// class OrderPlacedEvent extends DomainEvent {
///   final Order order；
///
///   OrderPlacedEvent(this.order)；
/// }
/// ```
/// 在此示例中，`OrderPlacedEvent` 是一个域事件，表示已下订单。
abstract class DomainEvent {
  final String publisher;
  final DateTime timestamp = DateTime.now();

  DomainEvent({required this.publisher});
}
