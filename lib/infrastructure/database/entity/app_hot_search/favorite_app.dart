import 'package:cw2bit/infrastructure/database/r1db.dart';
import 'package:drift/drift.dart';
import 'package:drift_model_generator/drift_model_generator.dart';

part 'favorite_app.driftm.dart';

/// 各应用网站热搜APP的本地APP收藏
@UseDrift(
  useSnakeCase: true,
)
class FavoriteApp {
  @AutoIncrement()
  final int? id;

  @NotNull()
  final String name;

  @WithDefault('now()')
  @NotNull()
  final DateTime create_time;

  @NotNull()
  final int group_id;

  @NotNull()
  @WithDefault(0)
  final int order;

  FavoriteApp({
    required this.id,
    required this.name,
    required this.create_time,
    required this.group_id,
    required this.order,
  });
}
