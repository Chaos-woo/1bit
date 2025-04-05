/// 表示数据传输对象（DTO）的基类。
///
/// DTO 用于在不同层或系统之间传输数据。它们通常是简单的数据
/// 没有任何业务逻辑或行为的容器。
///
/// 示例用法：
/// ```dart
/// class UserDTO extends DTO {
///   final String username；
///   final String email；
///
///   UserDTO(this.username, this.email)；
/// }
/// ```
/// 在本例中，`UserDTO` 用于在应用程序的不同层之间传输用户数据。
abstract class DTO {}
