import 'dart:math';

import 'package:cw2bit/modules/app_hot_search/models/hot_search_model.dart';
import 'package:cw2bit/modules/app_hot_search/service/hot_search_config_mgr.dart';
import 'package:cw2bit/modules/app_hot_search/values/constant.dart';
import 'package:cw2bit/modules/github/models/github_repo.dart';
import 'package:cw2bit/infrastructure/c0_.dart';
import 'package:cw2bit/public/ui/ui0_.dart';
import 'package:cw2bit/public/webview/app_webview_dialog.dart';
import 'package:cw2bit/public/webview/app_webview_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

import 'state.dart';

class AppReadingThresholdConfigLogic extends GetxController {
  final AppReadingThresholdConfigState state = AppReadingThresholdConfigState();

  final k_threshold_config_list_view_id = '__k_threshold_config_list_view_id__';

  @override
  void onReady() async {
    super.onReady();

    await refresh_threshold_configs();
  }

  /// 刷新热搜阅读进度阈值配置
  Future<void> refresh_threshold_configs() async {
    var cloud_apps = InAdvanceAppThreshold.values.map((e) => e.app).toList();
    var threshold_configs =
        await c0_.bis_mgr_hot_search_config.batch_get_hot_search_read_progress_threshold_config(cloud_apps);
    state.threshold_configs = [];
    for (var threshold in threshold_configs.values) {
      var should_show_config = await should_show_reading_progress_config(threshold.app);
      var in_advance_threshold = InAdvanceAppThreshold.from(threshold.app);
      var new_threshold = !threshold.is_default
          ? threshold
          : ReadingProgressThreshold(
              threshold.app,
              in_advance_threshold.as_double,
              threshold.is_default,
            );
      state.threshold_configs.add(AppReadingThresholdConfig(
        threshold: new_threshold,
        should_show_config: should_show_config,
        in_advance_threshold: in_advance_threshold.in_advance_threshold,
      ));
    }

    update([k_threshold_config_list_view_id]);
  }

  /// 判断指定APP是否需要展示阅读进度配置
  Future<bool> should_show_reading_progress_config(String app) async {
    return await c0_.bis_mgr_hot_search_config.is_in_store_reading_record_white_apps(app);
  }

  /// 设置指定APP的阅读进度阈值
  Future<void> set_read_progress_threshold(int threshold, String app) async {
    await c0_.bis_mgr_hot_search_config.set_hot_search_read_progress_threshold_config(threshold / 100.0, app: app);

    await refresh_threshold_configs();
  }

  /// 重置指定APP的阅读进度阈值
  Future<void> reset_reading_progress_threshold(String app) async {
    var in_advance_threshold = InAdvanceAppThreshold.from(app);
    await c0_.bis_mgr_hot_search_config.set_hot_search_read_progress_threshold_config(
      in_advance_threshold.as_double,
      app: app,
    );

    await refresh_threshold_configs();
  }

  /// 设置指定APP的自动记录开关
  Future<void> operate_app_reading_record_auto_recording(String app, {required bool open}) async {
    if (open) {
      await c0_.bis_mgr_hot_search_config.add_reading_record_config(app);
    } else {
      await c0_.bis_mgr_hot_search_config.remove_reading_record_config(app);
    }

    await refresh_threshold_configs();
  }

  /// 测试指定APP的阅读进度阈值
  Future<void> test_user_reading_progress_threshold(String app) async {
    String content = '';
    try {
      content = await c0_.mgr_github.get_decoded_content(
        GithubRepo.riibit,
        c0_.bis_mgr_hot_search.right_realtime_hot_search_path(app, DateTime.now().subtract(1.days)),
      );
    } catch (ex) {
      rethrow;
    }

    HotSearchModel random_hot_search = c0_.bis_mgr_hot_search.match_hot_search_models(content).first;
    double temp_threshold_double = 0.0;
    await show_webview_dialog(
      url: random_hot_search.url,
      title: '浏览至自定义位置，点击完成，将会自动计算完成阈值',
      not_navigation_action_scheme: c_not_navigation_action_scheme,
      bottom_buttons: [
        WebviewTextButtonDefinition(
          Icons.check_circle_rounded,
          icon_color: Colors.white,
          fill_color: Colors.green,
          border_color: Colors.green,
          on_tap: () async {
            /// 保存阅读完成阈值
            var threshold_int = (temp_threshold_double * 100).ceil();
            await ui0_.dialog.show_single_input_dialog(
                title: '阈值确认',
                subtitle: '请确认阅读完成阈值为${threshold_int}%，或进一步调整阈值',
                initial_value: threshold_int.toString(),
                on_cancel: () {},
                max_length: -1,
                on_confirm: (value) async {
                  var threshold = int.tryParse(value);
                  if (threshold == null || threshold < 0 || threshold > 100) {
                    q0_.ui.toast.show('请输入有效的阅读完成阈值，范围为0~100');
                  } else {
                    await set_read_progress_threshold(threshold, app);
                  }
                });
            await refresh_threshold_configs();

            q0_.route.back();
          },
        ),
      ],
      listener: AppWebviewListener(
        on_view_scroll_changed: (_, __, scroll_top, total_height) async {
          /// 更新阅读进度
          temp_threshold_double = min(scroll_top / total_height, 100.0);
        },
      ),
    );
  }
}
