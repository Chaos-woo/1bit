import 'package:cw2bit/domain/app_hot_search/values/constant.dart';
import 'package:cw2bit/infrastructure/api/apis.dart';
import 'package:cw2bit/infrastructure/api/github/models/content/github_content.dart';
import 'package:cw2bit/infrastructure/api/github/models/github_enum.dart';
import 'package:cw2bit/infrastructure/database/entity/app_hot_search/favorite_app.dart';
import 'package:cw2bit/infrastructure/database/entity/app_hot_search/favorite_app_group.dart';
import 'package:cw2bit/infrastructure/database/entity/app_hot_search/hot_search_repo.dart';
import 'package:get/get.dart';

class AppHotSearchGroupAppsEditLogic extends GetxController {
  Set<FavoriteApp> _apps = Set();
  List<String> all_apps_from_git = [];

  late FavoriteAppGroup group;

  final k_groups_dnd_view_id = '#kGroupsDndViewId';
  final k_app_dialog_view_id = '#kAppDialogViewId';

  List<FavoriteApp> get apps => _apps.toList();

  static String tag_format(String group_id) => '#appHotSearchGroupAppsEditLogic#$group_id';

  @override
  void onInit() async {
    super.onInit();

    /// 获取指定组下的所有APP
    await refresh_all_apps();

    /// 获取所有APP
    await fetch_app_list_noUi();
  }

  /// 判断本地数据库的APP列表是否存在
  bool is_local_db_exist(String app_name) => _apps.map((a) => a.name).where((name) => name == app_name).isNotEmpty;

  Future<void> refresh_all_apps() async {
    _apps = Set.from(await HotSearchRepo.singl.list_apps_by_group_id(group.id!));
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
      new_apps[i] = FavoriteApp(
        id: app.id,
        group_id: group.id!,
        name: app.name,
        create_time: app.create_time,
        order: i,
      );
    }

    await HotSearchRepo.singl.save_apps_order(new_apps);

    _apps = Set.from(new_apps);
  }

  Future<void> fetch_app_list_noUi() async {
    List<GithubContent> contents =
        await Apis.github.list_contents(c_hot_search_repo_owner, c_hot_search_repo, c_hot_search_repo_root_dir);
    List<String> _apps = contents
        // 过滤出项目中目录类型的内容，即APP，APP的归档内容都被放置到对应的APP目录下
        .where((content) => EnumGithubContentType.dir == content.type)
        .map((content) => content.name)
        .toList();
    all_apps_from_git = _apps;
  }

  /// 添加或删除APP
  Future<void> add_or_delete_app(String app_name) async {
    if (is_local_db_exist(app_name)) {
      var all_deleted_app_ids =
          _apps.where((a) => a.name == app_name).where((a) => a.id != null).map((a) => a.id as int).toList();
      await HotSearchRepo.singl.delete_apps(all_deleted_app_ids);
      _apps = Set.from(await HotSearchRepo.singl.list_apps_by_group_id(group.id!));
    } else {
      await HotSearchRepo.singl.add_app(app_name, group.id!, -1);
      _apps = Set.from(await HotSearchRepo.singl.list_apps_by_group_id(group.id!));
    }

    update([k_app_dialog_view_id, k_groups_dnd_view_id]);
  }

  /// 删除APP
  Future<void> delete_app(int id) async {
    await HotSearchRepo.singl.delete_app(id);
    _apps = Set.from(await HotSearchRepo.singl.list_apps_by_group_id(group.id!));
    update([k_groups_dnd_view_id]);
  }
}
