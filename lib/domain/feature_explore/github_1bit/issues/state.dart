import 'package:cw2bit/domain/feature_explore/github_1bit/issues/components/github_issues/models/issues/label_model.dart';
import 'package:cw2bit/domain/feature_explore/github_1bit/values/constant.dart';
import 'package:cw2bit/infrastructure/api/github/models/issues/github_label.dart';
import 'package:get/get.dart';

class Github1bitIssuesState {
  final String owner = c_1bit_repo_owner;
  final String repo = c_1bit_repo;

  List<IssuesFiltered> issues_state_values = [
    IssuesFiltered.state_open,
    IssuesFiltered.state_closed,
    IssuesFiltered.state_all
  ];
  List<IssuesFiltered> sortable_fields_values = [
    IssuesFiltered.sort_created,
    IssuesFiltered.sort_updated,
    IssuesFiltered.sort_comments
  ];
  List<IssuesFiltered> sort_direction_values = [IssuesFiltered.direction_desc, IssuesFiltered.direction_asc];

  List<LabelModel> label_values = [];

  /// 过滤器选项
  String? choice_chips_state_value;
  List<String>? choice_chips_label_value;
  String? choice_chips_sortable_fields_value;
  String? choice_chips_sort_direction_value;

  List<String> get choice_chip_state_init_val => choice_chips_state_value != null ? [choice_chips_state_value!] : [];

  List<String> get choice_chip_label_init_val => choice_chips_label_value != null ? choice_chips_label_value! : [];

  List<String> get choice_chip_sortable_fields_init_val =>
      choice_chips_sortable_fields_value != null ? [choice_chips_sortable_fields_value!] : [];

  List<String> get choice_chip_sort_direction_init_val =>
      choice_chips_sort_direction_value != null ? [choice_chips_sort_direction_value!] : [];

  void set_repo_labels(List<GithubLabel> labels) {
    label_values = labels.map((e) => LabelModel.fromJson(e.toJson())).toList();
  }

  /// 问题总数
  var m_total_issues_count = 0.obs;

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

  static IssuesFiltered? label_of(String? value) {
    return IssuesFiltered.values.where((element) => element.label == value).firstOrNull;
  }
}
