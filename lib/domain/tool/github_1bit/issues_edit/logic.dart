import 'package:cw2bit/domain/tool/github_1bit/issues/values/constant.dart';
import 'package:cw2bit/domain/tool/github_1bit/issues_edit/view.dart';
import 'package:cw2bit/infrastructure/api/apis.dart';
import 'package:cw2bit/infrastructure/api/github/models/github_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'state.dart';

class Github1bitIssuesEditLogic extends GetxController {
  final Github1bitIssuesEditState state = Github1bitIssuesEditState();

  final labelChoiceKey = GlobalKey<SelectedIssuesLabelChoiceState>();

  late TextEditingController titleTextEditingController;
  late TextEditingController bodyTextEditingController;

  @override
  void onInit() {
    super.onInit();
    titleTextEditingController = TextEditingController(text: '');
    bodyTextEditingController = TextEditingController(text: '');
  }

  @override
  void onReady() async {
    List<Label> labels = await Apis.github.listLabels(state.owner, state.repo);
    state.setRepoLabels(labels);
    labelChoiceKey.currentState?.refreshState();
  }

  @override
  void onClose() {
    super.onClose();
    titleTextEditingController.dispose();
    bodyTextEditingController.dispose();
  }

  /// 更新选择的标签
  void updateSelectedLabels(List<String>? labels) {
    state.choiceChipsLabelValue = labels;
  }

  /// 使用内容模板
  void useContentTemplateByIssuesLabel(IssuesLabelTemplate template) {
    switch (template) {
      case IssuesLabelTemplate.bug:
        bodyTextEditingController.text = c_issuesBugTemplate;
        break;
      case IssuesLabelTemplate.feature:
        bodyTextEditingController.text = c_issuesFeatureTemplate;
        break;
      case IssuesLabelTemplate.enhance:
        bodyTextEditingController.text = c_issuesEnhanceTemplate;
        break;
      case IssuesLabelTemplate.question:
        bodyTextEditingController.text = c_issuesQuestionTemplate;
        break;
      default:
        break;
    }
  }

  /// 提交issues
  Future<bool> post() async {
    if (titleTextEditingController.text.isEmpty ||
        bodyTextEditingController.text.isEmpty ||
        (state.choiceChipsLabelValue == null || state.choiceChipsLabelValue!.isEmpty)) {
      return false;
    }

    await Apis.github.postIssues(
      state.owner,
      state.repo,
      titleTextEditingController.text,
      body: bodyTextEditingController.text,
      labels: state.choiceChipsLabelValue ?? [],
    );
    return true;
  }
}

enum IssuesLabelTemplate { bug, feature, enhance, question }
