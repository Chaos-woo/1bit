/// 在领域模型中代表聚合体的基类。
///
/// 聚合体是域实体和值对象的集合体，它们被视为一个整体。
/// 它们执行业务规则并封装领域逻辑。聚合可确保
/// 通过管理事务和状态变化来管理它们的边界。
///
/// 示例用法：
/// ```dart
/// class OrderAggregate extends Aggregate {
///   final Order order；
///   final List<OrderItem> items；
///
///   OrderAggregate(this.order, this.items)；
///
///   void addItem(OrderItem item) {
///     // 添加项目逻辑
///   }
/// }
/// ```
/// 在本例中，"OrderAggregate "将 "订单 "和 "订单项目 "列表作为一个整体进行管理。
abstract class Aggregate {}
