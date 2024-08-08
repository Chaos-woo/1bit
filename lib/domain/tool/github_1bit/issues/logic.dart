import 'package:cw2bit/domain/tool/github_1bit/issues/components/github_1bit_issues_list/logic.dart';
import 'package:cw2bit/infrastructure/api/apis.dart';
import 'package:cw2bit/infrastructure/api/github/models/issues/github_label.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'state.dart';
import 'view.dart';

class Github1bitIssuesLogic extends GetxController {
  final Github1bitIssuesState state = Github1bitIssuesState();

  late GlobalKey<IssuesFilteredDrawerWidgetState> drawerKey;

  final String k_selectedChoiceRowViewId = '#issuesSelectedChoiceRowWidget';
  final String k_issuesListViewId = '#issuesListWidget';

  /// 过滤器页面临时保存选项
  String? choiceChipsStateValue;
  List<String>? choiceChipsLabelValue;
  String? choiceChipsSortFieldsValue;
  String? choiceChipsSortDirectionValue;

  /// 标记请求刷新issues列表
  bool _m_mark_refresh_list = false;

  @override
  void onReady() async {
    List<GithubLabel> labels = await Apis.github.listLabels(state.owner, state.repo);
    state.setRepoLabels(labels);

    drawerKey.currentState?.refresh_state();
  }

  /// 刷新issues列表
  /// 1. drawer关闭并且设置需要刷新列表时请求接口
  /// 2. 提交新的issues也需要刷新接口
  void refreshIssuesListByNewFiltered({bool isDrawerOpened = true}) async {
    if (isDrawerOpened || !_m_mark_refresh_list) {
      return;
    }

    Get.find<Github1bitIssuesListLogic>().request_refresh();
    _m_mark_refresh_list = false;
  }

  void mark_refresh_list() {
    _m_mark_refresh_list = true;
  }

  /// 获取当前已选中的所有选项
  List<String> getAllSelectedChoice() {
    List<String?> choices = [
      state.choiceChipsStateValue,
      ...(state.choiceChipsLabelValue ?? []),
      state.choiceChipsSortFieldsValue,
      state.choiceChipsSortDirectionValue,
    ];

    List<String> selectedChoices = [];
    for (var value in choices) {
      if (value != null) {
        selectedChoices.add(value);
      }
    }

    return selectedChoices.isEmpty ? ['未选择过滤器，使用默认规则'] : selectedChoices;
  }

  /// 更新界面中展示的已选择过滤器
  void updateSelectedChoice() {
    state.choiceChipsStateValue = choiceChipsStateValue;
    state.choiceChipsLabelValue = choiceChipsLabelValue;
    state.choiceChipsSortFieldsValue = choiceChipsSortFieldsValue;
    state.choiceChipsSortDirectionValue = choiceChipsSortDirectionValue;

    update([k_selectedChoiceRowViewId]);
    _m_mark_refresh_list = true;
    refreshIssuesListByNewFiltered(isDrawerOpened: false);
  }

  /// 清除所有已选择的过滤器
  void clearAllFilteredChoice() {
    choiceChipsStateValue = null;
    choiceChipsLabelValue = null;
    choiceChipsSortFieldsValue = null;
    choiceChipsSortDirectionValue = null;

    /// 更新已选择的过滤器展示
    updateSelectedChoice();
  }
}
