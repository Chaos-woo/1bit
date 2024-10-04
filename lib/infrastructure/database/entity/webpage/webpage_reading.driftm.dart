// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// DriftModelGenerator
// **************************************************************************

part of "webpage_reading.dart";

@UseRowClass(WebpageReading)
class WebpageReadings extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get url => text()();
  DateTimeColumn get createTime => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updateTime => dateTime().withDefault(currentDateAndTime)();
  RealColumn get readingScrollTop => real().withDefault(const Constant(0.0))();
  RealColumn get readingProgress => real().withDefault(const Constant(0.0))();
  TextColumn get app => text().withDefault(const Constant(""))();
  TextColumn get articleAnalysis => text().nullable()();
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
      createTime:
          _passNullableInput('createTime', createTime, allowNulls, false),
      updateTime:
          _passNullableInput('updateTime', updateTime, allowNulls, false),
      readingScrollTop: _passNullableInput(
          'readingScrollTop', readingScrollTop, allowNulls, false),
      readingProgress: _passNullableInput(
          'readingProgress', readingProgress, allowNulls, false),
      app: _passNullableInput('app', app, allowNulls, false),
      articleAnalysis: _passNullableInput(
          'articleAnalysis', articleAnalysis, allowNulls, true),
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
