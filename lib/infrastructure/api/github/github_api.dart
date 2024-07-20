import 'package:cw2bit/domain/tool/github_1bit/issues/state.dart';
import 'package:cw2bit/infrastructure/api/github/github_interceptor.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

import 'models/github_do.dart';

final class GithubApi extends GetxService {
  static const String tag = '#githubApi';

  static GithubApi get singl => Get.find(tag: tag);

  late DioApi _m_api;

  GithubApi() {
    _m_api = DioApi('https://api.github.com', interceptors: [GithubInterceptor()]);
  }

  /// 获取仓库issues列表
  Future<List<Issues>> listIssues(
    String owner,
    String repo, {
    int page = 1,
    int pageSize = 30,
    IssuesFiltered? state,
    IssuesFiltered? sortField,
    IssuesFiltered? sortDirection,
    List<String> labels = const [],
  }) async {
    Map<String, dynamic> params = {
      'state': (state ?? IssuesFiltered.state_open).option,
      'sort': (sortField ?? IssuesFiltered.sort_created).option,
      'direction': (sortDirection ?? IssuesFiltered.direction_desc).option,
      'page': page,
      'per_page': pageSize,
    };

    if (labels.isNotEmpty) {
      params['labels'] = labels.join(",");
    }

    List<Issues>? issues = await _m_api.get(
      '/repos/$owner/$repo/issues',
      params: params,
      objectConvertor: (rawData) => rawData.asList(objectConvertor: Issues.fromJson),
    );

    return issues ?? [];
  }

  /// 获取仓库标签列表
  Future<List<Label>> listLabels(String owner, String repo) async {
    List<Label>? labels = await _m_api.get(
      '/repos/$owner/$repo/labels',
      objectConvertor: (rawData) => rawData.asList(objectConvertor: Label.fromJson),
    );

    return labels ?? [];
  }

  /// 获取仓库下指定issues的评论列表
  Future<List<Comment>> listComments(
    String owner,
    String repo,
    int issuesNumber, {
    int page = 1,
    int pageSize = 30,
  }) async {
    Map<String, dynamic> params = {
      'page': page,
      'per_page': pageSize,
    };
    List<Comment> comments = await _m_api.get(
      '/repos/$owner/$repo/issues/$issuesNumber/comments',
      params: params,
      objectConvertor: (rawData) => rawData.asList(objectConvertor: Comment.fromJson),
    );

    return comments ?? [];
  }

  /// 提交1个issues
  Future<void> postIssues(
    String owner,
    String repo,
    String title, {
    String body = '',
    List<String> labels = const [],
  }) async {
    Map<String, dynamic> data = {'title': title, 'body': body, 'labels': labels};
    await _m_api.post(
      '/repos/$owner/$repo/issues',
      data: data,
    );
  }

  /// 提交1条评论到指定issues
  Future<void> postComment(String owner, String repo, int issuesNumber, String text) async {
    Map<String, dynamic> data = {'body': text};
    await _m_api.post(
      '/repos/$owner/$repo/issues/$issuesNumber/comments',
      data: data,
    );
  }
}
