// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'r_database.dart';

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
  static const VerificationMeta _publish_timeMeta =
      const VerificationMeta('publish_time');
  @override
  late final GeneratedColumn<DateTime> publish_time = GeneratedColumn<DateTime>(
      'publish_time', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String> author = GeneratedColumn<String>(
      'author', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _first_read_completed_timeMeta =
      const VerificationMeta('first_read_completed_time');
  @override
  late final GeneratedColumn<DateTime> first_read_completed_time =
      GeneratedColumn<DateTime>('first_read_completed_time', aliasedName, true,
          type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _open_time_listMeta =
      const VerificationMeta('open_time_list');
  @override
  late final GeneratedColumn<String> open_time_list = GeneratedColumn<String>(
      'open_time_list', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _is_collectedMeta =
      const VerificationMeta('is_collected');
  @override
  late final GeneratedColumn<bool> is_collected = GeneratedColumn<bool>(
      'is_collected', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_collected" IN (0, 1))'));
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
        source,
        publish_time,
        author,
        title,
        first_read_completed_time,
        open_time_list,
        is_collected
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
    if (data.containsKey('publish_time')) {
      context.handle(
          _publish_timeMeta,
          publish_time.isAcceptableOrUnknown(
              data['publish_time']!, _publish_timeMeta));
    }
    if (data.containsKey('author')) {
      context.handle(_authorMeta,
          author.isAcceptableOrUnknown(data['author']!, _authorMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('first_read_completed_time')) {
      context.handle(
          _first_read_completed_timeMeta,
          first_read_completed_time.isAcceptableOrUnknown(
              data['first_read_completed_time']!,
              _first_read_completed_timeMeta));
    }
    if (data.containsKey('open_time_list')) {
      context.handle(
          _open_time_listMeta,
          open_time_list.isAcceptableOrUnknown(
              data['open_time_list']!, _open_time_listMeta));
    }
    if (data.containsKey('is_collected')) {
      context.handle(
          _is_collectedMeta,
          is_collected.isAcceptableOrUnknown(
              data['is_collected']!, _is_collectedMeta));
    } else if (isInserting) {
      context.missing(_is_collectedMeta);
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
      publish_time: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}publish_time']),
      author: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}author']),
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title']),
      first_read_completed_time: attachedDatabase.typeMapping.read(
          DriftSqlType.dateTime,
          data['${effectivePrefix}first_read_completed_time']),
      open_time_list: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}open_time_list']),
      is_collected: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_collected'])!,
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
  final Value<DateTime?> publish_time;
  final Value<String?> author;
  final Value<String?> title;
  final Value<DateTime?> first_read_completed_time;
  final Value<String?> open_time_list;
  final Value<bool> is_collected;
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
    this.publish_time = const Value.absent(),
    this.author = const Value.absent(),
    this.title = const Value.absent(),
    this.first_read_completed_time = const Value.absent(),
    this.open_time_list = const Value.absent(),
    this.is_collected = const Value.absent(),
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
    this.publish_time = const Value.absent(),
    this.author = const Value.absent(),
    this.title = const Value.absent(),
    this.first_read_completed_time = const Value.absent(),
    this.open_time_list = const Value.absent(),
    required bool is_collected,
  })  : url = Value(url),
        is_collected = Value(is_collected);
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
    Expression<DateTime>? publish_time,
    Expression<String>? author,
    Expression<String>? title,
    Expression<DateTime>? first_read_completed_time,
    Expression<String>? open_time_list,
    Expression<bool>? is_collected,
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
      if (publish_time != null) 'publish_time': publish_time,
      if (author != null) 'author': author,
      if (title != null) 'title': title,
      if (first_read_completed_time != null)
        'first_read_completed_time': first_read_completed_time,
      if (open_time_list != null) 'open_time_list': open_time_list,
      if (is_collected != null) 'is_collected': is_collected,
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
      Value<String?>? source,
      Value<DateTime?>? publish_time,
      Value<String?>? author,
      Value<String?>? title,
      Value<DateTime?>? first_read_completed_time,
      Value<String?>? open_time_list,
      Value<bool>? is_collected}) {
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
      publish_time: publish_time ?? this.publish_time,
      author: author ?? this.author,
      title: title ?? this.title,
      first_read_completed_time:
          first_read_completed_time ?? this.first_read_completed_time,
      open_time_list: open_time_list ?? this.open_time_list,
      is_collected: is_collected ?? this.is_collected,
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
    if (publish_time.present) {
      map['publish_time'] = Variable<DateTime>(publish_time.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (first_read_completed_time.present) {
      map['first_read_completed_time'] =
          Variable<DateTime>(first_read_completed_time.value);
    }
    if (open_time_list.present) {
      map['open_time_list'] = Variable<String>(open_time_list.value);
    }
    if (is_collected.present) {
      map['is_collected'] = Variable<bool>(is_collected.value);
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
          ..write('source: $source, ')
          ..write('publish_time: $publish_time, ')
          ..write('author: $author, ')
          ..write('title: $title, ')
          ..write('first_read_completed_time: $first_read_completed_time, ')
          ..write('open_time_list: $open_time_list, ')
          ..write('is_collected: $is_collected')
          ..write(')'))
        .toString();
  }
}

class $HotSearchAppsTable extends HotSearchApps
    with TableInfo<$HotSearchAppsTable, HotSearchApp> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HotSearchAppsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _update_timeMeta =
      const VerificationMeta('update_time');
  @override
  late final GeneratedColumn<DateTime> update_time = GeneratedColumn<DateTime>(
      'update_time', aliasedName, false,
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
  List<GeneratedColumn> get $columns =>
      [id, name, create_time, update_time, order];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'hot_search_apps';
  @override
  VerificationContext validateIntegrity(Insertable<HotSearchApp> instance,
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
    if (data.containsKey('update_time')) {
      context.handle(
          _update_timeMeta,
          update_time.isAcceptableOrUnknown(
              data['update_time']!, _update_timeMeta));
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
  HotSearchApp map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HotSearchApp(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      create_time: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}create_time'])!,
      update_time: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}update_time'])!,
      order: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order'])!,
    );
  }

  @override
  $HotSearchAppsTable createAlias(String alias) {
    return $HotSearchAppsTable(attachedDatabase, alias);
  }
}

class HotSearchAppsCompanion extends UpdateCompanion<HotSearchApp> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime> create_time;
  final Value<DateTime> update_time;
  final Value<int> order;
  const HotSearchAppsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.create_time = const Value.absent(),
    this.update_time = const Value.absent(),
    this.order = const Value.absent(),
  });
  HotSearchAppsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.create_time = const Value.absent(),
    this.update_time = const Value.absent(),
    this.order = const Value.absent(),
  }) : name = Value(name);
  static Insertable<HotSearchApp> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? create_time,
    Expression<DateTime>? update_time,
    Expression<int>? order,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (create_time != null) 'create_time': create_time,
      if (update_time != null) 'update_time': update_time,
      if (order != null) 'order': order,
    });
  }

  HotSearchAppsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<DateTime>? create_time,
      Value<DateTime>? update_time,
      Value<int>? order}) {
    return HotSearchAppsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      create_time: create_time ?? this.create_time,
      update_time: update_time ?? this.update_time,
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
    if (update_time.present) {
      map['update_time'] = Variable<DateTime>(update_time.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HotSearchAppsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('create_time: $create_time, ')
          ..write('update_time: $update_time, ')
          ..write('order: $order')
          ..write(')'))
        .toString();
  }
}

