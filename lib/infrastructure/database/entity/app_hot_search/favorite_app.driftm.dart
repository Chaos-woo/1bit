// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// DriftModelGenerator
// **************************************************************************

part of "favorite_app.dart";

@UseRowClass(FavoriteApp)
class FavoriteApps extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  DateTimeColumn get createTime => dateTime().withDefault(currentDateAndTime)();
  IntColumn get groupId => integer()();
  IntColumn get order => integer().withDefault(const Constant(0))();
}

extension FavoriteAppsDriftModelGeneratorExtension on FavoriteApp {
  void assertRequiredOnInsert() {}

  /// Accepts [allowNulls] set of field names for which null values
  /// are allowed, otherwise use [Value.absent()].
  FavoriteAppsCompanion toCompanion([Set<String> allowNulls = const {}]) {
    return FavoriteAppsCompanion(
      id: _passNullableInput('id', id, allowNulls, false),
      name: _passNullableInput('name', name, allowNulls, false),
      createTime:
          _passNullableInput('createTime', createTime, allowNulls, false),
      groupId: _passNullableInput('groupId', groupId, allowNulls, false),
      order: _passNullableInput('order', order, allowNulls, false),
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
