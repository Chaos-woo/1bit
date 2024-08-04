import 'dart:async';
import 'dart:convert';

import 'package:cw2bit/domain/app_hot_search/app_hot_search_tabbar_page/models/app_hot_search_repo_content_model.dart';
import 'package:cw2bit/domain/app_hot_search/app_hot_search_tabbar_page/models/hot_search_model.dart';
import 'package:cw2bit/domain/app_hot_search/values/constant.dart';
import 'package:cw2bit/infrastructure/api/apis.dart';
import 'package:cw2bit/infrastructure/api/github/models/content/github_content.dart';
import 'package:cw2bit/public/webview/app_webview_dialog.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

import 'state.dart';

class AppHotSearchListLogic extends GetxController {
  final AppHotSearchListState state = AppHotSearchListState();

  final RegExp title_regex = RegExp(r'\[(.*?)\]');
  final RegExp url_regex = RegExp(r'\((.*?)\)');

  final k_app_hot_search_view_id = '#kAppHotSearch';
  final k_app_hot_search_progress_indicator_view_id = '#kAppHotSearchProgressIndicator';

  bool m_fetching_hot_search = false;
  Timer? _m_fetching_hot_search_timer;

  bool get fetching_hot_search => m_fetching_hot_search;

  @override
  void onReady() {
    super.onReady();
    fetch_app_hot_search_list();
  }

  /// 使用webview打开热搜内容
  Future<void> open_hot_search_webview(HotSearchModel model) async {
    await show_webview_dialog(
      url: model.url,
      title: '正在浏览：(${state.app})${model.content}',
      not_navigation_action_scheme: [
        'bilibili',
        'acfun',
      ],
    );
  }

  /// 更换APP
  void update_hot_search_app(String app) {
    state.app = app;
    fetch_app_hot_search_list();
  }

  /// 获取APP热搜列表
  void fetch_app_hot_search_list() async {
    if (m_fetching_hot_search) {
      return;
    }

    if (state.app.isEmpty) {
      update([k_app_hot_search_progress_indicator_view_id]);
      return;
    }

    m_fetching_hot_search = true;
    state.set_original_hot_search_list([]);
    update([k_app_hot_search_view_id, k_app_hot_search_progress_indicator_view_id]);

    if (_m_fetching_hot_search_timer != null) {
      _m_fetching_hot_search_timer!.cancel();
    }

    _m_fetching_hot_search_timer = QKit.delay.delay_timer(() {
      if (m_fetching_hot_search) {
        m_fetching_hot_search = false;
        update([k_app_hot_search_progress_indicator_view_id]);
      }
    }, duration: 5.seconds);

    GithubContent contents = await Apis.github.get_content(
      c_hot_search_repo_owner,
      c_hot_search_repo,
      'archives/${state.app}/${state.app}.md',
    );

    AppHotSearchRepoContentModel realtime_model =
        AppHotSearchRepoContentModel.fromJson(contents.toJson());
    Uint8List decoded_bytes = base64.decode(realtime_model.content!.replaceAll('\n', ''));
    List<HotSearchModel> hot_search_model_list = extract_hot_search_models(decoded_bytes);
    state.set_original_hot_search_list(hot_search_model_list);

    m_fetching_hot_search = false;
    update([k_app_hot_search_view_id, k_app_hot_search_progress_indicator_view_id]);
  }

  List<HotSearchModel> extract_hot_search_models(Uint8List decoded_bytes) {
    String decoded_string = utf8.decode(decoded_bytes);
    int index = 1;
    List<HotSearchModel> models = [];
    for (String line in LineSplitter.split(decoded_string)) {
      Match? title_match = title_regex.firstMatch(line);
      Match? url_match = url_regex.firstMatch(line);

      if (title_match != null && url_match != null) {
        String title = title_match.group(1)!;
        String url = url_match.group(1)!;
        models.add(HotSearchModel(index: index, content: title, url: url));
        index++;
      }
    }
    return models;
  }
}
