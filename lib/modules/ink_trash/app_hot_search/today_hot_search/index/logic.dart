import 'dart:async';

import 'package:cw2bit/modules/app_hot_search/models/hot_search_model.dart';
import 'package:cw2bit/modules/app_hot_search/models/wrappers/app_groups.dart';
import 'package:cw2bit/modules/app_hot_search/today_hot_search/index/state.dart';
import 'package:cw2bit/modules/app_hot_search/values/constant.dart';
import 'package:cw2bit/modules/github/models/github_repo.dart';
import 'package:cw2bit/infrastructure/c0_.dart';
import 'package:cw2bit/infrastructure/database/entity/app_hot_search/hot_search_app.dart';
import 'package:cw2bit/infrastructure/database/entity_combination/comb_hot_search_group_apps.dart';
import 'package:cw2bit/infrastructure/ext/string_ext.dart';
import 'package:cw2bit/public/webview/app_webview_dialog.dart';
import 'package:cw2bit/public/webview/app_webview_listener.dart';
import 'package:get/get.dart';

class TodayHotSearchLogic extends GetxController {
  final TodayHotSearchState state = TodayHotSearchState();

  final k_app_scroll_view_view_id = '__k_app_scroll_view_view_id__';
  final k_group_scroll_view_view_id = '__k_group_scroll_view_view_id__';
  final k_hot_search_scroll_view_view_id = '__k_hot_search_scroll_view_view_id__';
  final k_hot_search_refresh_view_id = '__k_hot_search_refresh_view_id__';

  var hot_search_refreshing = false;

  @override
  void onReady() async {
    super.onReady();

    /// 初始化时新刷新APP组列表和APP列表
    await m_refresh_group_apps_and_hot_search_list(is_first_refresh: true);
  }

  /// 刷新APP组列表和APP列表
  Future<void> m_refresh_group_apps_and_hot_search_list({bool is_first_refresh = false}) async {
    if (state.group_id != -1) {
      var group = await c0_.bis_mgr_hot_search.find_hot_search_group(state.group_id);
      if (group == null) {
        // 当前选择的分组已经不存在时，回退到“全部”分组
        state.group_id = -1;
      } else {
        // remark: 不是“全部”分组时，进入到下面的流程继续处理分组
      }
    } else {
      // remark: 当前分组已经是“全部”分组时，进入到下面的流程继续处理分组
    }

    if (is_first_refresh) {
      // 如果是第一次刷新，查询默认分组设置
      var default_group_id = await c0_.bis_mgr_hot_search_config.get_default_app_group_config();
      if (default_group_id != -1) {
        var default_group = await c0_.bis_mgr_hot_search.find_hot_search_group(default_group_id);
        if (default_group != null) {
          state.group_id = default_group_id;
        } else {
          // 缓存设置中的默认分组已经不存在时，回退到“全部”分组
          state.group_id = -1;
        }
      } else {
        // 没有设置默认分组时，回退到“全部”分组
        state.group_id = -1;
      }
    }

    state.app = '';

    // 移除自定义的APP黑名单列表
    var remote_repo_group_apps = await c0_.bis_mgr_hot_search.fetch_comb_hot_search_groups(GithubRepo.riibit);
    var black_apps = await c0_.bis_mgr_hot_search_config.get_black_apps_config();
    var new_groups = remote_repo_group_apps.groups.map((e) {
      var new_apps = e.apps.where((app) => !black_apps.contains_case_insensitive(app.name)).toList();
      return CombHotSearchGroupApps(group: e.group, apps: new_apps);
    }).toList();
    ;

    state.favorite_app_group = LocalAppGroups.from(new_groups);

    /// 刷新UI
    switch_favorite_group_noui(state.group_id);
    update([k_app_scroll_view_view_id, k_group_scroll_view_view_id]);
  }

  /// 根据URL获取APP的热搜阅读进度比
  ReadingProgressRatio get_app_progress_ratio(String url) {
    var webpage_reading_record = state.get_webpage_reading(url);
    return c0_.bis_mgr_hot_search.calculate_web_reading_progress_ratio(webpage_reading_record);
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
    return history.first.url;
  }

  /// 切换收藏组，展示收藏组中的APP列表
  Future<void> switch_favorite_group_noui(int group_id) async {
    List<HotSearchApp> apps = state.favorite_apps_by_group_id(group_id);
    state.app = '';
    state.apps = apps.map((e) => e.name).toList();
    state.group_id = group_id;
  }

  /// 切换APP，展示APP的热搜列表
  Future<void> fetch_app_hot_search_list_noui(HotSearchApp app) async {
    state.app = app.name;
    state.apps = [];
    hot_search_refreshing = true;
    update([k_app_scroll_view_view_id, k_hot_search_scroll_view_view_id, k_hot_search_refresh_view_id]);

    Timer t = Timer(Duration(seconds: 3), () {
      hot_search_refreshing = false;
      update([k_hot_search_refresh_view_id]);
    });

    String content = '';
    try {
      content = await c0_.mgr_github.get_decoded_content(
        GithubRepo.riibit,
        c0_.bis_mgr_hot_search.right_realtime_hot_search_path(app.name, DateTime.now()),
      );
    } catch (ex) {
      rethrow;
    } finally {
      if (t.isActive) {
        t.cancel();
      }
      hot_search_refreshing = false;
      update([k_hot_search_refresh_view_id]);
    }

    List<HotSearchModel> hot_search_model_list = c0_.bis_mgr_hot_search.match_hot_search_models(content);
    state.hot_search_list = hot_search_model_list;

    var all_reading_records = await c0_.data_repository.webpage.list_all_reading_records();
    state.replace_webpage_reading_history(all_reading_records);
  }
}
