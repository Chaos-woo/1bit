/// 表示错误或验证失败的基类，带有相关信息。
///
/// 该类用于封装各类验证失败的错误信息。
/// `Failure`的每个子类都应代表一种特定的故障，并提供
/// 一个静态的 `validator` 函数，用于执行验证逻辑。
///
/// 示例用法：
/// ```dart
/// class CustomFailure extends Failure {
///   CustomFailure() : super('__custom_failure_message__')；
///
///   static CustomFailure? validator(String value) {
///     // 自定义验证逻辑
///     return value.isEmpty ?CustomFailure() : null；
///   }
/// }
/// ```
/// 在本例中，`CustomFailure`是`Failure`的子类，具有特定的验证逻辑。
/// ```
class Failure {
  final String message;

  Failure(this.message);
}
