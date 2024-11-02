// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'r1db.dart';

// ignore_for_file: type=lint
class $WebpageReadingsTable extends WebpageReadings
    with TableInfo<$WebpageReadingsTable, WebpageReading> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WebpageReadingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
      'url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _create_timeMeta =
      const VerificationMeta('create_time');
  @override
  late final GeneratedColumn<DateTime> create_time = GeneratedColumn<DateTime>(
      'create_time', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _update_timeMeta =
      const VerificationMeta('update_time');
  @override
  late final GeneratedColumn<DateTime> update_time = GeneratedColumn<DateTime>(
      'update_time', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _reading_scroll_topMeta =
      const VerificationMeta('reading_scroll_top');
  @override
  late final GeneratedColumn<double> reading_scroll_top =
      GeneratedColumn<double>('reading_scroll_top', aliasedName, false,
          type: DriftSqlType.double,
          requiredDuringInsert: false,
          defaultValue: const Constant(0.0));
  static const VerificationMeta _reading_progressMeta =
      const VerificationMeta('reading_progress');
  @override
  late final GeneratedColumn<double> reading_progress = GeneratedColumn<double>(
      'reading_progress', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _appMeta = const VerificationMeta('app');
  @override
  late final GeneratedColumn<String> app = GeneratedColumn<String>(
      'app', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(""));
  static const VerificationMeta _article_analysisMeta =
      const VerificationMeta('article_analysis');
  @override
  late final GeneratedColumn<String> article_analysis = GeneratedColumn<String>(
      'article_analysis', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
      'source', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        url,
        create_time,
        update_time,
        reading_scroll_top,
        reading_progress,
        app,
        article_analysis,
        source
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'webpage_readings';
  @override
  VerificationContext validateIntegrity(Insertable<WebpageReading> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('create_time')) {
      context.handle(
          _create_timeMeta,
          create_time.isAcceptableOrUnknown(
              data['create_time']!, _create_timeMeta));
    }
    if (data.containsKey('update_time')) {
      context.handle(
          _update_timeMeta,
          update_time.isAcceptableOrUnknown(
              data['update_time']!, _update_timeMeta));
    }
    if (data.containsKey('reading_scroll_top')) {
      context.handle(
          _reading_scroll_topMeta,
          reading_scroll_top.isAcceptableOrUnknown(
              data['reading_scroll_top']!, _reading_scroll_topMeta));
    }
    if (data.containsKey('reading_progress')) {
      context.handle(
          _reading_progressMeta,
          reading_progress.isAcceptableOrUnknown(
              data['reading_progress']!, _reading_progressMeta));
    }
    if (data.containsKey('app')) {
      context.handle(
          _appMeta, app.isAcceptableOrUnknown(data['app']!, _appMeta));
    }
    if (data.containsKey('article_analysis')) {
      context.handle(
          _article_analysisMeta,
          article_analysis.isAcceptableOrUnknown(
              data['article_analysis']!, _article_analysisMeta));
    }
    if (data.containsKey('source')) {
      context.handle(_sourceMeta,
          source.isAcceptableOrUnknown(data['source']!, _sourceMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WebpageReading map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WebpageReading(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      url: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}url'])!,
      create_time: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}create_time'])!,
      update_time: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}update_time'])!,
      reading_scroll_top: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}reading_scroll_top'])!,
      reading_progress: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}reading_progress'])!,
      app: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}app'])!,
      article_analysis: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}article_analysis']),
      source: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}source']),
    );
  }

  @override
  $WebpageReadingsTable createAlias(String alias) {
    return $WebpageReadingsTable(attachedDatabase, alias);
  }
}

