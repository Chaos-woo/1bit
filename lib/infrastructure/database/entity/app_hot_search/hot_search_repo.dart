import 'package:cw2bit/infrastructure/database/entity/app_hot_search/favorite_app.dart';
import 'package:cw2bit/infrastructure/database/entity/app_hot_search/favorite_app_group.dart';
import 'package:cw2bit/infrastructure/database/entity/r1db_import_mixin.dart';
import 'package:cw2bit/infrastructure/database/r1db.dart';
import 'package:drift/drift.dart';
import 'package:get/get.dart' hide Value;

/// APP热搜相关的仓库
final class HotSearchRepo extends GetxService with R1DatabaseImportMixin {
  static final String tag = '#hotSearchRepo';

  static HotSearchRepo get singl => Get.find(tag: tag);

  /// 获取所有APP
  Future<List<FavoriteApp>> list_apps() async {
    var apps = await (database.select(database.favoriteApps)
          ..orderBy([
            (t) => OrderingTerm(expression: t.order, mode: OrderingMode.asc),
            (t) => OrderingTerm(expression: t.create_time, mode: OrderingMode.desc),
          ]))
        .get();
    var no_order_app = apps.where((a) => a.order == -1).toList();
    var has_order_apps = apps.where((a) => a.order >= 0).toList();
    return [...has_order_apps, ...no_order_app];
  }

  /// 获取所有APP分组
  Future<List<FavoriteAppGroup>> list_groups() async {
    var groups = await (database.select(database.favoriteAppGroups)
          ..orderBy([
            (t) => OrderingTerm(expression: t.order, mode: OrderingMode.asc),
            (t) => OrderingTerm(expression: t.create_time, mode: OrderingMode.desc),
          ]))
        .get();
    var no_order_group = groups.where((g) => g.order == -1).toList();
    var has_order_groups = groups.where((g) => g.order >= 0).toList();
    return [...has_order_groups, ...no_order_group];
  }

  /// 添加APP
  Future<void> add_app(String name, int groupId, int order) async {
    final now = DateTime.now();
    await database.into(database.favoriteApps).insert(
          FavoriteAppsCompanion(
            name: Value(name),
            group_id: Value(groupId),
            order: Value(order),
            create_time: Value(now),
          ),
        );
  }

  /// 添加APP分组
  Future<void> add_group(String name, int order) async {
    name = name.trim().isEmpty ? '未命名' : name.trim();

    final now = DateTime.now();
    await database.into(database.favoriteAppGroups).insert(FavoriteAppGroupsCompanion(
          name: Value(name),
          order: Value(order),
          create_time: Value(now),
        ));
  }

  /// 删除APP
  Future<void> delete_app(int id) async {
    await database.delete(database.favoriteApps)
      ..where((t) => t.id.equals(id))
      ..go();
  }

  /// 删除APPs
  Future<void> delete_apps(List<int> ids) async {
    await database.delete(database.favoriteApps)
      ..where((t) => t.id.isIn(ids))
      ..go();
  }

  /// 删除APP分组及其所有APP
  Future<void> delete_group(int id) async {
    await database.delete(database.favoriteApps)
      ..where((t) => t.group_id.equals(id))
      ..go();

    await database.delete(database.favoriteAppGroups)
      ..where((t) => t.id.equals(id))
      ..go();
  }

  /// 保存APP组排序
  Future<void> save_group_order(List<FavoriteAppGroup> ordered_groups) async {
    final now = DateTime.now();
    for (var i = 0; i < ordered_groups.length; i++) {
      await database.update(database.favoriteAppGroups)
        ..where((t) => t.id.isValue(ordered_groups[i].id!))
        ..write(FavoriteAppGroupsCompanion(order: Value(i), create_time: Value(now)));
    }
  }

  /// 获取APP分组下的所有APP
  Future<List<FavoriteApp>> list_apps_by_group_id(int group_id) async {
    var apps = await (database.select(database.favoriteApps)
          ..where((t) => t.group_id.equals(group_id))
          ..orderBy([
            (t) => OrderingTerm(expression: t.order, mode: OrderingMode.asc),
            (t) => OrderingTerm(expression: t.create_time, mode: OrderingMode.desc),
          ]))
        .get();
    var no_order_app = apps.where((a) => a.order == -1).toList();
    var has_order_apps = apps.where((a) => a.order >= 0).toList();
    return [...has_order_apps, ...no_order_app];
  }

  Future<void> save_apps_order(List<FavoriteApp> ordered_apps) async {
    final now = DateTime.now();
    for (var i = 0; i < ordered_apps.length; i++) {
      await database.update(database.favoriteApps)
        ..where((t) => t.id.isValue(ordered_apps[i].id!))
        ..write(FavoriteAppsCompanion(order: Value(i), create_time: Value(now)));
    }
  }
}
