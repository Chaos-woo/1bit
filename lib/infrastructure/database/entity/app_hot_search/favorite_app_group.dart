import 'package:cw2bit/infrastructure/database/ra1db.dart';
import 'package:drift/drift.dart';
import 'package:drift_model_generator/drift_model_generator.dart';

part 'favorite_app_group.driftm.dart';

/// 各应用网站热搜APP的本地APP收藏组
@UseDrift(
  useSnakeCase: true,
)
class FavoriteAppGroup {
  @AutoIncrement()
  final int? id;

  @NotNull()
  final String name;

  @WithDefault('now()')
  @NotNull()
  final DateTime createTime;

  @NotNull()
  @WithDefault(0)
  final int order;

  FavoriteAppGroup({
    required this.id,
    required this.name,
    required this.createTime,
    required this.order,
  });
}
