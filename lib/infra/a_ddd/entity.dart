/// 代表领域模型中实体的基类。
///
/// 实体是具有独特身份的领域对象，主要由其
/// 身份而非属性。它们可以随时间改变属性，但仍会保持
/// 唯一可识别。
///
/// 示例用法：
/// ```dart
/// class User extends Entity {
///   final String id；
///   final String name；
///
///   User(this.id, this.name)；
/// }
/// ```
/// 在本例中，`用户`是一个实体，具有唯一标识符`id`和属性`name`。
abstract class Entity {}