class WebpageReadingsCompanion extends UpdateCompanion<WebpageReading> {
  final Value<int> id;
  final Value<String> url;
  final Value<DateTime> create_time;
  final Value<DateTime> update_time;
  final Value<double> reading_scroll_top;
  final Value<double> reading_progress;
  final Value<String> app;
  final Value<String?> article_analysis;
  final Value<String?> source;
  const WebpageReadingsCompanion({
    this.id = const Value.absent(),
    this.url = const Value.absent(),
    this.create_time = const Value.absent(),
    this.update_time = const Value.absent(),
    this.reading_scroll_top = const Value.absent(),
    this.reading_progress = const Value.absent(),
    this.app = const Value.absent(),
    this.article_analysis = const Value.absent(),
    this.source = const Value.absent(),
  });
  WebpageReadingsCompanion.insert({
    this.id = const Value.absent(),
    required String url,
    this.create_time = const Value.absent(),
    this.update_time = const Value.absent(),
    this.reading_scroll_top = const Value.absent(),
    this.reading_progress = const Value.absent(),
    this.app = const Value.absent(),
    this.article_analysis = const Value.absent(),
    this.source = const Value.absent(),
  }) : url = Value(url);
  static Insertable<WebpageReading> custom({
    Expression<int>? id,
    Expression<String>? url,
    Expression<DateTime>? create_time,
    Expression<DateTime>? update_time,
    Expression<double>? reading_scroll_top,
    Expression<double>? reading_progress,
    Expression<String>? app,
    Expression<String>? article_analysis,
    Expression<String>? source,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (url != null) 'url': url,
      if (create_time != null) 'create_time': create_time,
      if (update_time != null) 'update_time': update_time,
      if (reading_scroll_top != null) 'reading_scroll_top': reading_scroll_top,
      if (reading_progress != null) 'reading_progress': reading_progress,
      if (app != null) 'app': app,
      if (article_analysis != null) 'article_analysis': article_analysis,
      if (source != null) 'source': source,
    });
  }

  WebpageReadingsCompanion copyWith(
      {Value<int>? id,
      Value<String>? url,
      Value<DateTime>? create_time,
      Value<DateTime>? update_time,
      Value<double>? reading_scroll_top,
      Value<double>? reading_progress,
      Value<String>? app,
      Value<String?>? article_analysis,
      Value<String?>? source}) {
    return WebpageReadingsCompanion(
      id: id ?? this.id,
      url: url ?? this.url,
      create_time: create_time ?? this.create_time,
      update_time: update_time ?? this.update_time,
      reading_scroll_top: reading_scroll_top ?? this.reading_scroll_top,
      reading_progress: reading_progress ?? this.reading_progress,
      app: app ?? this.app,
      article_analysis: article_analysis ?? this.article_analysis,
      source: source ?? this.source,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (create_time.present) {
      map['create_time'] = Variable<DateTime>(create_time.value);
    }
    if (update_time.present) {
      map['update_time'] = Variable<DateTime>(update_time.value);
    }
    if (reading_scroll_top.present) {
      map['reading_scroll_top'] = Variable<double>(reading_scroll_top.value);
    }
    if (reading_progress.present) {
      map['reading_progress'] = Variable<double>(reading_progress.value);
    }
    if (app.present) {
      map['app'] = Variable<String>(app.value);
    }
    if (article_analysis.present) {
      map['article_analysis'] = Variable<String>(article_analysis.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WebpageReadingsCompanion(')
          ..write('id: $id, ')
          ..write('url: $url, ')
          ..write('create_time: $create_time, ')
          ..write('update_time: $update_time, ')
          ..write('reading_scroll_top: $reading_scroll_top, ')
          ..write('reading_progress: $reading_progress, ')
          ..write('app: $app, ')
          ..write('article_analysis: $article_analysis, ')
          ..write('source: $source')
          ..write(')'))
        .toString();
  }
}

class $FavoriteAppsTable extends FavoriteApps
    with TableInfo<$FavoriteAppsTable, FavoriteApp> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoriteAppsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _create_timeMeta =
      const VerificationMeta('create_time');
  @override
  late final GeneratedColumn<DateTime> create_time = GeneratedColumn<DateTime>(
      'create_time', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _group_idMeta =
      const VerificationMeta('group_id');
  @override
  late final GeneratedColumn<int> group_id = GeneratedColumn<int>(
      'group_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _orderMeta = const VerificationMeta('order');
  @override
  late final GeneratedColumn<int> order = GeneratedColumn<int>(
      'order', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, create_time, group_id, order];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorite_apps';
  @override
  VerificationContext validateIntegrity(Insertable<FavoriteApp> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('create_time')) {
      context.handle(
          _create_timeMeta,
          create_time.isAcceptableOrUnknown(
              data['create_time']!, _create_timeMeta));
    }
    if (data.containsKey('group_id')) {
      context.handle(_group_idMeta,
          group_id.isAcceptableOrUnknown(data['group_id']!, _group_idMeta));
    } else if (isInserting) {
      context.missing(_group_idMeta);
    }
    if (data.containsKey('order')) {
      context.handle(
          _orderMeta, order.isAcceptableOrUnknown(data['order']!, _orderMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FavoriteApp map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoriteApp(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      create_time: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}create_time'])!,
      group_id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}group_id'])!,
      order: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order'])!,
    );
  }

  @override
  $FavoriteAppsTable createAlias(String alias) {
    return $FavoriteAppsTable(attachedDatabase, alias);
  }
}

class FavoriteAppsCompanion extends UpdateCompanion<FavoriteApp> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime> create_time;
  final Value<int> group_id;
  final Value<int> order;
  const FavoriteAppsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.create_time = const Value.absent(),
    this.group_id = const Value.absent(),
    this.order = const Value.absent(),
  });
  FavoriteAppsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.create_time = const Value.absent(),
    required int group_id,
    this.order = const Value.absent(),
  })  : name = Value(name),
        group_id = Value(group_id);
  static Insertable<FavoriteApp> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? create_time,
    Expression<int>? group_id,
    Expression<int>? order,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (create_time != null) 'create_time': create_time,
      if (group_id != null) 'group_id': group_id,
      if (order != null) 'order': order,
    });
  }

  FavoriteAppsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<DateTime>? create_time,
      Value<int>? group_id,
      Value<int>? order}) {
    return FavoriteAppsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      create_time: create_time ?? this.create_time,
      group_id: group_id ?? this.group_id,
      order: order ?? this.order,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (create_time.present) {
      map['create_time'] = Variable<DateTime>(create_time.value);
    }
    if (group_id.present) {
      map['group_id'] = Variable<int>(group_id.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteAppsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('create_time: $create_time, ')
          ..write('group_id: $group_id, ')
          ..write('order: $order')
          ..write(')'))
        .toString();
  }
}

