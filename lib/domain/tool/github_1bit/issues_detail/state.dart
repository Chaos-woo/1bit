import 'package:cw2bit/domain/tool/github_1bit/issues/components/github_issues/models/comment/comment_model.dart';
import 'package:cw2bit/domain/tool/github_1bit/issues/components/github_issues/models/issues/issues_model.dart';
import 'package:qkit/qkit.dart';

class Github1bitIssuesDetailState extends PagingState<CommentModel> {
  late IssuesModel issues_model;

  Github1bitIssuesDetailState() {
    ///Initialize variables
  }

  @override
  int get pageSize => 30;
}
