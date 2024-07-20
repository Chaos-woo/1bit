import 'package:cw2bit/domain/tool/github_1bit/issues/components/github_issues/models/github_models.dart';
import 'package:qkit/qkit.dart';

class Github1bitIssuesDetailState extends PagingState<CommentModel> {
  late IssuesModel issuesModel;

  Github1bitIssuesDetailState() {
    ///Initialize variables
  }

  @override
  int get pageSize => 30;
}
