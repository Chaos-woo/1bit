import 'package:cw2bit/infrastructure/database/entity/app_hot_search/favorite_app.dart';
import 'package:cw2bit/infrastructure/database/entity/app_hot_search/favorite_app_group.dart';
import 'package:cw2bit/infrastructure/database/ra1db.dart';
import 'package:drift/drift.dart';
import 'package:get/get.dart' hide Value;

/// APP热搜相关的仓库
final class HotSearchRepo extends GetxService {
  static final String tag = '#hotSearchRepo';

  static HotSearchRepo get singl => Get.find(tag: tag);

  /// 获取所有APP
  Future<List<FavoriteApp>> listApps() async {
    return await (Ra1DBs.singl.select(Ra1DBs.singl.favoriteApps)
          ..orderBy([
            (t) => OrderingTerm(expression: t.order, mode: OrderingMode.asc),
            (t) => OrderingTerm(expression: t.createTime, mode: OrderingMode.desc),
          ]))
        .get();
  }

  /// 获取所有APP分组
  Future<List<FavoriteAppGroup>> listGroups() async {
    return await (Ra1DBs.singl.select(Ra1DBs.singl.favoriteAppGroups)
          ..orderBy([
            (t) => OrderingTerm(expression: t.order, mode: OrderingMode.asc),
            (t) => OrderingTerm(expression: t.createTime, mode: OrderingMode.desc),
          ]))
        .get();
  }

  /// 添加APP
  Future<void> addApp(String name, int groupId, int order) async {
    final now = DateTime.now();
    await Ra1DBs.singl.into(Ra1DBs.singl.favoriteApps).insert(
          FavoriteAppsCompanion(
            name: Value(name),
            groupId: Value(groupId),
            order: Value(order),
            createTime: Value(now),
          ),
        );
  }

  /// 添加APP分组
  Future<void> addGroup(String name, int order) async {
    final now = DateTime.now();
    await Ra1DBs.singl.into(Ra1DBs.singl.favoriteAppGroups).insert(FavoriteAppGroupsCompanion(
          name: Value(name),
          order: Value(order),
          createTime: Value(now),
        ));
  }

  /// 删除APP
  Future<void> deleteApp(int id) async {
    await Ra1DBs.singl.delete(Ra1DBs.singl.favoriteApps)
      ..where((t) => t.id.equals(id));
  }

  /// 删除APP分组及其所有APP
  Future<void> deleteGroup(int id) async {
    await Ra1DBs.singl.transaction(() async {
      await Ra1DBs.singl.delete(Ra1DBs.singl.favoriteApps)
        ..where((t) => t.groupId.equals(id));

      await Ra1DBs.singl.delete(Ra1DBs.singl.favoriteAppGroups)
        ..where((t) => t.id.equals(id));
    });
  }
}
