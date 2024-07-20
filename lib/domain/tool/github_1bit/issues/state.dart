import 'package:cw2bit/infrastructure/api/github/models/github_do.dart';

import 'components/github_issues/models/github_models.dart';
import 'values/constant.dart';

class Github1bitIssuesState {
  final String owner = c_1bitOwner;
  final String repo = c_1bitRepo;

  List<IssuesFiltered> stateValues = [
    IssuesFiltered.state_open,
    IssuesFiltered.state_closed,
    IssuesFiltered.state_all
  ];
  List<IssuesFiltered> sortFieldsValues = [
    IssuesFiltered.sort_created,
    IssuesFiltered.sort_updated,
    IssuesFiltered.sort_comments
  ];
  List<IssuesFiltered> sortDirectionValues = [
    IssuesFiltered.direction_desc,
    IssuesFiltered.direction_asc
  ];

  List<LabelModel> labelValues = [];

  /// 过滤器选项
  String? choiceChipsStateValue;
  List<String>? choiceChipsLabelValue;
  String? choiceChipsSortFieldsValue;
  String? choiceChipsSortDirectionValue;

  List<String> get choiceChipStateInitVal =>
      choiceChipsStateValue != null ? [choiceChipsStateValue!] : [];

  List<String> get choiceChipLabelInitVal =>
      choiceChipsLabelValue != null ? choiceChipsLabelValue! : [];

  List<String> get choiceChipSortFieldsInitVal =>
      choiceChipsSortFieldsValue != null ? [choiceChipsSortFieldsValue!] : [];

  List<String> get choiceChipSortDirectionInitVal =>
      choiceChipsSortDirectionValue != null ? [choiceChipsSortDirectionValue!] : [];

  void setRepoLabels(List<Label> labels) {
    labelValues = labels.map((e) => LabelModel.fromJson(e.toJson())).toList();
  }

  Github1bitIssuesState() {}
}

enum IssuesFiltered {
  state_open('未解决', 'open'),
  state_closed('已解决', 'closed'),
  state_all('全部', 'all'),
  sort_created('创建时间', 'created'),
  sort_updated('更新时间', 'updated'),
  sort_comments('最近评论', 'comments'),
  direction_desc('倒序', 'desc'),
  direction_asc('正序', 'asc'),
  ;

  final String label;
  final String option;

  const IssuesFiltered(this.label, this.option);

  static IssuesFiltered? labelBy(String? value) {
    return IssuesFiltered.values.where((element) => element.label == value).firstOrNull;
  }
}
