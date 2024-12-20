import 'dart:math';

import 'package:cw2bit/domain/app_hot_search/values/constant.dart';
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

  int get initial_tab_index => q0_.route.path_variables(path_k_initial_tab_index) == null
      ? 0
      : (int.parse(q0_.route.path_variables(path_k_initial_tab_index)!) > max_tab_index ||
              int.parse(q0_.route.path_variables(path_k_initial_tab_index)!) < 0)
          ? 0
          : int.parse(q0_.route.path_variables(path_k_initial_tab_index)!);

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
    await refresh_reading_records_noUi();
    safe_update_hot_search_view();
  }

  /// 刷新查询所有的webpage阅读记录
  Future<void> refresh_reading_records_noUi() async {
    var all_reading_records = await c0_.local_data_repo.webpage.list_all_reading_records_with_stickers();
    print('all_reading_records: $all_reading_records');

    state.all_webpages = all_reading_records;

    /// 根据阅读进度分组
    var reading_progress_threshold =
        await c0_.bis_mgr_hot_search_config.get_hot_search_read_progress_threshold_config();
    state.in_reading_webpages =
        all_reading_records.where((e) => e.webpage_reading.reading_progress < reading_progress_threshold).toList();
    state.archived_webpages =
        all_reading_records.where((e) => e.webpage_reading.reading_progress >= reading_progress_threshold).toList();
    state.favorite_webpages = all_reading_records.where((e) => e.webpage_reading.is_collected).toList();
  }

  /// 格式化URL阅读进度
  (int be_read, int remaining) format_app_progress_ratio(WebpageReading webpage_reading) {
    return c0_.bis_mgr_hot_search.calculate_web_reading_progress_ratio(webpage_reading);
  }

  /// 使用webview打开热搜内容
  Future<void> open_hot_search_webview(WebpageReading webpage_reading) async {
    /// 处理当前阅读进度
    var reading_record = await c0_.local_data_repo.webpage.get_reading_record(webpage_reading.url);
    int reading_record_id = reading_record?.id ?? -1;
    if (reading_record == null) {
      reading_record_id = await c0_.local_data_repo.webpage.add_reading_record(
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
      listener: AppWebviewReadingListener(
        onWebviewLoaded: (webviewController, url) async {
          await c0_.local_data_repo.webpage.update_reading_update_time(url);
        },
        onViewScrollChanged: (webviewController, url, scrollTop, totalHeight) async {
          /// 更新阅读进度
          double progress = (scrollTop / totalHeight).clamp(0.0, 1.0);
          var stored_reading_record = await c0_.local_data_repo.webpage.get_reading_record(webpage_reading.url);
          if (scrollTop > stored_reading_record!.reading_scroll_top) {
            await c0_.local_data_repo.webpage.update_reading_progress(reading_record_id, progress, scrollTop);
          }
        },
        onWebviewClosed: (url) async {
          /// 更新页面的阅读进度
          await refresh_reading_records_noUi();
          safe_update_hot_search_view();
        },
      ),
    );
  }

  /// 收藏或取消收藏热搜内容
  Future<void> add_or_remove_favorite(WebpageReading webpage_reading) async {
    await c0_.local_data_repo.webpage.update_reading_is_collected(webpage_reading.id!, !webpage_reading.is_collected);
    await refresh_reading_records_noUi();
    safe_update_hot_search_view();
  }

  void safe_update_hot_search_view() {
    glob_k_hot_search_in_reading.currentState?.safeSetState(() {});
    glob_k_hot_search_archive.currentState?.safeSetState(() {});
    glob_k_hot_search_favorite.currentState?.safeSetState(() {});
  }
}
