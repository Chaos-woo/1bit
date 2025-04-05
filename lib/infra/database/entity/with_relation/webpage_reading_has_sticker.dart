import 'package:drift/drift.dart';
import 'package:drift_model_generator/drift_model_generator.dart';
import 'package:cw2bit/infrastructure/database/app_database.dart';

part 'webpage_reading_has_sticker.driftm.dart';

@UseDrift(
  useSnakeCase: true,
)
class WebpageReadingHasSticker {
  @AutoIncrement()
  final int? id;

  @WithDefault('now()')
  @NotNull()
  final DateTime create_time;

  @WithDefault('now()')
  @NotNull()
  final DateTime update_time;

  @NotNull()
  final int webpage_reading_id;

  @NotNull()
  final int sticker_id;

  WebpageReadingHasSticker({
    required this.id,
    required this.create_time,
    required this.update_time,
    required this.webpage_reading_id,
    required this.sticker_id,
  });
}
