import 'package:cw2bit/infrastructure/database/r_database.dart';
import 'package:drift/drift.dart';
import 'package:drift_model_generator/drift_model_generator.dart';

part 'sticker.driftm.dart';

/// 标记用贴纸
@UseDrift(
  useSnakeCase: true,
)
class Sticker {
  @AutoIncrement()
  final int? id;

  @WithDefault('未标记')
  @NotNull()
  final String name;

  @WithDefault('now()')
  @NotNull()
  final DateTime create_time;

  @WithDefault('now()')
  @NotNull()
  final DateTime update_time;

  @WithDefault('E1E1E1')
  @NotNull()
  final String color;

  @WithDefault('000000')
  @NotNull()
  final String font_color;

  /// # @
  @WithDefault('#')
  @NotNull()
  final String sign;

  @NotNull()
  final int sticker_type;

  @NotNull()
  final int? scope;

  Sticker({
    required this.id,
    required this.name,
    required this.create_time,
    required this.update_time,
    required this.color,
    required this.font_color,
    required this.sign,
    required this.sticker_type,
    required this.scope,
  });
}

enum StickerType {
  auto_generated(0),
  user_defined(1);

  final int value;

  const StickerType(this.value);
}

enum StickerScope {
  webpage_reading(0);

  final int value;

  const StickerScope(this.value);
}
