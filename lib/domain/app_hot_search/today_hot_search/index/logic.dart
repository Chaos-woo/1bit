import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:cw2bit/domain/app_hot_search/models/wrappers/app_groups.dart';
import 'package:cw2bit/domain/app_hot_search/models/hot_search_model.dart';
import 'package:cw2bit/domain/app_hot_search/today_hot_search/index/state.dart';
import 'package:cw2bit/domain/app_hot_search/values/constant.dart';
import 'package:cw2bit/infrastructure/api/apis.dart';
import 'package:cw2bit/infrastructure/api/github/models/content/github_content.dart';
import 'package:cw2bit/infrastructure/api/github/models/github_enum.dart';
import 'package:cw2bit/infrastructure/database/entity/app_hot_search/hot_search_app.dart';
import 'package:cw2bit/infrastructure/database/entity/app_hot_search/hot_search_group.dart';
import 'package:cw2bit/infrastructure/database/entity/app_hot_search/hot_search_repo.dart';
import 'package:cw2bit/infrastructure/database/entity/webpage/webpage_repo.dart';
import 'package:cw2bit/infrastructure/database/entity_combination/comb_hot_search_group_apps.dart';
import 'package:cw2bit/public/webview/app_webview_dialog.dart';
import 'package:cw2bit/public/webview/app_webview_listener.dart';
import 'package:get/get.dart';

class TodayHotSearchLogic extends GetxController {
  final TodayHotSearchState state = TodayHotSearchState();

  final k_app_scroll_view_view_id = '__k_app_scroll_view_view_id__';
  final k_group_scroll_view_view_id = '__k_group_scroll_view_view_id__';
  final k_hot_search_scroll_view_view_id = '__k_hot_search_scroll_view_view_id__';
  final k_hot_search_refresh_view_id = '__k_hot_search_refresh_view_id__';

  final RegExp title_regex = RegExp(r'\[(.*)\]');
  final RegExp url_regex = RegExp(r'\((.*?)\)');

  var hot_search_refreshing = false;

  @override
  void onReady() async {
    super.onReady();

    await _init_app_list();
  }

  Future<void> m_refresh_group_apps_and_hot_search_list() async {
    await _init_app_list();
  }

  Future<void> _init_app_list() async {
    /// 获取APP组和APP列表
    var f_group_with_apps = HotSearchRepo.getx.list_groups_with_apps();

    /// 获取”全部”组的APP列表
    var f_all_apps = fetch_app_list_noUi();

    Future.wait([f_group_with_apps, f_all_apps]).then((List<dynamic> values) {
      List<CombHotSearchGroupApps> group_with_apps = values[0] as List<CombHotSearchGroupApps>;
      List<String> cloud_all_apps = values[1] as List<String>;

      state.app = '';
      state.group_id = -1;
      state.favorite_app_group = LocalAppGroups.from([
        CombHotSearchGroupApps(
          group:
              HotSearchGroup(name: '全部', order: -1, id: -1, create_time: DateTime.now(), update_time: DateTime.now()),
          apps: cloud_all_apps
              .map((e) =>
                  HotSearchApp(id: -1, name: e, create_time: DateTime.now(), update_time: DateTime.now(), order: -1))
              .toList(),
        ),
        ...group_with_apps,
      ]);
    }).whenComplete(() {
      /// 刷新UI
      switch_favorite_group_noUi(state.group_id);
      update([k_app_scroll_view_view_id, k_group_scroll_view_view_id]);
    });
  }

  /// 根据URL获取APP的热搜阅读进度比
  (int be_read, int remaining) get_app_progress_ratio(String url) {
    var reading = state.get_webpage_reading(url);
    if (reading == null) {
      return (-1, -1);
    }

    /// 将阅读进度double小数保留两位
    double reading_progress = double.parse(reading.reading_progress.toStringAsFixed(2));
    int be_read = min((reading_progress * 100).toInt(), 100);
    be_read = be_read > 92 ? 100 : be_read;
    return (be_read, 100 - be_read);
  }

