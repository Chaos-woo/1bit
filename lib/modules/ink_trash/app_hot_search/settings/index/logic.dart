import 'dart:async';

import 'package:cw2bit/modules/app_hot_search/service/hot_search_mgr.dart';
import 'package:cw2bit/modules/app_hot_search/settings/app_reading_threshold_config/logic.dart';
import 'package:cw2bit/modules/github/models/github_repo.dart';
import 'package:cw2bit/infrastructure/c0_.dart';
import 'package:cw2bit/infrastructure/database/entity/app_hot_search/hot_search_group.dart';
import 'package:cw2bit/infrastructure/ext/system_operation.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

class AppHotSearchSettingLogic extends GetxController {
  List<String> m_black_list = [];
  List<String> m_reading_record_white_list = [];
  int? m_default_group_id;
  List<HotSearchGroup> app_groups = [];

  final k_black_list_view_id = '__k_black_list_view_id__';
  final k_reading_record_white_list_view_id = '__k_reading_record_white_list_view_id__';
  final k_default_app_group_view_id = '__k_default_app_group_view_id__';

  @override
  void onInit() {
    super.onInit();
  }

  /// 获取默认的APP分组
  Future<void> list_app_groups() async {
    app_groups = await c0_.data_repository.hot_search.list_groups();
    m_default_group_id = await c0_.bis_mgr_hot_search_config.get_default_app_group_config();
    update([k_default_app_group_view_id]);
  }

  /// 设置或删除默认的APP分组
  Future<void> set_default_app_group(int group_id) async {
    var operation = await c0_.bis_mgr_hot_search_config.set_default_app_group_config(group_id);
    m_default_group_id = operation == GenericOperation.add ? group_id : null;

    update([k_default_app_group_view_id]);
  }

  /// 获取黑名单列表和APP列表
  Future<List<String>> list_black_apps() async {
    var apps = await c0_.bis_mgr_hot_search.fetch_cloud_app_list(GithubRepo.riibit, HotSearchMgr.root_dir);
    c0_.bis_mgr_hot_search_config.get_black_apps_config().then((black_apps) {
      m_black_list = black_apps;
      update([k_black_list_view_id]);
    });
    return apps;
  }

  /// 添加或删除黑名单
  Future<void> add_or_delete_black_app(String app) async {
    List<String> black_apps = await c0_.bis_mgr_hot_search_config.get_black_apps_config();
    var black_apps_set = black_apps.toSet();
    if (black_apps_set.contains(app)) {
      black_apps_set.remove(app);
    } else {
      black_apps_set.add(app);
    }
    await c0_.bis_mgr_hot_search_config.set_black_apps_config(black_apps_set.toList());
    m_black_list = black_apps_set.toList();
    update([k_black_list_view_id]);
  }

  /// 设置APP是否记录阅读进度，添加或删除
  Future<void> add_or_delete_reading_record_app(String app) async {
    List<String> white_apps = await c0_.bis_mgr_hot_search_config.get_black_apps_config();
    var white_apps_set = white_apps.toSet();
    if (white_apps_set.contains(app)) {
      white_apps_set.remove(app);
    } else {
      white_apps_set.add(app);
    }
    await c0_.bis_mgr_hot_search_config.set_black_apps_config(white_apps_set.toList());
    m_black_list = white_apps_set.toList();
    update([k_reading_record_white_list_view_id]);
  }

  /// 获取APP是否记录阅读进度APP列表
  Future<List<String>> list_reading_record_white_apps() async {
    var apps = await c0_.bis_mgr_hot_search.fetch_cloud_app_list(GithubRepo.riibit, HotSearchMgr.root_dir);
    c0_.bis_mgr_hot_search_config.get_reading_record_white_apps_config().then((white_apps) {
      m_reading_record_white_list = white_apps;
      update([k_reading_record_white_list_view_id]);
    });
    return apps;
  }

  /// 添加1个APP组
  Future<void> add_new_app_group(String name) async {
    await c0_.data_repository.hot_search.addGroup(name, -1);
    await list_app_groups();
  }
}
