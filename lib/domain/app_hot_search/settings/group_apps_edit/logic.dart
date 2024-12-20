import 'package:cw2bit/domain/app_hot_search/service/hot_search_mgr.dart';
import 'package:cw2bit/domain/github/models/github_repo.dart';
import 'package:cw2bit/infrastructure/c0_.dart';
import 'package:cw2bit/infrastructure/database/entity/app_hot_search/hot_search_app.dart';
import 'package:cw2bit/infrastructure/database/entity/app_hot_search/hot_search_group.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

final class _PathVariables {
  String get group_id => q0_.route.path_variables(path_k_group_id)!;

  String get path_k_group_id => '__path_variables_group_id__';
}

class AppHotSearchGroupAppsEditLogic extends GetxController {
  static final _PathVariables m_path_variables = _PathVariables();

  Set<HotSearchApp> _apps = Set();
  List<String> all_apps_from_git = [];

  late HotSearchGroup group;

  final k_groups_dnd_view_id = '__k_groups_dnd_view_id__';
  final k_app_dialog_view_id = '__k_app_dialog_view_id__';

  List<HotSearchApp> get apps => _apps.toList();

  static String getx_tag_format(String group_id) => '__getx_app_hot_search_group_apps_edit_logic_${group_id}__';

  @override
  void onInit() async {
    super.onInit();

    /// 获取指定组下的所有APP
    await refresh_all_apps();

    /// 获取所有APP
    all_apps_from_git = await c0_.bis_mgr_hot_search.fetch_cloud_app_list(GithubRepo.riibit, HotSearchMgr.root_dir);
  }

  /// 判断本地数据库的APP列表是否存在
  bool is_in_local_database(String app_name) => _apps.map((a) => a.name).where((name) => name == app_name).isNotEmpty;

  Future<void> refresh_all_apps() async {
    _apps = Set.from(await c0_.local_data_repo.hot_search.list_apps_by_group_id(group.id!));
    update([k_groups_dnd_view_id]);
  }

  /// 保存APP排序
  Future<void> save_apps_order(int old_index, int new_index) async {
    if (old_index == new_index) {
      return;
    }
    var new_apps = [..._apps];

    var old_group = new_apps.removeAt(old_index);
    new_apps.insert(new_index, old_group);

    for (var i = 0; i < new_apps.length; i++) {
      var app = new_apps[i];
      new_apps[i] = HotSearchApp(
        id: app.id,
        name: app.name,
        create_time: app.create_time,
        update_time: DateTime.now(),
        order: i,
      );
    }

    await c0_.local_data_repo.hot_search.save_apps_order(new_apps);

    _apps = Set.from(new_apps);
  }

  /// 添加或删除APP
  Future<void> add_or_delete_app(String app_name) async {
    if (is_in_local_database(app_name)) {
      var all_deleted_app_ids =
          _apps.where((a) => a.name == app_name).where((a) => a.id != null).map((a) => a.id as int).toList();
      await c0_.local_data_repo.hot_search.delete_apps(all_deleted_app_ids);
      _apps = Set.from(await c0_.local_data_repo.hot_search.list_apps_by_group_id(group.id!));
    } else {
      await c0_.local_data_repo.hot_search.add_app(app_name, group.id!, -1);
      _apps = Set.from(await c0_.local_data_repo.hot_search.list_apps_by_group_id(group.id!));
    }

    update([k_app_dialog_view_id, k_groups_dnd_view_id]);
  }

  /// 删除APP
  Future<void> delete_app(int id) async {
    await c0_.local_data_repo.hot_search.delete_app(id);
    _apps = Set.from(await c0_.local_data_repo.hot_search.list_apps_by_group_id(group.id!));
    update([k_groups_dnd_view_id]);
  }
}
