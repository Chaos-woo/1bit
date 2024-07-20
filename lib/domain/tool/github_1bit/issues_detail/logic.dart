import 'package:cw2bit/domain/tool/github_1bit/issues/components/github_issues/models/github_models.dart';
import 'package:cw2bit/domain/tool/github_1bit/issues/values/constant.dart';
import 'package:cw2bit/infrastructure/api/apis.dart';
import 'package:cw2bit/infrastructure/api/github/models/github_do.dart';
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
    List<Comment> comments = await Apis.github.listComments(
      c_1bitOwner,
      c_1bitRepo,
      state.issuesModel.number,
      page: state.currPage,
      pageSize: state.pageSize,
    );
    List<CommentModel> commentModelList =
        comments.map((e) => CommentModel.fromJson(e.toJson())).toList();
    return commentModelList;
  }
}
