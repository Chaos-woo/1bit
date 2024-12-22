import 'package:cw2bit/domain/app_hot_search/values/constant.dart';
import 'package:cw2bit/infrastructure/ext/system_operation.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

class HotSearchConfigMgr extends GetxService {
  static final String getx_tag = '__getx_hot_search_config_mgr__';

  static HotSearchConfigMgr get getx => Get.find(tag: getx_tag);

  @override
  void onInit() async {
    super.onInit();

    // 初始化热搜的阅读进度完成的阈值配置
    await get_hot_search_read_progress_threshold_config();
  }

  /// 获取默认的APP分组配置
  Future<int?> get_default_app_group_config() async {
    return q0_.bridge.flustars.preferences.get_int(k_pfs_app_hot_search_default_group);
  }

  /// 设置或删除默认的APP分组配置
  /// return GenericOperation.add: 新增
  /// return GenericOperation.delete: 删除
  Future<GenericOperation> set_default_app_group_config(int group_id) async {
    int? stored_default_group_id = q0_.bridge.flustars.preferences.get_int(k_pfs_app_hot_search_default_group);
    bool is_selected_stored_group_id = stored_default_group_id == group_id;
    if (is_selected_stored_group_id) {
      await q0_.bridge.flustars.preferences.remove(k_pfs_app_hot_search_default_group);
      return GenericOperation.delete;
    } else {
      await q0_.bridge.flustars.preferences.put_int(k_pfs_app_hot_search_default_group, group_id);
      return GenericOperation.add;
    }
  }

  /// 获取APP黑名单列表配置
  Future<List<String>> get_black_apps_config() async {
    List<String> black_apps = await q0_.bridge.flustars.preferences.get_string_list(
      k_pfs_app_hot_search_black_list,
      default_value: [],
    )!;
    return Future.value(black_apps);
  }

  /// 设置APP黑名单列表配置
  Future<void> set_black_apps_config(List<String> black_apps) async {
    await q0_.bridge.flustars.preferences.put_string_list(
      k_pfs_app_hot_search_black_list,
      black_apps,
    );
  }

  /// 获取热搜的阅读进度完成的阈值配置缓存，给构建组件使用
  double hot_search_read_progress_threshold = c_default_webpage_progress_finish_threshold;

  int get hot_search_read_progress_threshold_cache_as_int => (hot_search_read_progress_threshold * 100).toInt();

  /// 获取热搜的阅读进度完成的阈值配置
  Future<double> get_hot_search_read_progress_threshold_config() async {
    hot_search_read_progress_threshold = await q0_.bridge.flustars.preferences.get_double(
      k_pfs_webpage_progress_finish_threshold,
      default_value: c_default_webpage_progress_finish_threshold,
    )!;
    return hot_search_read_progress_threshold;
  }

  /// 设置热搜的阅读进度完成的阈值配置
  Future<void> set_hot_search_read_progress_threshold_config(double threshold) async {
    await q0_.bridge.flustars.preferences.put_double(
      k_pfs_webpage_progress_finish_threshold,
      threshold,
    );
    hot_search_read_progress_threshold = threshold;
  }

  /// 获取设置APP是否记录阅读进度列表配置
  Future<List<String>> get_reading_record_white_apps_config() async {
    List<String> white_apps = await q0_.bridge.flustars.preferences.get_string_list(
      k_pfs_app_hot_search_reading_record_white_list,
      default_value: [],
    )!;
    return Future.value(white_apps);
  }

  /// 设置APP是否记录阅读进度列表配置
  Future<void> set_reading_record_white_apps_config(List<String> white_apps) async {
    await q0_.bridge.flustars.preferences.put_string_list(
      k_pfs_app_hot_search_reading_record_white_list,
      white_apps,
    );
  }
}
