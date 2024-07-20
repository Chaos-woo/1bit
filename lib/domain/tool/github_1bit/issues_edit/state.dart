import 'package:cw2bit/domain/tool/github_1bit/issues/components/github_issues/models/github_models.dart';
import 'package:cw2bit/domain/tool/github_1bit/issues/values/constant.dart';
import 'package:cw2bit/infrastructure/api/github/models/github_do.dart';

class Github1bitIssuesEditState {
  final String owner = c_1bitOwner;
  final String repo = c_1bitRepo;
  List<LabelModel> labelValues = [];

  /// 已选择标签选项
  List<String>? choiceChipsLabelValue;

  List<String> get choiceChipLabelInitVal =>
      choiceChipsLabelValue != null ? choiceChipsLabelValue! : [];

  void setRepoLabels(List<Label> labels) {
    labelValues = labels.map((e) => LabelModel.fromJson(e.toJson())).toList();
  }

  Github1bitIssuesEditState() {
    ///Initialize variables
  }
}
