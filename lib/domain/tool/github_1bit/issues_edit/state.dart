import 'package:cw2bit/domain/tool/github_1bit/issues/components/github_issues/models/issues/label_model.dart';
import 'package:cw2bit/domain/tool/github_1bit/values/constant.dart';
import 'package:cw2bit/infrastructure/api/github/models/issues/github_label.dart';

class Github1bitIssuesEditState {
  final String owner = c_1bit_repo_owner;
  final String repo = c_1bit_repo;
  List<LabelModel> labelValues = [];

  /// 已选择标签选项
  List<String>? choiceChipsLabelValue;

  List<String> get choiceChipLabelInitVal =>
      choiceChipsLabelValue != null ? choiceChipsLabelValue! : [];

  void setRepoLabels(List<GithubLabel> labels) {
    labelValues = labels.map((e) => LabelModel.fromJson(e.toJson())).toList();
  }

  Github1bitIssuesEditState() {
    ///Initialize variables
  }
}
