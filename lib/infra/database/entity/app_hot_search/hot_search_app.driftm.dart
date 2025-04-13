// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// DriftModelGenerator
// **************************************************************************

part of "hot_search_app.dart";

@UseRowClass(HotSearchApp)
class HotSearchApps extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get name => text()();

  DateTimeColumn get create_time => dateTime().withDefault(currentDateAndTime)();

  DateTimeColumn get update_time => dateTime().withDefault(currentDateAndTime)();

  IntColumn get order => integer().withDefault(const Constant(0))();
}

extension HotSearchAppsDriftModelGeneratorExtension on HotSearchApp {
  void assertRequiredOnInsert() {}

  /// Accepts [allowNulls] set of field names for which null values
  /// are allowed, otherwise use [Value.absent()].
  HotSearchAppsCompanion toCompanion([Set<String> allowNulls = const {}]) {
    return HotSearchAppsCompanion(
      id: _passNullableInput('id', id, allowNulls, false),
      name: _passNullableInput('name', name, allowNulls, false),
      create_time: _passNullableInput('create_time', create_time, allowNulls, false),
      update_time: _passNullableInput('update_time', update_time, allowNulls, false),
      criteria: _passNullableInput('order', order, allowNulls, false),
    );
  }
}

Value<T> _passNullableInput<T>(String name, T? value, Set<String> allowNulls, bool nullableColumn) {
  if (value != null) return Value(value);
  if (allowNulls.contains(name)) {
    if (nullableColumn) {
      return Value(value as T);
    }

    throw NonNullableFieldIsAllowedNull(name);
  }

  return Value.absent();
}
