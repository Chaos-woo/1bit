// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// DriftModelGenerator
// **************************************************************************

part of "hot_search_group_has_app.dart";

@UseRowClass(HotSearchGroupHasApp)
class HotSearchGroupHasApps extends Table {
  IntColumn get id => integer().autoIncrement()();
  DateTimeColumn get create_time =>
      dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get update_time =>
      dateTime().withDefault(currentDateAndTime)();
  IntColumn get group_id => integer()();
  IntColumn get app_id => integer()();
}

extension HotSearchGroupHasAppsDriftModelGeneratorExtension
    on HotSearchGroupHasApp {
  void assertRequiredOnInsert() {}

  /// Accepts [allowNulls] set of field names for which null values
  /// are allowed, otherwise use [Value.absent()].
  HotSearchGroupHasAppsCompanion toCompanion(
      [Set<String> allowNulls = const {}]) {
    return HotSearchGroupHasAppsCompanion(
      id: _passNullableInput('id', id, allowNulls, false),
      create_time:
          _passNullableInput('create_time', create_time, allowNulls, false),
      update_time:
          _passNullableInput('update_time', update_time, allowNulls, false),
      group_id: _passNullableInput('group_id', group_id, allowNulls, false),
      app_id: _passNullableInput('app_id', app_id, allowNulls, false),
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
