import 'package:cw2bit/domain/tool/github_1bit/issues/components/github_issues/models/issues/issues_model.dart';
import 'package:cw2bit/domain/tool/github_1bit/issues/logic.dart';
import 'package:cw2bit/domain/tool/github_1bit/issues/state.dart';
import 'package:cw2bit/infrastructure/api/apis.dart';
import 'package:cw2bit/infrastructure/api/github/models/issues/github_issues.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

import 'state.dart';

class Github1bitIssuesListLogic extends PagingController<Github1bitIssuesListState> {
  final Github1bitIssuesListState state = Github1bitIssuesListState();

  OnRefreshedListener? on_refreshed_listener;

  @override
  Github1bitIssuesListState createPagingState() {
    return state;
  }

  @override
  Future<List<IssuesModel>> fetch_data() async {
    final homeState = Get.find<Github1bitIssuesLogic>().state;

    List<GithubIssues> issues = await Apis.github.list_issues(
      homeState.owner,
      homeState.repo,
      page: state.currPage,
      page_size: state.pageSize,
      state: IssuesFiltered.label_by(homeState.choiceChipsStateValue),
      sort_field: IssuesFiltered.label_by(homeState.choiceChipsSortFieldsValue),
      sort_direction: IssuesFiltered.label_by(homeState.choiceChipsSortDirectionValue),
      labels: homeState.choiceChipsLabelValue ?? [],
    );
    List<IssuesModel> issuesModelList = issues.map((e) => IssuesModel.fromJson(e.toJson())).toList();
    return issuesModelList;
  }

  @override
  Future<void> on_refresh_listener(bool is_refresh_fetch, bool is_fetch_success) async {
    on_refreshed_listener?.call(is_refresh_fetch, is_fetch_success);
  }
}
