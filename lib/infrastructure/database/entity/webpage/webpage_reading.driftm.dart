// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// DriftModelGenerator
// **************************************************************************

part of "webpage_reading.dart";

@UseRowClass(WebpageReading)
class WebpageReadings extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get url => text()();
  DateTimeColumn get create_time =>
      dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get update_time =>
      dateTime().withDefault(currentDateAndTime)();
  RealColumn get reading_scroll_top =>
      real().withDefault(const Constant(0.0))();
  RealColumn get reading_progress => real().withDefault(const Constant(0.0))();
  TextColumn get app => text().withDefault(const Constant(""))();
  TextColumn get article_analysis => text().nullable()();
  TextColumn get source => text().nullable()();
}

extension WebpageReadingsDriftModelGeneratorExtension on WebpageReading {
  void assertRequiredOnInsert() {}

  /// Accepts [allowNulls] set of field names for which null values
  /// are allowed, otherwise use [Value.absent()].
  WebpageReadingsCompanion toCompanion([Set<String> allowNulls = const {}]) {
    return WebpageReadingsCompanion(
      id: _passNullableInput('id', id, allowNulls, false),
      url: _passNullableInput('url', url, allowNulls, false),
      create_time:
          _passNullableInput('create_time', create_time, allowNulls, false),
      update_time:
          _passNullableInput('update_time', update_time, allowNulls, false),
      reading_scroll_top: _passNullableInput(
          'reading_scroll_top', reading_scroll_top, allowNulls, false),
      reading_progress: _passNullableInput(
          'reading_progress', reading_progress, allowNulls, false),
      app: _passNullableInput('app', app, allowNulls, false),
      article_analysis: _passNullableInput(
          'article_analysis', article_analysis, allowNulls, true),
      source: _passNullableInput('source', source, allowNulls, true),
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
