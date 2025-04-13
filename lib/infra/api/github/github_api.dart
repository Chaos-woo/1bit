import 'package:cw2bit/modules/feature_explore/github_1bit/issues/state.dart';
import 'package:cw2bit/modules/feature_explore/github_1bit/values/constant.dart';
import 'package:cw2bit/infrastructure/api/github/github_error_handle.dart';
import 'package:cw2bit/infrastructure/api/github/github_interceptor.dart';
import 'package:cw2bit/infrastructure/api/github/models/comment/github_comment.dart';
import 'package:cw2bit/infrastructure/api/github/models/content/github_content.dart';
import 'package:cw2bit/infrastructure/api/github/models/issues/github_issues.dart';
import 'package:cw2bit/infrastructure/api/github/models/issues/github_label.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

final class GithubApi extends GetxService {
  static const String getx_tag = '__getx_github_api__';

  static GithubApi get getx => Get.find(tag: getx_tag);

  late QApi _m_api;

  GithubApi() {
    _m_api = QApi(
      'https://api.github.com',
      interceptors: [GithubInterceptor()],
      dio_response_error_handle: [
        Github401ErrorHandle(),
      ],
    );
  }

  /// 获取仓库issues列表
  Future<List<GithubIssues>> list_issues(
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
      object_convertor: (rawData) => rawData.as_list(object_convertor: GithubIssues.fromJson),
    );

    return issues ?? [];
  }

  /// 获取仓库标签列表
  Future<List<GithubLabel>> list_labels(String owner, String repo) async {
    List<GithubLabel>? labels = await _m_api.get(
      '/repos/$owner/$repo/labels',
      object_convertor: (rawData) => rawData.as_list(object_convertor: GithubLabel.fromJson),
    );

    return labels ?? [];
  }

  /// 获取仓库下指定issues的评论列表
  Future<List<GithubComment>> list_comments(
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
      object_convertor: (rawData) => rawData.as_list(object_convertor: GithubComment.fromJson),
    );

    return comments ?? [];
  }

  /// 提交1个issues到指定仓
  Future<void> post_issues(
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

  /// 提交1条评论到指定仓库的issues
  Future<void> post_comment(String owner, String repo, int issues_number, String text) async {
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
      object_convertor: (raw_data) => raw_data.as_list(object_convertor: GithubLabel.fromJson),
      request_option: OverrideRequestOption(
        extra: {}..[k_pfs_github_override_access_key] = override_access_key,
      ),
    );
  }

  /// 列出指定路径下的内容，一般为罗列出文件夹下的所有内容，包含子文件夹和文件
  Future<List<GithubContent>> list_contents(String owner, String repo, String path) async {
    return await _m_api.get(
      '/repos/$owner/$repo/contents/$path',
      object_convertor: (raw_data) => raw_data.as_list(object_convertor: GithubContent.fromJson),
    );
  }

  /// 获取指定路径下的内容，一般为文件内容
  Future<GithubContent> get_content(String owner, String repo, String path) async {
    return await _m_api.get(
      '/repos/$owner/$repo/contents/$path',
      object_convertor: (raw_data) => raw_data.as(object_convertor: GithubContent.fromJson),
    );
  }
}
