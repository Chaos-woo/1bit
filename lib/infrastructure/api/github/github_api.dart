import 'package:cw2bit/domain/tool/github_1bit/issues/state.dart';
import 'package:cw2bit/domain/tool/github_1bit/values/constant.dart';
import 'package:cw2bit/infrastructure/api/github/github_error_handle.dart';
import 'package:cw2bit/infrastructure/api/github/github_interceptor.dart';
import 'package:cw2bit/infrastructure/api/github/models/comment/github_comment.dart';
import 'package:cw2bit/infrastructure/api/github/models/content/github_content.dart';
import 'package:cw2bit/infrastructure/api/github/models/issues/github_issues.dart';
import 'package:cw2bit/infrastructure/api/github/models/issues/github_label.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

final class GithubApi extends GetxService {
  static const String tag = '#githubApi';

  static GithubApi get singl => Get.find(tag: tag);

  late IOApi _m_api;

  GithubApi() {
    _m_api = IOApi(
      'https://api.github.com',
      interceptors: [GithubInterceptor()],
      dio_response_error_handle: [
        Github401ErrorHandle(),
      ],
    );
  }

  /// 获取仓库issues列表
  Future<List<GithubIssues>> listIssues(
    String owner,
    String repo, {
    int page = 1,
    int page_size = 30,
    IssuesFiltered? state,
    IssuesFiltered? sort_field,
    IssuesFiltered? sort_direction,
    List<String> labels = const [],
  }) async {
    Map<String, dynamic> params = {
      'state': (state ?? IssuesFiltered.state_open).option,
      'sort': (sort_field ?? IssuesFiltered.sort_created).option,
      'direction': (sort_direction ?? IssuesFiltered.direction_desc).option,
      'page': page,
      'per_page': page_size,
    };

    if (labels.isNotEmpty) {
      params['labels'] = labels.join(",");
    }

    List<GithubIssues>? issues = await _m_api.get(
      '/repos/$owner/$repo/issues',
      params: params,
      object_convertor: (rawData) => rawData.asList(object_convertor: GithubIssues.fromJson),
    );

    return issues ?? [];
  }

  /// 获取仓库标签列表
  Future<List<GithubLabel>> listLabels(String owner, String repo) async {
    List<GithubLabel>? labels = await _m_api.get(
      '/repos/$owner/$repo/labels',
      object_convertor: (rawData) => rawData.asList(object_convertor: GithubLabel.fromJson),
    );

    return labels ?? [];
  }

  /// 获取仓库下指定issues的评论列表
  Future<List<GithubComment>> listComments(
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
    List<GithubComment> comments = await _m_api.get(
      '/repos/$owner/$repo/issues/$issuesNumber/comments',
      params: params,
      object_convertor: (rawData) => rawData.asList(object_convertor: GithubComment.fromJson),
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
  Future<void> postComment(String owner, String repo, int issues_number, String text) async {
    Map<String, dynamic> data = {'body': text};
    await _m_api.post(
      '/repos/$owner/$repo/issues/$issues_number/comments',
      data: data,
    );
  }

  /// 获取仓库标签列表接口校验Token有效性
  Future<void> check_access_token(String owner, String repo, String? override_access_key) async {
    await _m_api.get(
      '/repos/$owner/$repo/labels',
      object_convertor: (raw_data) => raw_data.asList(object_convertor: GithubLabel.fromJson),
      request_option: OverrideRequestOption(
        extra: {}..[k_pref_github_override_access_key] = override_access_key,
      ),
    );
  }

  /// 获取仓库的内容
  Future<List<GithubContent>> list_contents(String owner, String repo, String path) async {
    return await _m_api.get(
      '/repos/$owner/$repo/contents/$path',
      object_convertor: (raw_data) => raw_data.asList(object_convertor: GithubContent.fromJson),
    );
  }

  /// 获取仓库的内容
  Future<GithubContent> get_content(String owner, String repo, String path) async {
    return await _m_api.get(
      '/repos/$owner/$repo/contents/$path',
      object_convertor: (raw_data) => raw_data.as(object_convertor: GithubContent.fromJson),
    );
  }
}