class $FavoriteAppGroupsTable extends FavoriteAppGroups
    with TableInfo<$FavoriteAppGroupsTable, FavoriteAppGroup> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoriteAppGroupsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _create_timeMeta =
      const VerificationMeta('create_time');
  @override
  late final GeneratedColumn<DateTime> create_time = GeneratedColumn<DateTime>(
      'create_time', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _orderMeta = const VerificationMeta('order');
  @override
  late final GeneratedColumn<int> order = GeneratedColumn<int>(
      'order', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns => [id, name, create_time, order];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorite_app_groups';
  @override
  VerificationContext validateIntegrity(Insertable<FavoriteAppGroup> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('create_time')) {
      context.handle(
          _create_timeMeta,
          create_time.isAcceptableOrUnknown(
              data['create_time']!, _create_timeMeta));
    }
    if (data.containsKey('order')) {
      context.handle(
          _orderMeta, order.isAcceptableOrUnknown(data['order']!, _orderMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FavoriteAppGroup map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FavoriteAppGroup(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      create_time: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}create_time'])!,
      order: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order'])!,
    );
  }

  @override
  $FavoriteAppGroupsTable createAlias(String alias) {
    return $FavoriteAppGroupsTable(attachedDatabase, alias);
  }
}

class FavoriteAppGroupsCompanion extends UpdateCompanion<FavoriteAppGroup> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime> create_time;
  final Value<int> order;
  const FavoriteAppGroupsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.create_time = const Value.absent(),
    this.order = const Value.absent(),
  });
  FavoriteAppGroupsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.create_time = const Value.absent(),
    this.order = const Value.absent(),
  }) : name = Value(name);
  static Insertable<FavoriteAppGroup> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? create_time,
    Expression<int>? order,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (create_time != null) 'create_time': create_time,
      if (order != null) 'order': order,
    });
  }

  FavoriteAppGroupsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<DateTime>? create_time,
      Value<int>? order}) {
    return FavoriteAppGroupsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      create_time: create_time ?? this.create_time,
      order: order ?? this.order,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (create_time.present) {
      map['create_time'] = Variable<DateTime>(create_time.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteAppGroupsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('create_time: $create_time, ')
          ..write('order: $order')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $WebpageReadingsTable webpageReadings =
      $WebpageReadingsTable(this);
  late final $FavoriteAppsTable favoriteApps = $FavoriteAppsTable(this);
  late final $FavoriteAppGroupsTable favoriteAppGroups =
      $FavoriteAppGroupsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [webpageReadings, favoriteApps, favoriteAppGroups];
}

typedef $$WebpageReadingsTableCreateCompanionBuilder = WebpageReadingsCompanion
    Function({
  Value<int> id,
  required String url,
  Value<DateTime> create_time,
  Value<DateTime> update_time,
  Value<double> reading_scroll_top,
  Value<double> reading_progress,
  Value<String> app,
  Value<String?> article_analysis,
  Value<String?> source,
});
typedef $$WebpageReadingsTableUpdateCompanionBuilder = WebpageReadingsCompanion
    Function({
  Value<int> id,
  Value<String> url,
  Value<DateTime> create_time,
  Value<DateTime> update_time,
  Value<double> reading_scroll_top,
  Value<double> reading_progress,
  Value<String> app,
  Value<String?> article_analysis,
  Value<String?> source,
});

class $$WebpageReadingsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WebpageReadingsTable,
    WebpageReading,
    $$WebpageReadingsTableFilterComposer,
    $$WebpageReadingsTableOrderingComposer,
    $$WebpageReadingsTableCreateCompanionBuilder,
    $$WebpageReadingsTableUpdateCompanionBuilder> {
  $$WebpageReadingsTableTableManager(
      _$AppDatabase db, $WebpageReadingsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$WebpageReadingsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$WebpageReadingsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> url = const Value.absent(),
            Value<DateTime> create_time = const Value.absent(),
            Value<DateTime> update_time = const Value.absent(),
            Value<double> reading_scroll_top = const Value.absent(),
            Value<double> reading_progress = const Value.absent(),
            Value<String> app = const Value.absent(),
            Value<String?> article_analysis = const Value.absent(),
            Value<String?> source = const Value.absent(),
          }) =>
              WebpageReadingsCompanion(
            id: id,
            url: url,
            create_time: create_time,
            update_time: update_time,
            reading_scroll_top: reading_scroll_top,
            reading_progress: reading_progress,
            app: app,
            article_analysis: article_analysis,
            source: source,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String url,
            Value<DateTime> create_time = const Value.absent(),
            Value<DateTime> update_time = const Value.absent(),
            Value<double> reading_scroll_top = const Value.absent(),
            Value<double> reading_progress = const Value.absent(),
            Value<String> app = const Value.absent(),
            Value<String?> article_analysis = const Value.absent(),
            Value<String?> source = const Value.absent(),
          }) =>
              WebpageReadingsCompanion.insert(
            id: id,
            url: url,
            create_time: create_time,
            update_time: update_time,
            reading_scroll_top: reading_scroll_top,
            reading_progress: reading_progress,
            app: app,
            article_analysis: article_analysis,
            source: source,
          ),
        ));
}

