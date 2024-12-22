import 'package:cw2bit/infrastructure/c0_.dart';
import 'package:cw2bit/infrastructure/database/entity/app_hot_search/hot_search_group.dart';
import 'package:get/get.dart';

class AppHotSearchAppGroupsEditLogic extends GetxController {
  List<HotSearchGroup> app_groups = [];

  final k_groups_dnd_view_id = '__k_groups_dnd_view_id__';

  /// 是否处于长按可排序状态
  bool is_sortable = false;

  @override
  void onInit() async {
    super.onInit();

    /// 获取所有的组
    await refresh_all_app_groups();
  }

  Future<void> refresh_all_app_groups() async {
    app_groups = await c0_.local_data_repo.hot_search.list_groups();
    update([k_groups_dnd_view_id]);
  }

  /// 保存组排序
  Future<void> save_app_groups_order(int old_index, int new_index) async {
    if (old_index == new_index) {
      return;
    }
    var new_app_groups = [...app_groups];

    var old_group = new_app_groups.removeAt(old_index);
    new_app_groups.insert(new_index, old_group);

    for (var i = 0; i < new_app_groups.length; i++) {
      var group = new_app_groups[i];
      new_app_groups[i] = HotSearchGroup(
        id: group.id,
        name: group.name,
        create_time: group.create_time,
        update_time: group.update_time,
        order: i,
      );
    }

    await c0_.local_data_repo.hot_search.save_group_order(new_app_groups);

    app_groups = new_app_groups;
  }

  /// 添加新组
  Future<void> add_new_app_group(String group_name) async {
    await c0_.local_data_repo.hot_search.add_group(group_name, -1);
    await refresh_all_app_groups();
  }

  /// 删除组
  Future<void> delete_app_group(int id) async {
    await c0_.local_data_repo.hot_search.delete_group(id);
    await refresh_all_app_groups();
  }

  Future<void> update_app_group_name(int id, String new_name) async {
    await c0_.local_data_repo.hot_search.update_group_name(id, new_name);
    await refresh_all_app_groups();
  }

  /// 切换为长按可排序列表
  Future<void> switch_sortable_or_not(bool is_long_press_dragging) async {
    this.is_sortable = is_long_press_dragging;
    await refresh_all_app_groups();
  }
}
