import 'package:cw2bit/domain/feature_explore/github_1bit/issues/components/github_issues/models/comment/comment_model.dart';
import 'package:cw2bit/domain/feature_explore/github_1bit/values/constant.dart';
import 'package:cw2bit/infrastructure/api/apis.dart';
import 'package:cw2bit/infrastructure/api/github/models/comment/github_comment.dart';
import 'package:qkit/qkit.dart';

import 'state.dart';

class Github1bitIssuesDetailLogic extends PagingController<Github1bitIssuesDetailState> {
  final Github1bitIssuesDetailState state = Github1bitIssuesDetailState();

  @override
  Github1bitIssuesDetailState create_paging_state() {
    return state;
  }

  @override
  Future<List<CommentModel>> fetch_data() async {
    /// 问题详情由上一页面带入，本页面主要加载问题评论
    List<GithubComment> comments = await Apis.github.list_comments(
      c_1bit_repo_owner,
      c_1bit_repo,
      state.issues_model.number,
      page: state.current_page,
      pageSize: state.page_size,
    );
    List<CommentModel> commentModelList = comments.map((e) => CommentModel.fromJson(e.toJson())).toList();
    return commentModelList;
  }
}
