import 'package:cw2bit/infrastructure/database/entity/app_hot_search/hot_search_app.dart';
import 'package:cw2bit/infrastructure/database/entity/app_hot_search/hot_search_group.dart';
import 'package:cw2bit/infrastructure/database/entity/app_hot_search/with_relation/hot_search_group_has_app.dart';
import 'package:cw2bit/infrastructure/database/entity/r1_database_import_mixin.dart';
import 'package:cw2bit/infrastructure/database/entity_combination/comb_hot_search_group_apps.dart';
import 'package:cw2bit/infrastructure/database/r_database.dart';
import 'package:drift/drift.dart';
import 'package:get/get.dart' hide Value;

/// APP热搜相关的仓库
final class HotSearchRepo extends GetxService with R1DatabaseMixin {
  static final String getx_tag = '__getx_hot_search_repo__';

  static HotSearchRepo get getx => Get.find(tag: getx_tag);

  /// 获取所有APP分组及关联的APP
  Future<List<CombHotSearchGroupApps>> list_groups_with_apps() async {
    // 构建查询
    final query = database.select(t_hot_search_groups).join([
      // 使用左连接来获取所有分组，即使某些分组没有关联的APP
      leftOuterJoin(
          t_hot_search_group_has_apps, t_hot_search_group_has_apps.group_id.equalsExp(t_hot_search_groups.id)),
      // 使用内连接来获取与分组关联的APP
      leftOuterJoin(t_hot_search_apps, t_hot_search_apps.id.equalsExp(t_hot_search_group_has_apps.app_id)),
    ]);

    var group_with_apps = <int, CombHotSearchGroupApps>{};
    for (var row in (await query.get())) {
      // 提取分组信息
      final group = row.readTable(t_hot_search_groups);
      // 提取与当前分组关联的APP
      final app = row.readTableOrNull(t_hot_search_apps);
      if (group_with_apps.containsKey(group.id)) {
        group_with_apps[group.id]!.apps.addAll(app != null ? [app] : []);
      } else {
        group_with_apps[group.id!] = CombHotSearchGroupApps(group: group, apps: app != null ? [app] : []);
      }
    }

    return group_with_apps.values.toList();
  }

  /// 获取所有APP
  Future<List<HotSearchApp>> list_apps() async {
    var apps = await (database.select(database.hotSearchApps)
          ..orderBy([
            (t) => OrderingTerm(expression: t.order, mode: OrderingMode.asc),
            (t) => OrderingTerm(expression: t.create_time, mode: OrderingMode.asc),
          ]))
        .get();
    var no_order_app = apps.where((a) => a.order == -1).toList();
    var has_order_apps = apps.where((a) => a.order >= 0).toList();
    return [...has_order_apps, ...no_order_app];
  }

  /// 获取所有APP分组
  Future<List<HotSearchGroup>> list_groups() async {
    var groups = await (database.select(database.hotSearchGroups)
          ..orderBy([
            (t) => OrderingTerm(expression: t.order, mode: OrderingMode.asc),
            (t) => OrderingTerm(expression: t.create_time, mode: OrderingMode.asc),
          ]))
        .get();
    var no_order_group = groups.where((g) => g.order == -1).toList();
    var has_order_groups = groups.where((g) => g.order >= 0).toList();
    return [...has_order_groups, ...no_order_group];
  }

  /// 添加APP
  Future<void> add_app(String name, int group_id, int order) async {
    final now = DateTime.now();
    return database.transaction(() async {
      int app_id = await database.into(database.hotSearchApps).insert(
            HotSearchAppsCompanion(
              name: Value(name),
              order: Value(order),
              create_time: Value(now),
            ),
          );
      await database.into(database.hotSearchGroupHasApps).insert(HotSearchGroupHasAppsCompanion(
            create_time: Value(now),
            update_time: Value(now),
            group_id: Value(group_id),
            app_id: Value(app_id),
          ));
    });
  }

  /// 添加APP分组
  Future<void> add_group(String name, int order) async {
    name = name.trim().isEmpty ? '未命名' : name.trim();

    final now = DateTime.now();
    await database.into(database.hotSearchGroups).insert(
          HotSearchGroupsCompanion(
            name: Value(name),
            order: Value(order),
            create_time: Value(now),
          ),
        );
  }

  /// 删除APP
  Future<void> delete_app(int id) async {
    return database.transaction(() async {
      await (database.delete(database.hotSearchApps)..where((t) => t.id.equals(id))).go();
      await (database.delete(database.hotSearchGroupHasApps)..where((t) => t.app_id.equals(id))).go();
    });
  }

  /// 删除APPs
  Future<void> delete_apps(List<int> ids) async {
    return database.transaction(() async {
      await (database.delete(database.hotSearchApps)..where((t) => t.id.isIn(ids))).go();
      await (database.delete(database.hotSearchGroupHasApps)..where((t) => t.app_id.isIn(ids))).go();
    });
  }

  /// 删除APP分组及其所有APP
  Future<void> delete_group(int group_id) async {
    return database.transaction(() async {
      // 获取分组关联的APP
      List<HotSearchGroupHasApp> withs =
          await (database.select(database.hotSearchGroupHasApps)..where((t) => t.group_id.equals(group_id))).get();
      // 删除分组与APP的关联
      await (database.delete(database.hotSearchGroupHasApps)..where((t) => t.group_id.equals(group_id))).go();
      // 删除分组关联的APP
      await (database.delete(database.hotSearchApps)..where((t) => t.id.isIn(withs.map((w) => w.app_id)))).go();
      // 删除分组
      await (database.delete(database.hotSearchGroups)..where((t) => t.id.equals(group_id))).go();
    });
  }

  /// 保存APP组排序
  Future<void> save_group_order(List<HotSearchGroup> ordered_groups) async {
    final now = DateTime.now();
    for (var i = 0; i < ordered_groups.length; i++) {
      await database.update(database.hotSearchGroups)
        ..where((t) => t.id.isValue(ordered_groups[i].id!))
        ..write(HotSearchGroupsCompanion(order: Value(i), create_time: Value(now)));
    }
  }

  /// 获取APP分组下的所有APP
  Future<List<HotSearchApp>> list_apps_by_group_id(int group_id) async {
    List<HotSearchGroupHasApp> withs =
        await (database.select(database.hotSearchGroupHasApps)..where((t) => t.group_id.equals(group_id))).get();

    List<int> app_ids = withs.map((w) => w.app_id).toList();

    var apps = await (database.select(database.hotSearchApps)
          ..where((t) => t.id.isIn(app_ids))
          ..orderBy([
            (t) => OrderingTerm(expression: t.order, mode: OrderingMode.asc),
            (t) => OrderingTerm(expression: t.create_time, mode: OrderingMode.desc),
          ]))
        .get();
    var no_order_app = apps.where((a) => a.order == -1).toList();
    var has_order_apps = apps.where((a) => a.order >= 0).toList();
    return [...has_order_apps, ...no_order_app];
  }

  /// 保存APP排序
  Future<void> save_apps_order(List<HotSearchApp> ordered_apps) async {
    final now = DateTime.now();
    for (var i = 0; i < ordered_apps.length; i++) {
      await database.update(database.hotSearchApps)
        ..where((t) => t.id.isValue(ordered_apps[i].id!))
        ..write(HotSearchAppsCompanion(order: Value(i), create_time: Value(now)));
    }
  }
}
