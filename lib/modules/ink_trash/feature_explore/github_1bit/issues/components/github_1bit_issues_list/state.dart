import 'package:cw2bit/modules/feature_explore/github_1bit/issues/components/github_issues/models/issues/issues_model.dart';
import 'package:qkit/qkit.dart';

class Github1bitIssuesListState extends PagingState<IssuesModel> {
  Github1bitIssuesListState() {
    ///Initialize variables
  }

  @override
  int get page_size => 30;
}
