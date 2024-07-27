import 'package:cw2bit/domain/tool/github_1bit/issues/components/github_issues/models/issues/issues_model.dart';
import 'package:cw2bit/domain/tool/github_1bit/issues/values/constant.dart';

class Github1bitCommentEditState {
  late IssuesModel issuesModel;

  final String owner = c_1bitRepoOwner;
  final String repo = c_1bitRepo;

  Github1bitCommentEditState() {
    ///Initialize variables
  }
}
