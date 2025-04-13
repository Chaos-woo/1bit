/// 用于创建聚合体或实体实例的工厂的基类。
///
/// 工厂负责管理创建集合体实例所需的复杂逻辑
/// 或实体。它们确保这些实例被正确初始化，并遵守所需的
/// 不变量和约束条件。工厂抽象掉了创建细节，提供了一个集中的
/// 管理对象创建的地方。
///
/// 示例用法：
/// ```dart
/// class UserFactory extends Factory {
///   User create(String id, String name) {
//    // 封装创建用户实例的逻辑，并进行必要的验证
///    return User(id, name)；
///   }
/// }
/// ```
abstract class Factory {}
