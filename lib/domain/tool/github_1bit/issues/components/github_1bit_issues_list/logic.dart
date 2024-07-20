import 'package:cw2bit/domain/tool/github_1bit/issues/logic.dart';
import 'package:cw2bit/domain/tool/github_1bit/issues/state.dart';
import 'package:cw2bit/infrastructure/api/apis.dart';
import 'package:cw2bit/infrastructure/api/github/models/github_do.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

import '../github_issues/models/github_models.dart';
import 'state.dart';

class Github1bitIssuesListLogic extends PagingController<Github1bitIssuesListState> {
  final Github1bitIssuesListState state = Github1bitIssuesListState();

  @override
  Github1bitIssuesListState createPagingState() {
    return state;
  }

  @override
  Future<List<IssuesModel>> fetchData() async {
    final homeState = Get.find<Github1bitIssuesLogic>().state;

    List<Issues> issues = await Apis.github.listIssues(
      homeState.owner,
      homeState.repo,
      page: state.currPage,
      pageSize: state.pageSize,
      state: IssuesFiltered.labelBy(homeState.choiceChipsStateValue),
      sortField: IssuesFiltered.labelBy(homeState.choiceChipsSortFieldsValue),
      sortDirection: IssuesFiltered.labelBy(homeState.choiceChipsSortDirectionValue),
      labels: homeState.choiceChipsLabelValue ?? [],
    );
    List<IssuesModel> issuesModelList =
        issues.map((e) => IssuesModel.fromJson(e.toJson())).toList();
    return issuesModelList;
  }
}