class $HotSearchGroupsTable extends HotSearchGroups
    with TableInfo<$HotSearchGroupsTable, HotSearchGroup> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HotSearchGroupsTable(this.attachedDatabase, [this._alias]);
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
  static const VerificationMeta _update_timeMeta =
      const VerificationMeta('update_time');
  @override
  late final GeneratedColumn<DateTime> update_time = GeneratedColumn<DateTime>(
      'update_time', aliasedName, false,
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
  List<GeneratedColumn> get $columns =>
      [id, name, create_time, update_time, order];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'hot_search_groups';
  @override
  VerificationContext validateIntegrity(Insertable<HotSearchGroup> instance,
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
    if (data.containsKey('update_time')) {
      context.handle(
          _update_timeMeta,
          update_time.isAcceptableOrUnknown(
              data['update_time']!, _update_timeMeta));
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
  HotSearchGroup map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HotSearchGroup(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      create_time: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}create_time'])!,
      update_time: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}update_time'])!,
      order: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}order'])!,
    );
  }

  @override
  $HotSearchGroupsTable createAlias(String alias) {
    return $HotSearchGroupsTable(attachedDatabase, alias);
  }
}

class HotSearchGroupsCompanion extends UpdateCompanion<HotSearchGroup> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime> create_time;
  final Value<DateTime> update_time;
  final Value<int> order;
  const HotSearchGroupsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.create_time = const Value.absent(),
    this.update_time = const Value.absent(),
    this.order = const Value.absent(),
  });
  HotSearchGroupsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.create_time = const Value.absent(),
    this.update_time = const Value.absent(),
    this.order = const Value.absent(),
  }) : name = Value(name);
  static Insertable<HotSearchGroup> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? create_time,
    Expression<DateTime>? update_time,
    Expression<int>? order,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (create_time != null) 'create_time': create_time,
      if (update_time != null) 'update_time': update_time,
      if (order != null) 'order': order,
    });
  }

  HotSearchGroupsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<DateTime>? create_time,
      Value<DateTime>? update_time,
      Value<int>? order}) {
    return HotSearchGroupsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      create_time: create_time ?? this.create_time,
      update_time: update_time ?? this.update_time,
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
    if (update_time.present) {
      map['update_time'] = Variable<DateTime>(update_time.value);
    }
    if (order.present) {
      map['order'] = Variable<int>(order.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HotSearchGroupsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('create_time: $create_time, ')
          ..write('update_time: $update_time, ')
          ..write('order: $order')
          ..write(')'))
        .toString();
  }
}

