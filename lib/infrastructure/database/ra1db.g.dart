// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ra1db.dart';

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
  static const VerificationMeta _createTimeMeta =
      const VerificationMeta('createTime');
  @override
  late final GeneratedColumn<DateTime> createTime = GeneratedColumn<DateTime>(
      'create_time', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updateTimeMeta =
      const VerificationMeta('updateTime');
  @override
  late final GeneratedColumn<DateTime> updateTime = GeneratedColumn<DateTime>(
      'update_time', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _readingScrollTopMeta =
      const VerificationMeta('readingScrollTop');
  @override
  late final GeneratedColumn<double> readingScrollTop = GeneratedColumn<double>(
      'reading_scroll_top', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0.0));
  static const VerificationMeta _readingProgressMeta =
      const VerificationMeta('readingProgress');
  @override
  late final GeneratedColumn<double> readingProgress = GeneratedColumn<double>(
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
  static const VerificationMeta _articleAnalysisMeta =
      const VerificationMeta('articleAnalysis');
  @override
  late final GeneratedColumn<String> articleAnalysis = GeneratedColumn<String>(
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
        createTime,
        updateTime,
        readingScrollTop,
        readingProgress,
        app,
        articleAnalysis,
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
          _createTimeMeta,
          createTime.isAcceptableOrUnknown(
              data['create_time']!, _createTimeMeta));
    }
    if (data.containsKey('update_time')) {
      context.handle(
          _updateTimeMeta,
          updateTime.isAcceptableOrUnknown(
              data['update_time']!, _updateTimeMeta));
    }
    if (data.containsKey('reading_scroll_top')) {
      context.handle(
          _readingScrollTopMeta,
          readingScrollTop.isAcceptableOrUnknown(
              data['reading_scroll_top']!, _readingScrollTopMeta));
    }
    if (data.containsKey('reading_progress')) {
      context.handle(
          _readingProgressMeta,
          readingProgress.isAcceptableOrUnknown(
              data['reading_progress']!, _readingProgressMeta));
    }
    if (data.containsKey('app')) {
      context.handle(
          _appMeta, app.isAcceptableOrUnknown(data['app']!, _appMeta));
    }
    if (data.containsKey('article_analysis')) {
      context.handle(
          _articleAnalysisMeta,
          articleAnalysis.isAcceptableOrUnknown(
              data['article_analysis']!, _articleAnalysisMeta));
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
      createTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}create_time'])!,
      updateTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}update_time'])!,
      readingScrollTop: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}reading_scroll_top'])!,
      readingProgress: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}reading_progress'])!,
      app: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}app'])!,
      articleAnalysis: attachedDatabase.typeMapping.read(
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
  final Value<DateTime> createTime;
  final Value<DateTime> updateTime;
  final Value<double> readingScrollTop;
  final Value<double> readingProgress;
  final Value<String> app;
  final Value<String?> articleAnalysis;
  final Value<String?> source;
  const WebpageReadingsCompanion({
    this.id = const Value.absent(),
    this.url = const Value.absent(),
    this.createTime = const Value.absent(),
    this.updateTime = const Value.absent(),
    this.readingScrollTop = const Value.absent(),
    this.readingProgress = const Value.absent(),
    this.app = const Value.absent(),
    this.articleAnalysis = const Value.absent(),
    this.source = const Value.absent(),
  });
  WebpageReadingsCompanion.insert({
    this.id = const Value.absent(),
    required String url,
    this.createTime = const Value.absent(),
    this.updateTime = const Value.absent(),
    this.readingScrollTop = const Value.absent(),
    this.readingProgress = const Value.absent(),
    this.app = const Value.absent(),
    this.articleAnalysis = const Value.absent(),
    this.source = const Value.absent(),
  }) : url = Value(url);
  static Insertable<WebpageReading> custom({
    Expression<int>? id,
    Expression<String>? url,
    Expression<DateTime>? createTime,
    Expression<DateTime>? updateTime,
    Expression<double>? readingScrollTop,
    Expression<double>? readingProgress,
    Expression<String>? app,
    Expression<String>? articleAnalysis,
    Expression<String>? source,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (url != null) 'url': url,
      if (createTime != null) 'create_time': createTime,
      if (updateTime != null) 'update_time': updateTime,
      if (readingScrollTop != null) 'reading_scroll_top': readingScrollTop,
      if (readingProgress != null) 'reading_progress': readingProgress,
      if (app != null) 'app': app,
      if (articleAnalysis != null) 'article_analysis': articleAnalysis,
      if (source != null) 'source': source,
    });
  }

  WebpageReadingsCompanion copyWith(
      {Value<int>? id,
      Value<String>? url,
      Value<DateTime>? createTime,
      Value<DateTime>? updateTime,
      Value<double>? readingScrollTop,
      Value<double>? readingProgress,
      Value<String>? app,
      Value<String?>? articleAnalysis,
      Value<String?>? source}) {
    return WebpageReadingsCompanion(
      id: id ?? this.id,
      url: url ?? this.url,
      createTime: createTime ?? this.createTime,
      updateTime: updateTime ?? this.updateTime,
      readingScrollTop: readingScrollTop ?? this.readingScrollTop,
      readingProgress: readingProgress ?? this.readingProgress,
      app: app ?? this.app,
      articleAnalysis: articleAnalysis ?? this.articleAnalysis,
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
    if (createTime.present) {
      map['create_time'] = Variable<DateTime>(createTime.value);
    }
    if (updateTime.present) {
      map['update_time'] = Variable<DateTime>(updateTime.value);
    }
    if (readingScrollTop.present) {
      map['reading_scroll_top'] = Variable<double>(readingScrollTop.value);
    }
    if (readingProgress.present) {
      map['reading_progress'] = Variable<double>(readingProgress.value);
    }
    if (app.present) {
      map['app'] = Variable<String>(app.value);
    }
    if (articleAnalysis.present) {
      map['article_analysis'] = Variable<String>(articleAnalysis.value);
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
          ..write('createTime: $createTime, ')
          ..write('updateTime: $updateTime, ')
          ..write('readingScrollTop: $readingScrollTop, ')
          ..write('readingProgress: $readingProgress, ')
          ..write('app: $app, ')
          ..write('articleAnalysis: $articleAnalysis, ')
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
  static const VerificationMeta _createTimeMeta =
      const VerificationMeta('createTime');
  @override
  late final GeneratedColumn<DateTime> createTime = GeneratedColumn<DateTime>(
      'create_time', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _groupIdMeta =
      const VerificationMeta('groupId');
  @override
  late final GeneratedColumn<int> groupId = GeneratedColumn<int>(
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
  List<GeneratedColumn> get $columns => [id, name, createTime, groupId, order];
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
          _createTimeMeta,
          createTime.isAcceptableOrUnknown(
              data['create_time']!, _createTimeMeta));
    }
    if (data.containsKey('group_id')) {
      context.handle(_groupIdMeta,
          groupId.isAcceptableOrUnknown(data['group_id']!, _groupIdMeta));
    } else if (isInserting) {
      context.missing(_groupIdMeta);
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
      createTime: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}create_time'])!,
      groupId: attachedDatabase.typeMapping
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
  final Value<DateTime> createTime;
  final Value<int> groupId;
  final Value<int> order;
  const FavoriteAppsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.createTime = const Value.absent(),
    this.groupId = const Value.absent(),
    this.order = const Value.absent(),
  });
  FavoriteAppsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.createTime = const Value.absent(),
    required int groupId,
    this.order = const Value.absent(),
  })  : name = Value(name),
        groupId = Value(groupId);
  static Insertable<FavoriteApp> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? createTime,
    Expression<int>? groupId,
    Expression<int>? order,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (createTime != null) 'create_time': createTime,
      if (groupId != null) 'group_id': groupId,
      if (order != null) 'order': order,
    });
  }

  FavoriteAppsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<DateTime>? createTime,
      Value<int>? groupId,
      Value<int>? order}) {
    return FavoriteAppsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      createTime: createTime ?? this.createTime,
      groupId: groupId ?? this.groupId,
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
    if (createTime.present) {
      map['create_time'] = Variable<DateTime>(createTime.value);
    }
    if (groupId.present) {
      map['group_id'] = Variable<int>(groupId.value);
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
          ..write('createTime: $createTime, ')
          ..write('groupId: $groupId, ')
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
  static const VerificationMeta _createTimeMeta =
      const VerificationMeta('createTime');
  @override
  late final GeneratedColumn<DateTime> createTime = GeneratedColumn<DateTime>(
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
  List<GeneratedColumn> get $columns => [id, name, createTime, order];
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
          _createTimeMeta,
          createTime.isAcceptableOrUnknown(
              data['create_time']!, _createTimeMeta));
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
      createTime: attachedDatabase.typeMapping
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
  final Value<DateTime> createTime;
  final Value<int> order;
  const FavoriteAppGroupsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.createTime = const Value.absent(),
    this.order = const Value.absent(),
  });
  FavoriteAppGroupsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.createTime = const Value.absent(),
    this.order = const Value.absent(),
  }) : name = Value(name);
  static Insertable<FavoriteAppGroup> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? createTime,
    Expression<int>? order,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (createTime != null) 'create_time': createTime,
      if (order != null) 'order': order,
    });
  }

  FavoriteAppGroupsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<DateTime>? createTime,
      Value<int>? order}) {
    return FavoriteAppGroupsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      createTime: createTime ?? this.createTime,
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
    if (createTime.present) {
      map['create_time'] = Variable<DateTime>(createTime.value);
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
          ..write('createTime: $createTime, ')
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
  Value<DateTime> createTime,
  Value<DateTime> updateTime,
  Value<double> readingScrollTop,
  Value<double> readingProgress,
  Value<String> app,
  Value<String?> articleAnalysis,
  Value<String?> source,
});
typedef $$WebpageReadingsTableUpdateCompanionBuilder = WebpageReadingsCompanion
    Function({
  Value<int> id,
  Value<String> url,
  Value<DateTime> createTime,
  Value<DateTime> updateTime,
  Value<double> readingScrollTop,
  Value<double> readingProgress,
  Value<String> app,
  Value<String?> articleAnalysis,
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
            Value<DateTime> createTime = const Value.absent(),
            Value<DateTime> updateTime = const Value.absent(),
            Value<double> readingScrollTop = const Value.absent(),
            Value<double> readingProgress = const Value.absent(),
            Value<String> app = const Value.absent(),
            Value<String?> articleAnalysis = const Value.absent(),
            Value<String?> source = const Value.absent(),
          }) =>
              WebpageReadingsCompanion(
            id: id,
            url: url,
            createTime: createTime,
            updateTime: updateTime,
            readingScrollTop: readingScrollTop,
            readingProgress: readingProgress,
            app: app,
            articleAnalysis: articleAnalysis,
            source: source,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String url,
            Value<DateTime> createTime = const Value.absent(),
            Value<DateTime> updateTime = const Value.absent(),
            Value<double> readingScrollTop = const Value.absent(),
            Value<double> readingProgress = const Value.absent(),
            Value<String> app = const Value.absent(),
            Value<String?> articleAnalysis = const Value.absent(),
            Value<String?> source = const Value.absent(),
          }) =>
              WebpageReadingsCompanion.insert(
            id: id,
            url: url,
            createTime: createTime,
            updateTime: updateTime,
            readingScrollTop: readingScrollTop,
            readingProgress: readingProgress,
            app: app,
            articleAnalysis: articleAnalysis,
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

  ColumnFilters<DateTime> get createTime => $state.composableBuilder(
      column: $state.table.createTime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get updateTime => $state.composableBuilder(
      column: $state.table.updateTime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get readingScrollTop => $state.composableBuilder(
      column: $state.table.readingScrollTop,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<double> get readingProgress => $state.composableBuilder(
      column: $state.table.readingProgress,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get app => $state.composableBuilder(
      column: $state.table.app,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get articleAnalysis => $state.composableBuilder(
      column: $state.table.articleAnalysis,
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

  ColumnOrderings<DateTime> get createTime => $state.composableBuilder(
      column: $state.table.createTime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get updateTime => $state.composableBuilder(
      column: $state.table.updateTime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get readingScrollTop => $state.composableBuilder(
      column: $state.table.readingScrollTop,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<double> get readingProgress => $state.composableBuilder(
      column: $state.table.readingProgress,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get app => $state.composableBuilder(
      column: $state.table.app,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get articleAnalysis => $state.composableBuilder(
      column: $state.table.articleAnalysis,
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
  Value<DateTime> createTime,
  required int groupId,
  Value<int> order,
});
typedef $$FavoriteAppsTableUpdateCompanionBuilder = FavoriteAppsCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<DateTime> createTime,
  Value<int> groupId,
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
            Value<DateTime> createTime = const Value.absent(),
            Value<int> groupId = const Value.absent(),
            Value<int> order = const Value.absent(),
          }) =>
              FavoriteAppsCompanion(
            id: id,
            name: name,
            createTime: createTime,
            groupId: groupId,
            order: order,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<DateTime> createTime = const Value.absent(),
            required int groupId,
            Value<int> order = const Value.absent(),
          }) =>
              FavoriteAppsCompanion.insert(
            id: id,
            name: name,
            createTime: createTime,
            groupId: groupId,
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

  ColumnFilters<DateTime> get createTime => $state.composableBuilder(
      column: $state.table.createTime,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get groupId => $state.composableBuilder(
      column: $state.table.groupId,
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

  ColumnOrderings<DateTime> get createTime => $state.composableBuilder(
      column: $state.table.createTime,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get groupId => $state.composableBuilder(
      column: $state.table.groupId,
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
  Value<DateTime> createTime,
  Value<int> order,
});
typedef $$FavoriteAppGroupsTableUpdateCompanionBuilder
    = FavoriteAppGroupsCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<DateTime> createTime,
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
            Value<DateTime> createTime = const Value.absent(),
            Value<int> order = const Value.absent(),
          }) =>
              FavoriteAppGroupsCompanion(
            id: id,
            name: name,
            createTime: createTime,
            order: order,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<DateTime> createTime = const Value.absent(),
            Value<int> order = const Value.absent(),
          }) =>
              FavoriteAppGroupsCompanion.insert(
            id: id,
            name: name,
            createTime: createTime,
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

  ColumnFilters<DateTime> get createTime => $state.composableBuilder(
      column: $state.table.createTime,
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

  ColumnOrderings<DateTime> get createTime => $state.composableBuilder(
      column: $state.table.createTime,
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
