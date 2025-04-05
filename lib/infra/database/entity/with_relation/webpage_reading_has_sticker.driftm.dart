// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// DriftModelGenerator
// **************************************************************************

part of "webpage_reading_has_sticker.dart";

@UseRowClass(WebpageReadingHasSticker)
class WebpageReadingHasStickers extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get create_time =>
      dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get update_time =>
      dateTime().withDefault(currentDateAndTime)();
  IntColumn get webpage_reading_id => integer()();
  IntColumn get sticker_id => integer()();
}

extension WebpageReadingHasStickersDriftModelGeneratorExtension
    on WebpageReadingHasSticker {
  void assertRequiredOnInsert() {}

  /// Accepts [allowNulls] set of field names for which null values
  /// are allowed, otherwise use [Value.absent()].
  WebpageReadingHasStickersCompanion toCompanion(
      [Set<String> allowNulls = const {}]) {
    return WebpageReadingHasStickersCompanion(
      id: _passNullableInput('id', id, allowNulls, false),
      create_time:
          _passNullableInput('create_time', create_time, allowNulls, false),
      update_time:
          _passNullableInput('update_time', update_time, allowNulls, false),
      webpage_reading_id: _passNullableInput(
          'webpage_reading_id', webpage_reading_id, allowNulls, false),
      sticker_id:
          _passNullableInput('sticker_id', sticker_id, allowNulls, false),
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