class $$WebpageReadingsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $WebpageReadingsTable> {
  $$WebpageReadingsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get url => $state.composableBuilder(
      column: $state.table.url,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get create_time => $state.composableBuilder(
      column: $state.table.create_time,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get update_time => $state.composableBuilder(
      column: $state.table.update_time,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get reading_scroll_top => $state.composableBuilder(
      column: $state.table.reading_scroll_top,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get reading_progress => $state.composableBuilder(
      column: $state.table.reading_progress,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get app => $state.composableBuilder(
      column: $state.table.app,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get article_analysis => $state.composableBuilder(
      column: $state.table.article_analysis,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get source => $state.composableBuilder(
      column: $state.table.source,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$WebpageReadingsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $WebpageReadingsTable> {
  $$WebpageReadingsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get url => $state.composableBuilder(
      column: $state.table.url,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get create_time => $state.composableBuilder(
      column: $state.table.create_time,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get update_time => $state.composableBuilder(
      column: $state.table.update_time,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get reading_scroll_top => $state.composableBuilder(
      column: $state.table.reading_scroll_top,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get reading_progress => $state.composableBuilder(
      column: $state.table.reading_progress,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get app => $state.composableBuilder(
      column: $state.table.app,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get article_analysis => $state.composableBuilder(
      column: $state.table.article_analysis,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get source => $state.composableBuilder(
      column: $state.table.source,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$FavoriteAppsTableCreateCompanionBuilder = FavoriteAppsCompanion
    Function({
  Value<int> id,
  required String name,
  Value<DateTime> create_time,
  required int group_id,
  Value<int> order,
});
typedef $$FavoriteAppsTableUpdateCompanionBuilder = FavoriteAppsCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<DateTime> create_time,
  Value<int> group_id,
  Value<int> order,
});

class $$FavoriteAppsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FavoriteAppsTable,
    FavoriteApp,
    $$FavoriteAppsTableFilterComposer,
    $$FavoriteAppsTableOrderingComposer,
    $$FavoriteAppsTableCreateCompanionBuilder,
    $$FavoriteAppsTableUpdateCompanionBuilder> {
  $$FavoriteAppsTableTableManager(_$AppDatabase db, $FavoriteAppsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$FavoriteAppsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$FavoriteAppsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<DateTime> create_time = const Value.absent(),
            Value<int> group_id = const Value.absent(),
            Value<int> order = const Value.absent(),
          }) =>
              FavoriteAppsCompanion(
            id: id,
            name: name,
            create_time: create_time,
            group_id: group_id,
            order: order,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<DateTime> create_time = const Value.absent(),
            required int group_id,
            Value<int> order = const Value.absent(),
          }) =>
              FavoriteAppsCompanion.insert(
            id: id,
            name: name,
            create_time: create_time,
            group_id: group_id,
            order: order,
          ),
        ));
}

class $$FavoriteAppsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $FavoriteAppsTable> {
  $$FavoriteAppsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get create_time => $state.composableBuilder(
      column: $state.table.create_time,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get group_id => $state.composableBuilder(
      column: $state.table.group_id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get order => $state.composableBuilder(
      column: $state.table.order,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$FavoriteAppsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $FavoriteAppsTable> {
  $$FavoriteAppsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get create_time => $state.composableBuilder(
      column: $state.table.create_time,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get group_id => $state.composableBuilder(
      column: $state.table.group_id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get order => $state.composableBuilder(
      column: $state.table.order,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$FavoriteAppGroupsTableCreateCompanionBuilder
    = FavoriteAppGroupsCompanion Function({
  Value<int> id,
  required String name,
  Value<DateTime> create_time,
  Value<int> order,
});
typedef $$FavoriteAppGroupsTableUpdateCompanionBuilder
    = FavoriteAppGroupsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<DateTime> create_time,
  Value<int> order,
});

class $$FavoriteAppGroupsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FavoriteAppGroupsTable,
    FavoriteAppGroup,
    $$FavoriteAppGroupsTableFilterComposer,
    $$FavoriteAppGroupsTableOrderingComposer,
    $$FavoriteAppGroupsTableCreateCompanionBuilder,
    $$FavoriteAppGroupsTableUpdateCompanionBuilder> {
  $$FavoriteAppGroupsTableTableManager(
      _$AppDatabase db, $FavoriteAppGroupsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$FavoriteAppGroupsTableFilterComposer(ComposerState(db, table)),
          orderingComposer: $$FavoriteAppGroupsTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<DateTime> create_time = const Value.absent(),
            Value<int> order = const Value.absent(),
          }) =>
              FavoriteAppGroupsCompanion(
            id: id,
            name: name,
            create_time: create_time,
            order: order,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<DateTime> create_time = const Value.absent(),
            Value<int> order = const Value.absent(),
          }) =>
              FavoriteAppGroupsCompanion.insert(
            id: id,
            name: name,
            create_time: create_time,
            order: order,
          ),
        ));
}

class $$FavoriteAppGroupsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $FavoriteAppGroupsTable> {
  $$FavoriteAppGroupsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get create_time => $state.composableBuilder(
      column: $state.table.create_time,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get order => $state.composableBuilder(
      column: $state.table.order,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$FavoriteAppGroupsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $FavoriteAppGroupsTable> {
  $$FavoriteAppGroupsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get name => $state.composableBuilder(
      column: $state.table.name,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get create_time => $state.composableBuilder(
      column: $state.table.create_time,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get order => $state.composableBuilder(
      column: $state.table.order,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$WebpageReadingsTableTableManager get webpageReadings =>
      $$WebpageReadingsTableTableManager(_db, _db.webpageReadings);
  $$FavoriteAppsTableTableManager get favoriteApps =>
      $$FavoriteAppsTableTableManager(_db, _db.favoriteApps);
  $$FavoriteAppGroupsTableTableManager get favoriteAppGroups =>
      $$FavoriteAppGroupsTableTableManager(_db, _db.favoriteAppGroups);
}
