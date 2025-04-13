import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:cw2bit/modules/github/models/github_repo.dart';
import 'package:cw2bit/infrastructure/api/github/models/content/github_content.dart';
import 'package:cw2bit/infrastructure/api/github/models/github_content_type.dart';
import 'package:cw2bit/infrastructure/c0_.dart';
import 'package:get/get.dart';

class GithubMgr extends GetxService {
  static final String getx_tag = '__getx_github_mgr__';

  static GithubMgr get getx => Get.find(tag: getx_tag);

  /// 获取指定路径下的文件或文件夹列表
  /// [repo] 仓库
  /// [path] 文件夹路径
  /// [type] 文件类型，默认为全部类型
  Future<List<GithubContent>> list_contents(
    GithubRepo repo,
    String path, {
    GithubContentType type = GithubContentType.all,
  }) async {
    var contents = await c0_.api_github.list_contents(repo.owner, repo.repo, path);
    switch (type) {
      case GithubContentType.dir:
        return contents.where((e) => e.type == GithubContentType.dir).toList();
      case GithubContentType.file:
        return contents.where((e) => e.type == GithubContentType.file).toList();
      default:
        return contents;
    }
  }

  /// 获取指定路径下的文件内容
  Future<GithubContent> get_content(GithubRepo repo, String path) async {
    return await c0_.api_github.get_content(repo.owner, repo.repo, path);
  }

  /// 仅获取指定路径下base64编码的文件内容
  Future<String> get_decoded_content(GithubRepo repo, String path) async {
    var (_, decoded_content) = await get_content_with_decoded_content(repo, path);
    return decoded_content;
  }

  /// 获取指定路径下的文件内容，并进行base64解码
  Future<(GithubContent content, String decoded_content)> get_content_with_decoded_content(
    GithubRepo repo,
    String path,
  ) async {
    GithubContent? content = await c0_.api_github.get_content(repo.owner, repo.repo, path);

    Uint8List decoded_bytes = base64.decode(content.content!.replaceAll('\n', ''));
    String decoded_string = utf8.decode(decoded_bytes);
    return (content, decoded_string);
  }
}
