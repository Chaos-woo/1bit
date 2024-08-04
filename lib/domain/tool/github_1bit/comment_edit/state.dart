import 'package:cw2bit/domain/tool/github_1bit/issues/components/github_issues/models/issues/issues_model.dart';
import 'package:cw2bit/domain/tool/github_1bit/values/constant.dart';

class Github1bitCommentEditState {
  late IssuesModel issuesModel;

  final String owner = c_1bit_repo_owner;
  final String repo = c_1bit_repo;

  Github1bitCommentEditState() {
    ///Initialize variables
  }
}
