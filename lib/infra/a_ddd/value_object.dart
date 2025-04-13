import 'package:cw2bit/infra/a_ddd/failure.dart';

/// 表示具有验证逻辑的值对象的基类。
///
/// 值对象是领域驱动设计（DDD）中的一个核心概念，它封装了一个值。
/// 及其相关的验证规则。该类允许您定义值对象
///具有特定的验证要求，并提供了检查
/// 数值并检索验证错误。
///
/// [T] 通用类型代表被封装值的类型。
///
/// 示例用法：
/// ```dart
/// class Email extends ValueObject<String> {
///   Email(String email) : super(email, validators: [validateEmail])；
///
///   static Failure? validateEmail(String email) {
///     // 电子邮件的验证逻辑
///     return email.contains('@') ? null : Failure('Invalid email address')；
///   }
/// }
/// ```
/// 在本例中，`Email` 扩展了 `ValueObject<String>` 并使用了自定义验证器函数
/// 检查电子邮件值是否有效。
///
/// 该类提供
/// - `failures`：代表任何验证错误的 [Failure] 实例列表。
/// - `isValid`：布尔值，表示值是否有效（即没有验证错误）。
/// - `isNotValid`：布尔值，表示值是否无效（即存在验证错误）。
/// - `firstFailureMessage`：包含第一个验证错误信息的字符串，如果没有错误则为空。
abstract class ValueObject<T> {
  final T value;

  final List<Failure? Function(T)> validators;

  List<Failure> get failures => validators.map((validator) => validator(value)).whereType<Failure>().toList();

  bool get isValid => failures.isEmpty;

  bool get isNotValid => !isValid;

  String get firstFailureMessage => failures.isEmpty ? '' : failures.first.message;

  ValueObject(this.value, {this.validators = const []});
}
