import 'dart:async';

import 'package:cw2bit/domain/app_hot_search/settings/values/constant.dart';
import 'package:cw2bit/domain/app_hot_search/values/constant.dart';
import 'package:cw2bit/infrastructure/api/github/models/content/github_content.dart';
import 'package:cw2bit/infrastructure/api/github/models/github_enum.dart';
import 'package:cw2bit/infrastructure/c0_.dart';
import 'package:cw2bit/infrastructure/database/entity/app_hot_search/hot_search_group.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

class AppHotSearchSettingLogic extends GetxController {
  List<String> m_black_list = [];
  int? m_default_group_id;
  List<HotSearchGroup> app_groups = [];

  final k_black_list_view_id = '__k_black_list_view_id__';
  final k_default_app_group_view_id = '__k_default_app_group_view_id__';

  /// 获取默认的APP分组
  Future<void> list_app_groups() async {
    app_groups = await c0_.repo_drift.hot_search.list_groups();
    m_default_group_id = q0_.bridge.flustars.preferences.get_int(k_pref_app_hot_search_default_group);
    update([k_default_app_group_view_id]);
  }

  /// 设置或删除默认的APP分组
  Future<void> set_default_app_group(int group_id) async {
    int? stored_default_group_id = q0_.bridge.flustars.preferences.get_int(k_pref_app_hot_search_default_group);
    bool selected_is_stored_group_id = stored_default_group_id == group_id;
    if (selected_is_stored_group_id) {
      await q0_.bridge.flustars.preferences.remove(k_pref_app_hot_search_default_group);
      m_default_group_id = null;
    } else {
      await q0_.bridge.flustars.preferences.put_int(k_pref_app_hot_search_default_group, group_id);
      m_default_group_id = group_id;
    }

    update([k_default_app_group_view_id]);
  }

  /// 获取黑名单列表和APP列表
  Future<List<String>> list_black_apps() async {
    var apps = await fetch_app_list();
    fetch_black_apps_from_cache().then((black_apps) {
      m_black_list = black_apps;
      update([k_black_list_view_id]);
    });
    return apps;
  }

  /// 添加或删除黑名单
  Future<void> add_or_delete_black_app(String app) async {
    List<String> black_apps = await fetch_black_apps_from_cache();
    var black_apps_set = black_apps.toSet();
    if (black_apps_set.contains(app)) {
      black_apps_set.remove(app);
    } else {
      black_apps_set.add(app);
    }
    await q0_.bridge.flustars.preferences.put_string_list(
      k_pref_app_hot_search_black_list,
      black_apps_set.toList(),
    );
    m_black_list = black_apps_set.toList();
    update([k_black_list_view_id]);
  }

  /// 从缓存中获取黑名单列表
  Future<List<String>> fetch_black_apps_from_cache() async {
    List<String> black_apps = await q0_.bridge.flustars.preferences.get_string_list(
      k_pref_app_hot_search_black_list,
      default_value: [],
    )!;
    return Future.value(black_apps);
  }

  /// 从Github获取APP列表
  Future<List<String>> fetch_app_list() async {
    List<GithubContent> contents =
        await c0_.apis_github.list_contents(c_hot_search_repo_owner, c_hot_search_repo, c_hot_search_repo_root_dir);
    List<String> apps = contents
        // 过滤出项目中目录类型的内容，即APP，APP的归档内容都被放置到对应的APP目录下
        .where((content) => EnumGithubContentType.dir == content.type)
        .map((content) => content.name)
        .toList();
    return Future.value(apps);
  }

  /// 添加1个APP组
  Future<void> add_new_app_group(String name) async {
    await c0_.repo_drift.hot_search.add_group(name, -1);
    await list_app_groups();
  }
}
