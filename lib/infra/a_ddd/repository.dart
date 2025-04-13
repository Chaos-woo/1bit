/// 在领域模型中代表存储库的基类。
///
/// 资源库为数据访问和持久化提供了一个抽象概念。它们处理检索
/// 以及聚合和实体的存储，将领域逻辑与数据访问逻辑分离开来。
///
/// 示例用法：
/// ```dart
/// class UserRepository extends Repository {
///   User? findById(String id) {
///     // 通过 ID 检索用户
///   }
///
///   void save(User user) {
///     // 保存用户
///   }
/// }
/// ```
/// 在本例中，`UserRepository`提供了查找和保存`用户`实体的方法。
abstract class Repository {}
