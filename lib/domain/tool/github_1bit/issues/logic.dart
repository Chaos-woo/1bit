import 'package:cw2bit/domain/tool/github_1bit/issues/components/github_1bit_issues_list/logic.dart';
import 'package:cw2bit/infrastructure/api/apis.dart';
import 'package:cw2bit/infrastructure/api/github/models/issues/github_label.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'state.dart';
import 'view.dart';

class Github1bitIssuesLogic extends GetxController {
  final Github1bitIssuesState state = Github1bitIssuesState();

  late GlobalKey<IssuesFilteredDrawerWidgetState> drawer_key;

  final String k_selected_choice_row_view_id = '__k_selected_choice_row_view_id__';
  final String k_issues_list_view_id = '__k_issues_list_view_id__';

  /// 过滤器页面临时保存选项
  String? choice_chips_state_value;
  List<String>? choice_chips_label_value;
  String? choice_chips_sortable_fields_value;
  String? choice_chips_sort_direction_value;

  /// 标记请求刷新issues列表
  bool _m_mark_refresh_list = false;

  @override
  void onReady() async {
    Get.find<Github1bitIssuesListLogic>().on_refreshed_listener = (bool is_refresh_fetch, bool is_fetch_success) async {
      if (is_fetch_success) {
        /// 更新issues列表总数
        state.m_total_issues_count.value = Get.find<Github1bitIssuesListLogic>().state.data_list.length;
      }
    };

    List<GithubLabel> labels = await Apis.github.list_labels(state.owner, state.repo);
    state.set_repo_labels(labels);

    drawer_key.currentState?.refresh_state();
  }

  /// 刷新issues列表
  /// 1. drawer关闭并且设置需要刷新列表时请求接口
  /// 2. 提交新的issues也需要刷新接口
  void refresh_issues_list_by_new_filtered({bool is_drawer_opened = true}) async {
    if (is_drawer_opened || !_m_mark_refresh_list) {
      return;
    }

    Get.find<Github1bitIssuesListLogic>().request_refresh();
    _m_mark_refresh_list = false;
  }

  /// 标记需要刷新issues列表
  void mark_refresh_list() {
    _m_mark_refresh_list = true;
  }

  /// 获取当前已选中的所有选项
  List<String> get_all_selected_choices() {
    List<String?> choices = [
      state.choice_chips_state_value,
      ...(state.choice_chips_label_value ?? []),
      state.choice_chips_sortable_fields_value,
      state.choice_chips_sort_direction_value,
    ];

    List<String> selected_choices = [];
    for (var value in choices) {
      if (value != null) {
        selected_choices.add(value);
      }
    }

    return selected_choices.isEmpty ? ['未选择过滤器，使用默认规则'] : selected_choices;
  }

  /// 更新界面中展示的已选择过滤器
  void update_selected_choice() {
    state.choice_chips_state_value = choice_chips_state_value;
    state.choice_chips_label_value = choice_chips_label_value;
    state.choice_chips_sortable_fields_value = choice_chips_sortable_fields_value;
    state.choice_chips_sort_direction_value = choice_chips_sort_direction_value;

    update([k_selected_choice_row_view_id]);
    _m_mark_refresh_list = true;
    refresh_issues_list_by_new_filtered(is_drawer_opened: false);
  }

  /// 清除所有已选择的过滤器
  void clear_all_filtered_choice() {
    choice_chips_state_value = null;
    choice_chips_label_value = null;
    choice_chips_sortable_fields_value = null;
    choice_chips_sort_direction_value = null;

    /// 更新已选择的过滤器展示
    update_selected_choice();
  }
}
