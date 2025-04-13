import 'package:cw2bit/modules/app_hot_search/history_hot_search/index/state.dart';
import 'package:cw2bit/modules/app_hot_search/models/hot_search_model.dart';
import 'package:cw2bit/modules/app_hot_search/service/hot_search_mgr.dart';
import 'package:cw2bit/modules/app_hot_search/values/constant.dart';
import 'package:cw2bit/modules/github/models/github_repo.dart';
import 'package:cw2bit/infrastructure/api/github/models/content/github_content.dart';
import 'package:cw2bit/infrastructure/api/github/models/github_content_type.dart';
import 'package:cw2bit/infrastructure/c0_.dart';
import 'package:cw2bit/infrastructure/database/entity/app_hot_search/hot_search_app.dart';
import 'package:cw2bit/public/webview/app_webview_dialog.dart';
import 'package:cw2bit/public/webview/app_webview_listener.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class HistoryHotSearchLogic extends GetxController {
  final HistoryHotSearchState state = HistoryHotSearchState();

  final k_app_scroll_view_view_id = '__k_app_scroll_view_view_id__';
  final k_group_scroll_view_view_id = '__k_group_scroll_view_view_id__';
  final k_app_hot_search_history_directory_view_id = '__k_app_hot_search_history_directory_view_id__';
  final k_hot_search_scroll_view_view_id = '__k_hot_search_scroll_view_view_id__';

  final k_hot_search_repo_view_id = '__k_hot_search_repo_view_id__';

  /// 日历的Key
  final calendar_key = GlobalKey();

  final github_file_scroll_controller = ItemScrollController();

  final c_bitmap_hot_search_exist_value = '1';
  final c_bitmap_hot_search_not_exist_value = '0';

  @override
  void onReady() async {
    super.onReady();

    await m_refresh_group_apps_and_hot_search_list();
  }

  Future<void> m_refresh_group_apps_and_hot_search_list() async {
    state.app = '';
    state.group_id = -1;
    state.favorite_app_group = await c0_.bis_mgr_hot_search.fetch_comb_hot_search_groups(state.repo);

    /// 刷新UI
    switch_favorite_group_noui(state.group_id);
    update([k_app_scroll_view_view_id, k_group_scroll_view_view_id]);
  }

  /// 切换热搜仓库，并刷新所有数据
  Future<void> switch_hot_search_repo_noUi(GithubRepo repo) async {
    state.repo = repo;
    state.apps = [];
    state.app = '';
    state.group_id = -1;
    state.picked_date = null;
    state.hot_search_list = [];
    state.m_current_file_path = '';
    state.m_current_dir_path = '';
    state.history_directory_list = [];
    update([k_app_hot_search_history_directory_view_id, k_hot_search_scroll_view_view_id, k_hot_search_repo_view_id]);
    await m_refresh_group_apps_and_hot_search_list();
    update([k_app_hot_search_history_directory_view_id, k_hot_search_scroll_view_view_id, k_hot_search_repo_view_id]);
  }

  /// 根据URL获取APP的热搜阅读进度比
  ReadingProgressRatio get_app_progress_ratio(String url) {
    var reading = state.get_webpage_reading(url);
    return c0_.bis_mgr_hot_search.calculate_web_reading_progress_ratio(reading);
  }

  /// 使用webview打开热搜内容
  Future<void> open_hot_search_webview(HotSearchModel model) async {
    // 当前APP是否不记录阅读记录
    bool is_process_reading_record =
        await c0_.bis_mgr_hot_search_config.is_in_store_reading_record_white_apps(state.app);

    var webpage_listener = null;

    /// 处理当前阅读进度
    if (is_process_reading_record) {
      var reading_record = await c0_.data_repository.webpage.get_reading_record(model.url);
      int reading_record_id = reading_record?.id ?? -1;
      if (reading_record == null) {
        reading_record_id = await c0_.data_repository.webpage.add_reading_record(
          model.url,
          app: state.app,
          author: state.app,
          title: model.content,
          source: model.url,
          publish_time: DateTime.now(),
        );
      }

      webpage_listener = AppWebviewListener(
        on_webview_loaded: (_, url) async {
          await c0_.data_repository.webpage.update_reading_update_time(url);
        },
        on_view_scroll_changed: (_, url, scroll_top, total_height) async {
          /// 更新阅读进度
          await c0_.bis_mgr_hot_search.save_reading_progress(reading_record_id, url, scroll_top, total_height);
        },
        on_webview_closed: (url) async {
          /// 更新页面的阅读进度展示
          var new_reading_record = await await c0_.data_repository.webpage.get_reading_record_by_id(reading_record_id);
          state.replace_webpage_reading_history([new_reading_record!]);
          update([k_hot_search_scroll_view_view_id]);
        },
      );
    }

    await show_webview_dialog(
      url: model.url,
      title: '正在浏览：(${state.app})${model.content}',
      not_navigation_action_scheme: c_not_navigation_action_scheme,
      not_navigation_action_keywords: c_not_navigation_action_keyword,
      listener: webpage_listener,
    );
  }

  /// 获取最后阅读的URL
  String? get_last_read_url() {
    var history = state.webpage_reading_history.webpages;
    history.sort((a, b) => b.update_time.compareTo(a.update_time));
    if (history.isEmpty) {
      return null;
    }
    return history.last.url;
  }

  /// 切换收藏组，展示收藏组中的APP列表
  Future<void> switch_favorite_group_noui(int group_id) async {
    List<HotSearchApp> apps = state.favorite_apps_by_group_id(group_id);
    state.app = '';
    state.apps = apps.map((e) => e.name).toList();
    state.group_id = group_id;
  }

  /// 获取指定路径下的内容列表，包含子文件夹和文件
  Future<void> fetch_next_dir_list_noUi(
    String dir_path, {
    String? app_name,
  }) async {
    state.history_directory_list = [];
    List<GithubContent> contents = (await c0_.mgr_github.list_contents(state.repo, dir_path))
        // 过滤掉非md文件
        .where((e) {
      if (e.type.is_file) {
        return e.path.endsWith('.md');
      } else {
        return true;
      }
    }).toList();

    state.m_current_dir_path = dir_path;
    state.m_current_file_path = '';
    if (app_name != null) {
      state.app = app_name;
      state.picked_date = null;
    }

    /// 更新获取到的文件夹内的内容
    state.history_directory_list = contents;

    /// 清空热搜列表
    state.hot_search_list = [];
  }

  /// 展示APP指定文件的热搜列表
  Future<void> fetch_app_hot_search_list_noUi(String file_path) async {
    if (file_path.isEmpty) {
      state.hot_search_list = [];
      return;
    }

    String content = '';
    state.m_current_file_path = file_path;
    try {
      content = await c0_.mgr_github.get_decoded_content(
        state.repo,
        file_path,
      );
    } catch (ex) {
      state.m_current_file_path = '';
      rethrow;
    }

    List<HotSearchModel> hot_search_model_list = c0_.bis_mgr_hot_search.match_hot_search_models(content);
    state.hot_search_list = hot_search_model_list;

    var all_reading_records = await c0_.data_repository.webpage.list_all_reading_records();
    state.replace_webpage_reading_history(all_reading_records);
  }

  /// 刷新指定APP的热搜文件bitmap
  /// 1.年份>=2024，使用yyyy/mm/yyyy-mm-dd.md格式的归档路径
  /// 2.年份>=2023 & 月份>=11月，使用yyyy/mm/yyyy-mm-dd.md格式的归档路径
  /// 3.年份>=2023 & 月份<8月，提示无归档数据
  /// 4.年份>=2023 & 月份<11月，使用yyyy/mm归档路径，仅跳转月份归档
  /// 5.年份 < 2023，提示无归档数据
  void refresh_available_hot_search_records_bitmap(String app, int year, int month) {
    q0_.run.run(() async {
      if (year < 2023) {
        return;
      }

      if (year == 2023 && month < 11) {
        return;
      }

      var archive_file_identifier = ArchiveDateIdentifier(year, month, app);
      var pfs_key = archive_file_identifier.format_apps_available_history_records_key(state.repo.repo);

      var records_bitmap = q0_.bridge.flustars.preferences.getString(pfs_key, default_value: null);

      var now = DateTime.now();

      /// 本地没有存储X年X月的bitmap记录，或指定时间是当月的，需要重新获取
      if (records_bitmap == null || (now.year == year && now.month == month)) {
        /// 接口获取热搜记录文件列表
        try {
          var folder_path =
              '${HotSearchMgr.root_dir}/${archive_file_identifier.app}/${archive_file_identifier.year}/${archive_file_identifier.format_history_records_month()}';
          List<GithubContent> contents = await c0_.mgr_github.list_contents(state.repo, folder_path);

          var record_names = contents.map((e) => e.name).toList();

          /// 首次获取，初始化bitmap
          int max_index = 32;
          records_bitmap = c_bitmap_hot_search_not_exist_value * max_index;
          var record_bitmap_list = records_bitmap.split('');
          for (int i = 1; i < max_index; i++) {
            var exist = record_names
                .firstWhereOrNull((name) => name.startsWith(archive_file_identifier.format_history_records_key(i)));
            if (exist != null) {
              record_bitmap_list[i] = c_bitmap_hot_search_exist_value;
            }
          }
          records_bitmap = record_bitmap_list.join();
          q0_.bridge.flustars.preferences.putString(pfs_key, records_bitmap);
          calendar_key.currentState?.safeSetState(() {});
        } catch (ex) {
          // 忽略异常
        }
      }
    });
  }

  /// 获取指定APP的热搜文件某天是否存在热搜
  bool is_available_hot_search_records(String app, int year, int month, int day) {
    var archive_file_identifier = ArchiveDateIdentifier(year, month, app);
    var pfs_key = archive_file_identifier.format_apps_available_history_records_key(state.repo.repo);
    var records_bitmap = q0_.bridge.flustars.preferences.getString(pfs_key, default_value: null);
    if (records_bitmap == null) {
      return false;
    }
    var record_bitmap_list = records_bitmap.split('');
    return record_bitmap_list[day] == c_bitmap_hot_search_exist_value;
  }

  /// 是否是新Github仓库 - GithubRepo.riibit
  bool get is_new_github_repo => GithubRepo.riibit == state.repo;

  /// 获取当前打开的文件路径在目录中的索引
  int get_current_file_index_in_history_dir_list() {
    var index = state.history_directory_list.indexWhere((e) => e.path == state.m_current_file_path);
    return index;
  }
}
