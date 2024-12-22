import 'dart:async';

import 'package:cw2bit/domain/app_hot_search/models/hot_search_model.dart';
import 'package:cw2bit/domain/app_hot_search/today_hot_search/index/state.dart';
import 'package:cw2bit/domain/app_hot_search/values/constant.dart';
import 'package:cw2bit/domain/github/models/github_repo.dart';
import 'package:cw2bit/infrastructure/c0_.dart';
import 'package:cw2bit/infrastructure/database/entity/app_hot_search/hot_search_app.dart';
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

    await m_refresh_group_apps_and_hot_search_list();
  }

  Future<void> m_refresh_group_apps_and_hot_search_list() async {
    state.app = '';
    state.group_id = -1;
    state.favorite_app_group = await c0_.bis_mgr_hot_search.fetch_comb_hot_search_groups(GithubRepo.riibit);

    /// 刷新UI
    switch_favorite_group_noUi(state.group_id);
    update([k_app_scroll_view_view_id, k_group_scroll_view_view_id]);
  }

  /// 根据URL获取APP的热搜阅读进度比
  (int be_read, int remaining) get_app_progress_ratio(String url) {
    var reading = state.get_webpage_reading(url);
    return c0_.bis_mgr_hot_search.calculate_web_reading_progress_ratio(reading);
  }

  /// 使用webview打开热搜内容
  Future<void> open_hot_search_webview(HotSearchModel model) async {
    /// 处理当前阅读进度
    var reading_record = await c0_.local_data_repo.webpage.get_reading_record(model.url);
    int reading_record_id = reading_record?.id ?? -1;
    if (reading_record == null) {
      reading_record_id = await c0_.local_data_repo.webpage.add_reading_record(
        model.url,
        app: state.app,
        author: state.app,
        title: model.content,
        source: model.url,
        publish_time: DateTime.now(),
      );
    }

    await show_webview_dialog(
      url: model.url,
      title: '正在浏览：(${state.app})${model.content}',
      not_navigation_action_scheme: c_not_navigation_action_scheme,
      not_navigation_action_keywords: c_not_navigation_action_keyword,
      listener: AppWebviewReadingListener(
        onWebviewLoaded: (webviewController, url) async {
          await c0_.local_data_repo.webpage.update_reading_update_time(url);
        },
        onViewScrollChanged: (webviewController, url, scrollTop, totalHeight) async {
          /// 更新阅读进度
          double progress = (scrollTop / totalHeight).clamp(0.0, 1.0);
          var stored_reading_record = await c0_.local_data_repo.webpage.get_reading_record(model.url);
          if (scrollTop > stored_reading_record!.reading_scroll_top) {
            await c0_.local_data_repo.webpage.update_reading_progress(reading_record_id, progress, scrollTop);
          }
        },
        onWebviewClosed: (url) async {
          /// 更新页面的阅读进度
          var new_reading_record = await await c0_.local_data_repo.webpage.get_reading_record_by_id(reading_record_id);
          state.replace_webpage_reading_history([new_reading_record!]);
          update([k_hot_search_scroll_view_view_id]);
        },
      ),
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
  Future<void> switch_favorite_group_noUi(int group_id) async {
    List<HotSearchApp> apps = state.favorite_apps_by_group_id(group_id);
    state.app = '';
    state.apps = apps.map((e) => e.name).toList();
    state.group_id = group_id;
  }

  /// 切换APP，展示APP的热搜列表
  Future<void> fetch_app_hot_search_list_noUi(HotSearchApp app) async {
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

    var all_reading_records = await c0_.local_data_repo.webpage.list_all_reading_records();
    state.replace_webpage_reading_history(all_reading_records);
  }
}