  /// 使用webview打开热搜内容
  Future<void> open_hot_search_webview(HotSearchModel model) async {
    /// 处理当前阅读进度
    var reading_record = await WebpageRepo.getx.get_reading_record(model.url);
    int reading_record_id = reading_record?.id ?? -1;
    if (reading_record == null) {
      reading_record_id = await WebpageRepo.getx.add_reading_record(model.url, app: state.app);
    }

    await show_webview_dialog(
      url: model.url,
      title: '正在浏览：(${state.app})${model.content}',
      not_navigation_action_scheme: c_not_navigation_action_scheme,
      listener: AppWebviewReadingListener(
        onWebviewLoaded: (webviewController, url) async {
          await WebpageRepo.getx.update_reading_update_time(url);
        },
        onViewScrollChanged: (webviewController, url, scrollTop, totalHeight) async {
          /// 更新阅读进度
          double progress = (scrollTop / totalHeight).clamp(0.0, 1.0);
          var stored_reading_record = await WebpageRepo.getx.get_reading_record(model.url);
          if (scrollTop > stored_reading_record!.reading_scroll_top) {
            await WebpageRepo.getx.update_reading_progress(reading_record_id, progress, scrollTop);
          }
        },
        onWebviewClosed: (url) async {
          /// 更新页面的阅读进度
          var new_reading_record = await await WebpageRepo.getx.get_reading_record_by_id(reading_record_id);
          state.replace_webpage_reading_history([new_reading_record!]);
          update([k_hot_search_scroll_view_view_id]);
        },
      ),
    );
  }

  /// 获取最后阅读的URL
  String? get_last_read_url() {
    var history = state.webpage_reading_history.webpages;
    history.sort((a, b) => b.update_time.compareTo(a.update_time));
    if (history.isEmpty) {
      return null;
    }
    return history.first.url;
  }

  /// 切换收藏组，展示收藏组中的APP列表
  Future<void> switch_favorite_group_noUi(int group_id) async {
    List<HotSearchApp> apps = state.favorite_apps_by_group_id(group_id);
    state.app = '';
    state.apps = apps.map((e) => e.name).toList();
    state.group_id = group_id;
  }

  Future<List<String>> fetch_app_list_noUi() async {
    List<GithubContent> contents =
        await Apis.github.list_contents(c_hot_search_repo_owner, c_hot_search_repo, c_hot_search_repo_root_dir);
    List<String> apps = contents
        // 过滤出项目中目录类型的内容，即APP，APP的归档内容都被放置到对应的APP目录下
        .where((content) => EnumGithubContentType.dir == content.type)
        .map((content) => content.name)
        .toList();
    return Future.value(apps);
  }

  /// 切换APP，展示APP的热搜列表
  Future<void> fetch_app_hot_search_list_noUi(HotSearchApp app) async {
    state.app = app.name;
    state.apps = [];
    hot_search_refreshing = true;
    update([k_app_scroll_view_view_id, k_hot_search_scroll_view_view_id, k_hot_search_refresh_view_id]);

    Timer t = Timer(Duration(seconds: 3), () {
      hot_search_refreshing = false;
      update([k_hot_search_refresh_view_id]);
    });

    GithubContent? realtime_content;
    try {
      realtime_content = await Apis.github.get_content(
        c_hot_search_repo_owner,
        c_hot_search_repo,
        '$c_hot_search_repo_root_dir/${app.name}/${app.name}.md',
      );
    } catch (ex) {
      rethrow;
    } finally {
      if (t.isActive) {
        t.cancel();
      }
      hot_search_refreshing = false;
      update([k_hot_search_refresh_view_id]);
    }

    Uint8List decoded_bytes = base64.decode(realtime_content.content!.replaceAll('\n', ''));
    List<HotSearchModel> hot_search_model_list = extract_hot_search_models(decoded_bytes);
    state.hot_search_list = hot_search_model_list;

    var all_reading_records = await WebpageRepo.getx.list_all_reading_records();
    state.replace_webpage_reading_history(all_reading_records);
  }

  /// 从文本行中抽取标题和链接
  List<HotSearchModel> extract_hot_search_models(Uint8List decoded_bytes) {
    String decoded_string = utf8.decode(decoded_bytes);
    List<HotSearchModel> models = [];
    for (String line in LineSplitter.split(decoded_string)) {
      Match? title_match = title_regex.firstMatch(line);
      Iterable<RegExpMatch> url_match = url_regex.allMatches(line);

      if (title_match != null && url_match.isNotEmpty) {
        String title = title_match.group(1)!;
        String url = url_match.last.group(1)!;
        models.add(HotSearchModel(index: -1, content: title, url: url));
      }
    }

    models = models.reversed.toList();
    int index = 1;
    for (HotSearchModel model in models) {
      model.index = index;
      index++;
    }

    return models;
  }
}
