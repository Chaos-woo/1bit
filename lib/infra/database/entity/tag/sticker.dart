import 'package:cw2bit/infrastructure/database/app_database.dart';
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

  static StickersCompanion companion({
    required String name,
    required int sticker_type,
    required int scope,
    String color = 'E1E1E1',
    String font_color = '000000',
    String sign = '#',
  }) {
    var sticker_scope = StickerScope.from_value(scope);

    return StickersCompanion(
      name: Value(name),
      create_time: Value(DateTime.now()),
      update_time: Value(DateTime.now()),
      color: Value(color),
      font_color: Value(font_color),
      sign: Value(sign),
      sticker_type: Value(sticker_type),
      scope: Value(sticker_scope.value),
    );
  }
}

enum StickerType {
  auto_generated(0),
  user_defined(1);

  final int value;

  const StickerType(this.value);

  static bool is_type(int value, StickerType type) {
    return value == type.value;
  }
}

enum StickerScope {
  error(-1),
  webpage_reading(0);

  final int value;

  const StickerScope(this.value);

  static StickerScope from_value(int value) {
    for (StickerScope scope in StickerScope.values) {
      if (scope.value == value) {
        return scope;
      }
    }
    return StickerScope.error;
  }
}

enum StickerSign {
  hashtag('#'),
  at_sign('@');

  final String value;

  const StickerSign(this.value);
}
