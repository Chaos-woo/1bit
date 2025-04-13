/// 在领域模型中代表服务的基类。
///
/// 服务封装了无法自然融入实体或聚合的领域逻辑。
/// 它们提供了领域模型所需的操作和功能，但这些操作和功能并不是
/// 针对任何单一实体或集合体。
///
/// 示例用法：
/// ```dart
/// class UserService extends Service {
///   void registerUser(String username, String email) {
///     // 注册新用户
///   }
/// }
/// ```
/// 在此示例中，`用户服务` 提供了一个注册新用户的方法，封装了以下业务
/// 独立于任何单一实体或集合体的逻辑。
abstract class Service {}
