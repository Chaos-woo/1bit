/// 用于域模型和数据传输对象（DTO）之间映射的基类。
///
/// 映射器便于在领域模型和 DTO 或数据库模型之间转换数据。
/// 它们提供了在不同数据表示之间进行转换的方法，确保领域模型
/// 和 DTO 适当集成。
///
/// 示例用法：
/// ```dart
/// class UserMapper extends Mapper {
/// UserDTO toDTO(User user) {
/// // 将用户域模型转换为 UserDTO
/// return UserDTO(user.id, user.name)；
/// }
///
/// User fromDTO(UserDTO dto) {
/// // 将 UserDTO 转换回用户域模型
/// return User(dto.id, dto.name)；
/// }
/// }
/// ```
abstract class Mapper<EntityType, DTOType> {
  DTOType toDTO(EntityType entity);

  EntityType fromDTO(DTOType dto);
}
