import 'package:drift/drift.dart';
import 'package:drift_model_generator/drift_model_generator.dart';
import 'package:cw2bit/infrastructure/database/app_database.dart';

part 'hot_search_group_has_app.driftm.dart';

@UseDrift(
  useSnakeCase: true,
)
class HotSearchGroupHasApp {
  @AutoIncrement()
  final int? id;

  @WithDefault('now()')
  @NotNull()
  final DateTime create_time;

  @WithDefault('now()')
  @NotNull()
  final DateTime update_time;

  @NotNull()
  final int group_id;

  @NotNull()
  final int app_id;

  HotSearchGroupHasApp({
    required this.id,
    required this.create_time,
    required this.update_time,
    required this.group_id,
    required this.app_id,
  });
}
