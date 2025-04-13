import 'package:cw2bit/modules/feature_explore/github_1bit/issues/components/github_issues/models/issues/issues_model.dart';
import 'package:cw2bit/modules/feature_explore/github_1bit/issues/logic.dart';
import 'package:cw2bit/modules/feature_explore/github_1bit/issues/state.dart';
import 'package:cw2bit/infrastructure/api/github/models/issues/github_issues.dart';
import 'package:cw2bit/infrastructure/c0_.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

import 'state.dart';

class Github1bitIssuesListLogic extends PagingController<Github1bitIssuesListState> {
  final Github1bitIssuesListState state = Github1bitIssuesListState();

  OnRefreshedListener? on_refreshed_listener;

  @override
  Github1bitIssuesListState create_paging_state() {
    return state;
  }

  @override
  Future<List<IssuesModel>> fetch_data() async {
    final issues_state = Get.find<Github1bitIssuesLogic>().state;

    List<GithubIssues> issues = await c0_.api_github.list_issues(
      issues_state.owner,
      issues_state.repo,
      page: state.page,
      count: state.page_size,
      state: IssuesFiltered.label_of(issues_state.choice_chips_state_value),
      sort_field: IssuesFiltered.label_of(issues_state.choice_chips_sortable_fields_value),
      sort_direction: IssuesFiltered.label_of(issues_state.choice_chips_sort_direction_value),
      labels: issues_state.choice_chips_label_value ?? [],
    );
    List<IssuesModel> issues_list = issues.map((e) => IssuesModel.fromJson(e.toJson())).toList();
    return issues_list;
  }

  @override
  Future<void> on_refresh_listener(bool is_refresh_fetch, bool is_fetch_success) async {
    await on_refreshed_listener?.call(is_refresh_fetch, is_fetch_success);
  }
}
