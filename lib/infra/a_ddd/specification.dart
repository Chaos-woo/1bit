/// 用于定义封装业务规则或标准的规范的基类。
///
/// 规范用于评估实体、集合或值对象是否符合特定的
/// 业务规则或条件。它们提供了定义和组合规则的可重用方式，允许
/// 灵活、动态的验证逻辑。
///
/// 规范可应用于实体，以检查它们是否满足特定条件，也可应用于集合体，以检查它们是否满足特定条件。
/// 在多个相关实体间执行规则，或对对象进行估值以验证其状态。
///
/// 示例用法：
/// ```dart
/// class AgeSpecification extends Specification<User> {
///   final int minimumAge；
///
///   AgeSpecification(this.minimumAge)；
///
///   @override
///   bool isSatisfiedBy(User user) {
///     // 检查用户年龄是否大于或等于最低要求年龄
///     return user.age >= minimumAge；
///   }
/// }
/// ```
abstract class Specification<T> {
  bool isSatisfiedBy(T candidate);
}