class $HotSearchGroupHasAppsTable extends HotSearchGroupHasApps
    with TableInfo<$HotSearchGroupHasAppsTable, HotSearchGroupHasApp> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HotSearchGroupHasAppsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
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
  static const VerificationMeta _group_idMeta =
      const VerificationMeta('group_id');
  @override
  late final GeneratedColumn<int> group_id = GeneratedColumn<int>(
      'group_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _app_idMeta = const VerificationMeta('app_id');
  @override
  late final GeneratedColumn<int> app_id = GeneratedColumn<int>(
      'app_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, create_time, update_time, group_id, app_id];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'hot_search_group_has_apps';
  @override
  VerificationContext validateIntegrity(
      Insertable<HotSearchGroupHasApp> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
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
    if (data.containsKey('group_id')) {
      context.handle(_group_idMeta,
          group_id.isAcceptableOrUnknown(data['group_id']!, _group_idMeta));
    } else if (isInserting) {
      context.missing(_group_idMeta);
    }
    if (data.containsKey('app_id')) {
      context.handle(_app_idMeta,
          app_id.isAcceptableOrUnknown(data['app_id']!, _app_idMeta));
    } else if (isInserting) {
      context.missing(_app_idMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  HotSearchGroupHasApp map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return HotSearchGroupHasApp(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      create_time: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}create_time'])!,
      update_time: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}update_time'])!,
      group_id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}group_id'])!,
      app_id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}app_id'])!,
    );
  }

  @override
  $HotSearchGroupHasAppsTable createAlias(String alias) {
    return $HotSearchGroupHasAppsTable(attachedDatabase, alias);
  }
}

class HotSearchGroupHasAppsCompanion
    extends UpdateCompanion<HotSearchGroupHasApp> {
  final Value<int> id;
  final Value<DateTime> create_time;
  final Value<DateTime> update_time;
  final Value<int> group_id;
  final Value<int> app_id;
  const HotSearchGroupHasAppsCompanion({
    this.id = const Value.absent(),
    this.create_time = const Value.absent(),
    this.update_time = const Value.absent(),
    this.group_id = const Value.absent(),
    this.app_id = const Value.absent(),
  });
  HotSearchGroupHasAppsCompanion.insert({
    this.id = const Value.absent(),
    this.create_time = const Value.absent(),
    this.update_time = const Value.absent(),
    required int group_id,
    required int app_id,
  })  : group_id = Value(group_id),
        app_id = Value(app_id);
  static Insertable<HotSearchGroupHasApp> custom({
    Expression<int>? id,
    Expression<DateTime>? create_time,
    Expression<DateTime>? update_time,
    Expression<int>? group_id,
    Expression<int>? app_id,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (create_time != null) 'create_time': create_time,
      if (update_time != null) 'update_time': update_time,
      if (group_id != null) 'group_id': group_id,
      if (app_id != null) 'app_id': app_id,
    });
  }

  HotSearchGroupHasAppsCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? create_time,
      Value<DateTime>? update_time,
      Value<int>? group_id,
      Value<int>? app_id}) {
    return HotSearchGroupHasAppsCompanion(
      id: id ?? this.id,
      create_time: create_time ?? this.create_time,
      update_time: update_time ?? this.update_time,
      group_id: group_id ?? this.group_id,
      app_id: app_id ?? this.app_id,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (create_time.present) {
      map['create_time'] = Variable<DateTime>(create_time.value);
    }
    if (update_time.present) {
      map['update_time'] = Variable<DateTime>(update_time.value);
    }
    if (group_id.present) {
      map['group_id'] = Variable<int>(group_id.value);
    }
    if (app_id.present) {
      map['app_id'] = Variable<int>(app_id.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HotSearchGroupHasAppsCompanion(')
          ..write('id: $id, ')
          ..write('create_time: $create_time, ')
          ..write('update_time: $update_time, ')
          ..write('group_id: $group_id, ')
          ..write('app_id: $app_id')
          ..write(')'))
        .toString();
  }
}

class $StickersTable extends Stickers with TableInfo<$StickersTable, Sticker> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StickersTable(this.attachedDatabase, [this._alias]);
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
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant("未标记"));
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
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
      'color', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant("E1E1E1"));
  static const VerificationMeta _font_colorMeta =
      const VerificationMeta('font_color');
  @override
  late final GeneratedColumn<String> font_color = GeneratedColumn<String>(
      'font_color', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant("000000"));
  static const VerificationMeta _signMeta = const VerificationMeta('sign');
  @override
  late final GeneratedColumn<String> sign = GeneratedColumn<String>(
      'sign', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant("#"));
  static const VerificationMeta _sticker_typeMeta =
      const VerificationMeta('sticker_type');
  @override
  late final GeneratedColumn<int> sticker_type = GeneratedColumn<int>(
      'sticker_type', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _scopeMeta = const VerificationMeta('scope');
  @override
  late final GeneratedColumn<int> scope = GeneratedColumn<int>(
      'scope', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        create_time,
        update_time,
        color,
        font_color,
        sign,
        sticker_type,
        scope
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'stickers';
  @override
  VerificationContext validateIntegrity(Insertable<Sticker> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
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
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    }
    if (data.containsKey('font_color')) {
      context.handle(
          _font_colorMeta,
          font_color.isAcceptableOrUnknown(
              data['font_color']!, _font_colorMeta));
    }
    if (data.containsKey('sign')) {
      context.handle(
          _signMeta, sign.isAcceptableOrUnknown(data['sign']!, _signMeta));
    }
    if (data.containsKey('sticker_type')) {
      context.handle(
          _sticker_typeMeta,
          sticker_type.isAcceptableOrUnknown(
              data['sticker_type']!, _sticker_typeMeta));
    } else if (isInserting) {
      context.missing(_sticker_typeMeta);
    }
    if (data.containsKey('scope')) {
      context.handle(
          _scopeMeta, scope.isAcceptableOrUnknown(data['scope']!, _scopeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Sticker map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Sticker(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      create_time: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}create_time'])!,
      update_time: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}update_time'])!,
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color'])!,
      font_color: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}font_color'])!,
      sign: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sign'])!,
      sticker_type: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sticker_type'])!,
      scope: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}scope']),
    );
  }

  @override
  $StickersTable createAlias(String alias) {
    return $StickersTable(attachedDatabase, alias);
  }
}

