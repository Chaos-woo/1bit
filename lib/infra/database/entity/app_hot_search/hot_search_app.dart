import 'package:cw2bit/infrastructure/database/app_database.dart';
import 'package:drift/drift.dart';
import 'package:drift_model_generator/drift_model_generator.dart';

part 'hot_search_app.driftm.dart';

/// 各应用网站热搜APP的本地APP收藏
@UseDrift(
  useSnakeCase: true,
)
class HotSearchApp {
  @AutoIncrement()
  final int? id;

  @NotNull()
  final String name;

  @WithDefault('now()')
  @NotNull()
  final DateTime create_time;

  @WithDefault('now()')
  @NotNull()
  final DateTime update_time;

  @NotNull()
  @WithDefault(0)
  final int order;

  HotSearchApp({
    required this.id,
    required this.name,
    required this.create_time,
    required this.update_time,
    required this.order,
  });
}
