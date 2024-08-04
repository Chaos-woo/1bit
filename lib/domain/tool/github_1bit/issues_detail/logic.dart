import 'package:cw2bit/domain/tool/github_1bit/issues/components/github_issues/models/comment/comment_model.dart';
import 'package:cw2bit/domain/tool/github_1bit/values/constant.dart';
import 'package:cw2bit/infrastructure/api/apis.dart';
import 'package:cw2bit/infrastructure/api/github/models/comment/github_comment.dart';
import 'package:qkit/qkit.dart';

import 'state.dart';

class Github1bitIssuesDetailLogic extends PagingController<Github1bitIssuesDetailState> {
  final Github1bitIssuesDetailState state = Github1bitIssuesDetailState();

  @override
  Github1bitIssuesDetailState createPagingState() {
    return state;
  }

  @override
  Future<List<CommentModel>> fetchData() async {
    /// 问题详情由上一页面带入，本页面主要加载问题评论
    List<GithubComment> comments = await Apis.github.listComments(
      c_1bit_repo_owner,
      c_1bit_repo,
      state.issuesModel.number,
      page: state.currPage,
      pageSize: state.pageSize,
    );
    List<CommentModel> commentModelList =
        comments.map((e) => CommentModel.fromJson(e.toJson())).toList();
    return commentModelList;
  }
}