class StickersCompanion extends UpdateCompanion<Sticker> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime> create_time;
  final Value<DateTime> update_time;
  final Value<String> color;
  final Value<String> font_color;
  final Value<String> sign;
  final Value<int> sticker_type;
  final Value<int?> scope;
  const StickersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.create_time = const Value.absent(),
    this.update_time = const Value.absent(),
    this.color = const Value.absent(),
    this.font_color = const Value.absent(),
    this.sign = const Value.absent(),
    this.sticker_type = const Value.absent(),
    this.scope = const Value.absent(),
  });
  StickersCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.create_time = const Value.absent(),
    this.update_time = const Value.absent(),
    this.color = const Value.absent(),
    this.font_color = const Value.absent(),
    this.sign = const Value.absent(),
    required int sticker_type,
    this.scope = const Value.absent(),
  }) : sticker_type = Value(sticker_type);
  static Insertable<Sticker> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? create_time,
    Expression<DateTime>? update_time,
    Expression<String>? color,
    Expression<String>? font_color,
    Expression<String>? sign,
    Expression<int>? sticker_type,
    Expression<int>? scope,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (create_time != null) 'create_time': create_time,
      if (update_time != null) 'update_time': update_time,
      if (color != null) 'color': color,
      if (font_color != null) 'font_color': font_color,
      if (sign != null) 'sign': sign,
      if (sticker_type != null) 'sticker_type': sticker_type,
      if (scope != null) 'scope': scope,
    });
  }

  StickersCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<DateTime>? create_time,
      Value<DateTime>? update_time,
      Value<String>? color,
      Value<String>? font_color,
      Value<String>? sign,
      Value<int>? sticker_type,
      Value<int?>? scope}) {
    return StickersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      create_time: create_time ?? this.create_time,
      update_time: update_time ?? this.update_time,
      color: color ?? this.color,
      font_color: font_color ?? this.font_color,
      sign: sign ?? this.sign,
      sticker_type: sticker_type ?? this.sticker_type,
      scope: scope ?? this.scope,
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
    if (update_time.present) {
      map['update_time'] = Variable<DateTime>(update_time.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (font_color.present) {
      map['font_color'] = Variable<String>(font_color.value);
    }
    if (sign.present) {
      map['sign'] = Variable<String>(sign.value);
    }
    if (sticker_type.present) {
      map['sticker_type'] = Variable<int>(sticker_type.value);
    }
    if (scope.present) {
      map['scope'] = Variable<int>(scope.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StickersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('create_time: $create_time, ')
          ..write('update_time: $update_time, ')
          ..write('color: $color, ')
          ..write('font_color: $font_color, ')
          ..write('sign: $sign, ')
          ..write('sticker_type: $sticker_type, ')
          ..write('scope: $scope')
          ..write(')'))
        .toString();
  }
}

class $WebpageReadingHasStickersTable extends WebpageReadingHasStickers
    with TableInfo<$WebpageReadingHasStickersTable, WebpageReadingHasSticker> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WebpageReadingHasStickersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
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
  static const VerificationMeta _webpage_reading_idMeta =
      const VerificationMeta('webpage_reading_id');
  @override
  late final GeneratedColumn<int> webpage_reading_id = GeneratedColumn<int>(
      'webpage_reading_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _sticker_idMeta =
      const VerificationMeta('sticker_id');
  @override
  late final GeneratedColumn<int> sticker_id = GeneratedColumn<int>(
      'sticker_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, create_time, update_time, webpage_reading_id, sticker_id];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'webpage_reading_has_stickers';
  @override
  VerificationContext validateIntegrity(
      Insertable<WebpageReadingHasSticker> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
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
    if (data.containsKey('webpage_reading_id')) {
      context.handle(
          _webpage_reading_idMeta,
          webpage_reading_id.isAcceptableOrUnknown(
              data['webpage_reading_id']!, _webpage_reading_idMeta));
    } else if (isInserting) {
      context.missing(_webpage_reading_idMeta);
    }
    if (data.containsKey('sticker_id')) {
      context.handle(
          _sticker_idMeta,
          sticker_id.isAcceptableOrUnknown(
              data['sticker_id']!, _sticker_idMeta));
    } else if (isInserting) {
      context.missing(_sticker_idMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WebpageReadingHasSticker map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WebpageReadingHasSticker(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      create_time: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}create_time'])!,
      update_time: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}update_time'])!,
      webpage_reading_id: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}webpage_reading_id'])!,
      sticker_id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sticker_id'])!,
    );
  }

  @override
  $WebpageReadingHasStickersTable createAlias(String alias) {
    return $WebpageReadingHasStickersTable(attachedDatabase, alias);
  }
}

class WebpageReadingHasStickersCompanion
    extends UpdateCompanion<WebpageReadingHasSticker> {
  final Value<int> id;
  final Value<DateTime> create_time;
  final Value<DateTime> update_time;
  final Value<int> webpage_reading_id;
  final Value<int> sticker_id;
  const WebpageReadingHasStickersCompanion({
    this.id = const Value.absent(),
    this.create_time = const Value.absent(),
    this.update_time = const Value.absent(),
    this.webpage_reading_id = const Value.absent(),
    this.sticker_id = const Value.absent(),
  });
  WebpageReadingHasStickersCompanion.insert({
    this.id = const Value.absent(),
    this.create_time = const Value.absent(),
    this.update_time = const Value.absent(),
    required int webpage_reading_id,
    required int sticker_id,
  })  : webpage_reading_id = Value(webpage_reading_id),
        sticker_id = Value(sticker_id);
  static Insertable<WebpageReadingHasSticker> custom({
    Expression<int>? id,
    Expression<DateTime>? create_time,
    Expression<DateTime>? update_time,
    Expression<int>? webpage_reading_id,
    Expression<int>? sticker_id,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (create_time != null) 'create_time': create_time,
      if (update_time != null) 'update_time': update_time,
      if (webpage_reading_id != null) 'webpage_reading_id': webpage_reading_id,
      if (sticker_id != null) 'sticker_id': sticker_id,
    });
  }

  WebpageReadingHasStickersCompanion copyWith(
      {Value<int>? id,
      Value<DateTime>? create_time,
      Value<DateTime>? update_time,
      Value<int>? webpage_reading_id,
      Value<int>? sticker_id}) {
    return WebpageReadingHasStickersCompanion(
      id: id ?? this.id,
      create_time: create_time ?? this.create_time,
      update_time: update_time ?? this.update_time,
      webpage_reading_id: webpage_reading_id ?? this.webpage_reading_id,
      sticker_id: sticker_id ?? this.sticker_id,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (create_time.present) {
      map['create_time'] = Variable<DateTime>(create_time.value);
    }
    if (update_time.present) {
      map['update_time'] = Variable<DateTime>(update_time.value);
    }
    if (webpage_reading_id.present) {
      map['webpage_reading_id'] = Variable<int>(webpage_reading_id.value);
    }
    if (sticker_id.present) {
      map['sticker_id'] = Variable<int>(sticker_id.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WebpageReadingHasStickersCompanion(')
          ..write('id: $id, ')
          ..write('create_time: $create_time, ')
          ..write('update_time: $update_time, ')
          ..write('webpage_reading_id: $webpage_reading_id, ')
          ..write('sticker_id: $sticker_id')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $WebpageReadingsTable webpageReadings =
      $WebpageReadingsTable(this);
  late final $HotSearchAppsTable hotSearchApps = $HotSearchAppsTable(this);
  late final $HotSearchGroupsTable hotSearchGroups =
      $HotSearchGroupsTable(this);
  late final $HotSearchGroupHasAppsTable hotSearchGroupHasApps =
      $HotSearchGroupHasAppsTable(this);
  late final $StickersTable stickers = $StickersTable(this);
  late final $WebpageReadingHasStickersTable webpageReadingHasStickers =
      $WebpageReadingHasStickersTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        webpageReadings,
        hotSearchApps,
        hotSearchGroups,
        hotSearchGroupHasApps,
        stickers,
        webpageReadingHasStickers
      ];
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
  Value<DateTime?> publish_time,
  Value<String?> author,
  Value<String?> title,
  Value<DateTime?> first_read_completed_time,
  Value<String?> open_time_list,
  required bool is_collected,
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
  Value<DateTime?> publish_time,
  Value<String?> author,
  Value<String?> title,
  Value<DateTime?> first_read_completed_time,
  Value<String?> open_time_list,
  Value<bool> is_collected,
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
            Value<DateTime?> publish_time = const Value.absent(),
            Value<String?> author = const Value.absent(),
            Value<String?> title = const Value.absent(),
            Value<DateTime?> first_read_completed_time = const Value.absent(),
            Value<String?> open_time_list = const Value.absent(),
            Value<bool> is_collected = const Value.absent(),
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
            publish_time: publish_time,
            author: author,
            title: title,
            first_read_completed_time: first_read_completed_time,
            open_time_list: open_time_list,
            is_collected: is_collected,
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
            Value<DateTime?> publish_time = const Value.absent(),
            Value<String?> author = const Value.absent(),
            Value<String?> title = const Value.absent(),
            Value<DateTime?> first_read_completed_time = const Value.absent(),
            Value<String?> open_time_list = const Value.absent(),
            required bool is_collected,
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
            publish_time: publish_time,
            author: author,
            title: title,
            first_read_completed_time: first_read_completed_time,
            open_time_list: open_time_list,
            is_collected: is_collected,
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

  ColumnFilters<DateTime> get publish_time => $state.composableBuilder(
      column: $state.table.publish_time,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get author => $state.composableBuilder(
      column: $state.table.author,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<DateTime> get first_read_completed_time => $state
      .composableBuilder(
          column: $state.table.first_read_completed_time,
          builder: (column, joinBuilders) =>
              ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get open_time_list => $state.composableBuilder(
      column: $state.table.open_time_list,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<bool> get is_collected => $state.composableBuilder(
      column: $state.table.is_collected,
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

  ColumnOrderings<DateTime> get publish_time => $state.composableBuilder(
      column: $state.table.publish_time,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get author => $state.composableBuilder(
      column: $state.table.author,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<DateTime> get first_read_completed_time =>
      $state.composableBuilder(
          column: $state.table.first_read_completed_time,
          builder: (column, joinBuilders) =>
              ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get open_time_list => $state.composableBuilder(
      column: $state.table.open_time_list,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<bool> get is_collected => $state.composableBuilder(
      column: $state.table.is_collected,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$HotSearchAppsTableCreateCompanionBuilder = HotSearchAppsCompanion
    Function({
  Value<int> id,
  required String name,
  Value<DateTime> create_time,
  Value<DateTime> update_time,
  Value<int> order,
});
typedef $$HotSearchAppsTableUpdateCompanionBuilder = HotSearchAppsCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<DateTime> create_time,
  Value<DateTime> update_time,
  Value<int> order,
});

class $$HotSearchAppsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $HotSearchAppsTable,
    HotSearchApp,
    $$HotSearchAppsTableFilterComposer,
    $$HotSearchAppsTableOrderingComposer,
    $$HotSearchAppsTableCreateCompanionBuilder,
    $$HotSearchAppsTableUpdateCompanionBuilder> {
  $$HotSearchAppsTableTableManager(_$AppDatabase db, $HotSearchAppsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$HotSearchAppsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$HotSearchAppsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<DateTime> create_time = const Value.absent(),
            Value<DateTime> update_time = const Value.absent(),
            Value<int> order = const Value.absent(),
          }) =>
              HotSearchAppsCompanion(
            id: id,
            name: name,
            create_time: create_time,
            update_time: update_time,
            order: order,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<DateTime> create_time = const Value.absent(),
            Value<DateTime> update_time = const Value.absent(),
            Value<int> order = const Value.absent(),
          }) =>
              HotSearchAppsCompanion.insert(
            id: id,
            name: name,
            create_time: create_time,
            update_time: update_time,
            order: order,
          ),
        ));
}

class $$HotSearchAppsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $HotSearchAppsTable> {
  $$HotSearchAppsTableFilterComposer(super.$state);
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

  ColumnFilters<DateTime> get update_time => $state.composableBuilder(
      column: $state.table.update_time,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get order => $state.composableBuilder(
      column: $state.table.order,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$HotSearchAppsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $HotSearchAppsTable> {
  $$HotSearchAppsTableOrderingComposer(super.$state);
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

  ColumnOrderings<DateTime> get update_time => $state.composableBuilder(
      column: $state.table.update_time,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get order => $state.composableBuilder(
      column: $state.table.order,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$HotSearchGroupsTableCreateCompanionBuilder = HotSearchGroupsCompanion
    Function({
  Value<int> id,
  required String name,
  Value<DateTime> create_time,
  Value<DateTime> update_time,
  Value<int> order,
});
typedef $$HotSearchGroupsTableUpdateCompanionBuilder = HotSearchGroupsCompanion
    Function({
  Value<int> id,
  Value<String> name,
  Value<DateTime> create_time,
  Value<DateTime> update_time,
  Value<int> order,
});

class $$HotSearchGroupsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $HotSearchGroupsTable,
    HotSearchGroup,
    $$HotSearchGroupsTableFilterComposer,
    $$HotSearchGroupsTableOrderingComposer,
    $$HotSearchGroupsTableCreateCompanionBuilder,
    $$HotSearchGroupsTableUpdateCompanionBuilder> {
  $$HotSearchGroupsTableTableManager(
      _$AppDatabase db, $HotSearchGroupsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$HotSearchGroupsTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$HotSearchGroupsTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<DateTime> create_time = const Value.absent(),
            Value<DateTime> update_time = const Value.absent(),
            Value<int> order = const Value.absent(),
          }) =>
              HotSearchGroupsCompanion(
            id: id,
            name: name,
            create_time: create_time,
            update_time: update_time,
            order: order,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String name,
            Value<DateTime> create_time = const Value.absent(),
            Value<DateTime> update_time = const Value.absent(),
            Value<int> order = const Value.absent(),
          }) =>
              HotSearchGroupsCompanion.insert(
            id: id,
            name: name,
            create_time: create_time,
            update_time: update_time,
            order: order,
          ),
        ));
}

class $$HotSearchGroupsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $HotSearchGroupsTable> {
  $$HotSearchGroupsTableFilterComposer(super.$state);
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

  ColumnFilters<DateTime> get update_time => $state.composableBuilder(
      column: $state.table.update_time,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get order => $state.composableBuilder(
      column: $state.table.order,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$HotSearchGroupsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $HotSearchGroupsTable> {
  $$HotSearchGroupsTableOrderingComposer(super.$state);
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

  ColumnOrderings<DateTime> get update_time => $state.composableBuilder(
      column: $state.table.update_time,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get order => $state.composableBuilder(
      column: $state.table.order,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$HotSearchGroupHasAppsTableCreateCompanionBuilder
    = HotSearchGroupHasAppsCompanion Function({
  Value<int> id,
  Value<DateTime> create_time,
  Value<DateTime> update_time,
  required int group_id,
  required int app_id,
});
typedef $$HotSearchGroupHasAppsTableUpdateCompanionBuilder
    = HotSearchGroupHasAppsCompanion Function({
  Value<int> id,
  Value<DateTime> create_time,
  Value<DateTime> update_time,
  Value<int> group_id,
  Value<int> app_id,
});

class $$HotSearchGroupHasAppsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $HotSearchGroupHasAppsTable,
    HotSearchGroupHasApp,
    $$HotSearchGroupHasAppsTableFilterComposer,
    $$HotSearchGroupHasAppsTableOrderingComposer,
    $$HotSearchGroupHasAppsTableCreateCompanionBuilder,
    $$HotSearchGroupHasAppsTableUpdateCompanionBuilder> {
  $$HotSearchGroupHasAppsTableTableManager(
      _$AppDatabase db, $HotSearchGroupHasAppsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$HotSearchGroupHasAppsTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$HotSearchGroupHasAppsTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> create_time = const Value.absent(),
            Value<DateTime> update_time = const Value.absent(),
            Value<int> group_id = const Value.absent(),
            Value<int> app_id = const Value.absent(),
          }) =>
              HotSearchGroupHasAppsCompanion(
            id: id,
            create_time: create_time,
            update_time: update_time,
            group_id: group_id,
            app_id: app_id,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> create_time = const Value.absent(),
            Value<DateTime> update_time = const Value.absent(),
            required int group_id,
            required int app_id,
          }) =>
              HotSearchGroupHasAppsCompanion.insert(
            id: id,
            create_time: create_time,
            update_time: update_time,
            group_id: group_id,
            app_id: app_id,
          ),
        ));
}

class $$HotSearchGroupHasAppsTableFilterComposer
    extends FilterComposer<_$AppDatabase, $HotSearchGroupHasAppsTable> {
  $$HotSearchGroupHasAppsTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
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

  ColumnFilters<int> get group_id => $state.composableBuilder(
      column: $state.table.group_id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get app_id => $state.composableBuilder(
      column: $state.table.app_id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$HotSearchGroupHasAppsTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $HotSearchGroupHasAppsTable> {
  $$HotSearchGroupHasAppsTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
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

  ColumnOrderings<int> get group_id => $state.composableBuilder(
      column: $state.table.group_id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get app_id => $state.composableBuilder(
      column: $state.table.app_id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$StickersTableCreateCompanionBuilder = StickersCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<DateTime> create_time,
  Value<DateTime> update_time,
  Value<String> color,
  Value<String> font_color,
  Value<String> sign,
  required int sticker_type,
  Value<int?> scope,
});
typedef $$StickersTableUpdateCompanionBuilder = StickersCompanion Function({
  Value<int> id,
  Value<String> name,
  Value<DateTime> create_time,
  Value<DateTime> update_time,
  Value<String> color,
  Value<String> font_color,
  Value<String> sign,
  Value<int> sticker_type,
  Value<int?> scope,
});

class $$StickersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $StickersTable,
    Sticker,
    $$StickersTableFilterComposer,
    $$StickersTableOrderingComposer,
    $$StickersTableCreateCompanionBuilder,
    $$StickersTableUpdateCompanionBuilder> {
  $$StickersTableTableManager(_$AppDatabase db, $StickersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$StickersTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$StickersTableOrderingComposer(ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<DateTime> create_time = const Value.absent(),
            Value<DateTime> update_time = const Value.absent(),
            Value<String> color = const Value.absent(),
            Value<String> font_color = const Value.absent(),
            Value<String> sign = const Value.absent(),
            Value<int> sticker_type = const Value.absent(),
            Value<int?> scope = const Value.absent(),
          }) =>
              StickersCompanion(
            id: id,
            name: name,
            create_time: create_time,
            update_time: update_time,
            color: color,
            font_color: font_color,
            sign: sign,
            sticker_type: sticker_type,
            scope: scope,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<DateTime> create_time = const Value.absent(),
            Value<DateTime> update_time = const Value.absent(),
            Value<String> color = const Value.absent(),
            Value<String> font_color = const Value.absent(),
            Value<String> sign = const Value.absent(),
            required int sticker_type,
            Value<int?> scope = const Value.absent(),
          }) =>
              StickersCompanion.insert(
            id: id,
            name: name,
            create_time: create_time,
            update_time: update_time,
            color: color,
            font_color: font_color,
            sign: sign,
            sticker_type: sticker_type,
            scope: scope,
          ),
        ));
}

class $$StickersTableFilterComposer
    extends FilterComposer<_$AppDatabase, $StickersTable> {
  $$StickersTableFilterComposer(super.$state);
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

  ColumnFilters<DateTime> get update_time => $state.composableBuilder(
      column: $state.table.update_time,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get color => $state.composableBuilder(
      column: $state.table.color,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get font_color => $state.composableBuilder(
      column: $state.table.font_color,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get sign => $state.composableBuilder(
      column: $state.table.sign,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get sticker_type => $state.composableBuilder(
      column: $state.table.sticker_type,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get scope => $state.composableBuilder(
      column: $state.table.scope,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$StickersTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $StickersTable> {
  $$StickersTableOrderingComposer(super.$state);
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

  ColumnOrderings<DateTime> get update_time => $state.composableBuilder(
      column: $state.table.update_time,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get color => $state.composableBuilder(
      column: $state.table.color,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get font_color => $state.composableBuilder(
      column: $state.table.font_color,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get sign => $state.composableBuilder(
      column: $state.table.sign,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get sticker_type => $state.composableBuilder(
      column: $state.table.sticker_type,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get scope => $state.composableBuilder(
      column: $state.table.scope,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

typedef $$WebpageReadingHasStickersTableCreateCompanionBuilder
    = WebpageReadingHasStickersCompanion Function({
  Value<int> id,
  Value<DateTime> create_time,
  Value<DateTime> update_time,
  required int webpage_reading_id,
  required int sticker_id,
});
typedef $$WebpageReadingHasStickersTableUpdateCompanionBuilder
    = WebpageReadingHasStickersCompanion Function({
  Value<int> id,
  Value<DateTime> create_time,
  Value<DateTime> update_time,
  Value<int> webpage_reading_id,
  Value<int> sticker_id,
});

class $$WebpageReadingHasStickersTableTableManager extends RootTableManager<
    _$AppDatabase,
    $WebpageReadingHasStickersTable,
    WebpageReadingHasSticker,
    $$WebpageReadingHasStickersTableFilterComposer,
    $$WebpageReadingHasStickersTableOrderingComposer,
    $$WebpageReadingHasStickersTableCreateCompanionBuilder,
    $$WebpageReadingHasStickersTableUpdateCompanionBuilder> {
  $$WebpageReadingHasStickersTableTableManager(
      _$AppDatabase db, $WebpageReadingHasStickersTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer: $$WebpageReadingHasStickersTableFilterComposer(
              ComposerState(db, table)),
          orderingComposer: $$WebpageReadingHasStickersTableOrderingComposer(
              ComposerState(db, table)),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> create_time = const Value.absent(),
            Value<DateTime> update_time = const Value.absent(),
            Value<int> webpage_reading_id = const Value.absent(),
            Value<int> sticker_id = const Value.absent(),
          }) =>
              WebpageReadingHasStickersCompanion(
            id: id,
            create_time: create_time,
            update_time: update_time,
            webpage_reading_id: webpage_reading_id,
            sticker_id: sticker_id,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<DateTime> create_time = const Value.absent(),
            Value<DateTime> update_time = const Value.absent(),
            required int webpage_reading_id,
            required int sticker_id,
          }) =>
              WebpageReadingHasStickersCompanion.insert(
            id: id,
            create_time: create_time,
            update_time: update_time,
            webpage_reading_id: webpage_reading_id,
            sticker_id: sticker_id,
          ),
        ));
}

class $$WebpageReadingHasStickersTableFilterComposer
    extends FilterComposer<_$AppDatabase, $WebpageReadingHasStickersTable> {
  $$WebpageReadingHasStickersTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
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

  ColumnFilters<int> get webpage_reading_id => $state.composableBuilder(
      column: $state.table.webpage_reading_id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get sticker_id => $state.composableBuilder(
      column: $state.table.sticker_id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$WebpageReadingHasStickersTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $WebpageReadingHasStickersTable> {
  $$WebpageReadingHasStickersTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
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

  ColumnOrderings<int> get webpage_reading_id => $state.composableBuilder(
      column: $state.table.webpage_reading_id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get sticker_id => $state.composableBuilder(
      column: $state.table.sticker_id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$WebpageReadingsTableTableManager get webpageReadings =>
      $$WebpageReadingsTableTableManager(_db, _db.webpageReadings);
  $$HotSearchAppsTableTableManager get hotSearchApps =>
      $$HotSearchAppsTableTableManager(_db, _db.hotSearchApps);
  $$HotSearchGroupsTableTableManager get hotSearchGroups =>
      $$HotSearchGroupsTableTableManager(_db, _db.hotSearchGroups);
  $$HotSearchGroupHasAppsTableTableManager get hotSearchGroupHasApps =>
      $$HotSearchGroupHasAppsTableTableManager(_db, _db.hotSearchGroupHasApps);
  $$StickersTableTableManager get stickers =>
      $$StickersTableTableManager(_db, _db.stickers);
  $$WebpageReadingHasStickersTableTableManager get webpageReadingHasStickers =>
      $$WebpageReadingHasStickersTableTableManager(
          _db, _db.webpageReadingHasStickers);
}
