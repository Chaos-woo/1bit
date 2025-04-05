import 'package:cw2bit/modules/app_hot_search/values/constant.dart';
import 'package:cw2bit/infrastructure/c0_.dart';
import 'package:cw2bit/infrastructure/database/entity/webpage/webpage_reading.dart';
import 'package:cw2bit/public/webview/app_webview_dialog.dart';
import 'package:cw2bit/public/webview/app_webview_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

import 'state.dart';

final class _PathVariables {
  int get max_tab_index => 3;

  int get initial_tab_index => q0_.route.pathVariables(path_k_initial_tab_index) == null
      ? 0
      : (int.parse(q0_.route.pathVariables(path_k_initial_tab_index)!) > max_tab_index ||
              int.parse(q0_.route.pathVariables(path_k_initial_tab_index)!) < 0)
          ? 0
          : int.parse(q0_.route.pathVariables(path_k_initial_tab_index)!);

  String get path_k_initial_tab_index => '__path_variables_initial_tab_index__';
}

class ReadingRecordLogic extends GetxController {
  static final _PathVariables m_path_variables = _PathVariables();

  static ReadingRecordLogic get getx => Get.find<ReadingRecordLogic>();

  final ReadingRecordState state = ReadingRecordState();

  final glob_k_hot_search_in_reading = GlobalKey();
  final glob_k_hot_search_archive = GlobalKey();
  final glob_k_hot_search_favorite = GlobalKey();

  TabController? tabbar_controller;

  int get tab_current_index => tabbar_controller != null ? tabbar_controller!.index : 0;

  @override
  void onInit() async {
    super.onInit();
    await refresh_reading_records();
  }

  Future<void> refresh_reading_records() async {
    await refresh_reading_records_noui();
    safe_update_hot_search_view();
  }

  /// 刷新查询所有的webpage阅读记录
  Future<void> refresh_reading_records_noui() async {
    var all_reading_records = await c0_.data_repository.webpage.list_all_reading_records_with_stickers();
    print('all_reading_records: $all_reading_records');

    state.all_webpages = all_reading_records;

    /// 排序
    /// 根据阅读进度分组
    state.in_reading_webpages = all_reading_records.where((e) {
      var threshold = c0_.bis_mgr_hot_search_config.get_app_archive_threshold_cache(e.webpage_reading.app);
      return e.webpage_reading.reading_progress < threshold.as_double;
    }).toList();
    state.archived_webpages = all_reading_records.where((e) {
      var threshold = c0_.bis_mgr_hot_search_config.get_app_archive_threshold_cache(e.webpage_reading.app);
      return e.webpage_reading.reading_progress >= threshold.as_double;
    }).toList();
    state.favorite_webpages = all_reading_records.where((e) => e.webpage_reading.is_collected).toList();
  }

  /// 格式化URL阅读进度
  ReadingProgressRatio format_app_progress_ratio(WebpageReading webpage_reading) {
    return c0_.bis_mgr_hot_search.calculate_web_reading_progress_ratio(webpage_reading);
  }

  /// 使用webview打开热搜内容
  Future<void> open_hot_search_webview(WebpageReading webpage_reading) async {
    /// 处理当前阅读进度
    var reading_record = await c0_.data_repository.webpage.get_reading_record(webpage_reading.url);
    int reading_record_id = reading_record?.id ?? -1;
    if (reading_record == null) {
      reading_record_id = await c0_.data_repository.webpage.add_reading_record(
        webpage_reading.url,
        app: webpage_reading.app,
        author: webpage_reading.author ?? webpage_reading.app,
        title: webpage_reading.title,
        source: webpage_reading.source,
        publish_time: webpage_reading.publish_time ?? DateTime.now(),
      );
    }

    await show_webview_dialog(
      url: webpage_reading.url,
      title: '正在浏览：(${webpage_reading.author ?? webpage_reading.app})${webpage_reading.title}',
      not_navigation_action_scheme: c_not_navigation_action_scheme,
      listener: AppWebviewListener(
        on_webview_loaded: (_, url) async {
          await c0_.data_repository.webpage.update_reading_update_time(url);
        },
        on_view_scroll_changed: (_, url, scroll_top, total_height) async {
          /// 更新阅读进度
          await c0_.bis_mgr_hot_search.save_reading_progress(reading_record_id, url, scroll_top, total_height);
        },
        on_webview_closed: (url) async {
          /// 更新页面的阅读进度
          await refresh_reading_records_noui();
          safe_update_hot_search_view();
        },
      ),
    );
  }

  /// 收藏或取消收藏热搜内容
  Future<void> add_or_remove_favorite(WebpageReading webpage_reading) async {
    await c0_.data_repository.webpage.update_reading_is_collected(webpage_reading.id!, !webpage_reading.is_collected);
    await refresh_reading_records_noui();
    safe_update_hot_search_view();
  }

  void safe_update_hot_search_view() {
    glob_k_hot_search_in_reading.currentState?.safeSetState(() {});
    glob_k_hot_search_archive.currentState?.safeSetState(() {});
    glob_k_hot_search_favorite.currentState?.safeSetState(() {});
  }
}
