// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// DriftModelGenerator
// **************************************************************************

part of "sticker.dart";

@UseRowClass(Sticker)
class Stickers extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text().withDefault(const Constant("未标记"))();
  DateTimeColumn get create_time =>
      dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get update_time =>
      dateTime().withDefault(currentDateAndTime)();
  TextColumn get color => text().withDefault(const Constant("E1E1E1"))();
  TextColumn get font_color => text().withDefault(const Constant("000000"))();
  TextColumn get sign => text().withDefault(const Constant("#"))();
  IntColumn get sticker_type => integer()();
  IntColumn get scope => integer().nullable()();
}

extension StickersDriftModelGeneratorExtension on Sticker {
  void assertRequiredOnInsert() {
    assert(scope != null, MissingRequiredFieldError('scope'));
  }

  /// Accepts [allowNulls] set of field names for which null values
  /// are allowed, otherwise use [Value.absent()].
  StickersCompanion toCompanion([Set<String> allowNulls = const {}]) {
    return StickersCompanion(
      id: _passNullableInput('id', id, allowNulls, false),
      name: _passNullableInput('name', name, allowNulls, false),
      create_time:
          _passNullableInput('create_time', create_time, allowNulls, false),
      update_time:
          _passNullableInput('update_time', update_time, allowNulls, false),
      color: _passNullableInput('color', color, allowNulls, false),
      font_color:
          _passNullableInput('font_color', font_color, allowNulls, false),
      sign: _passNullableInput('sign', sign, allowNulls, false),
      sticker_type:
          _passNullableInput('sticker_type', sticker_type, allowNulls, false),
      scope: _passNullableInput('scope', scope, allowNulls, false),
    );
  }
}

Value<T> _passNullableInput<T>(
    String name, T? value, Set<String> allowNulls, bool nullableColumn) {
  if (value != null) return Value(value);
  if (allowNulls.contains(name)) {
    if (nullableColumn) {
      return Value(value as T);
    }

    throw NonNullableFieldIsAllowedNull(name);
  }

  return Value.absent();
}
