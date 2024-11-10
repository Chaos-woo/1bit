import 'dart:convert';

import 'package:cw2bit/domain/app_hot_search/history_hot_search/index/state.dart';
import 'package:cw2bit/domain/app_hot_search/models/bo/app_groups.dart';
import 'package:cw2bit/domain/app_hot_search/models/hot_search_content_model.dart';
import 'package:cw2bit/domain/app_hot_search/models/hot_search_model.dart';
import 'package:cw2bit/domain/app_hot_search/values/constant.dart';
import 'package:cw2bit/infrastructure/api/apis.dart';
import 'package:cw2bit/infrastructure/api/github/models/content/github_content.dart';
import 'package:cw2bit/infrastructure/api/github/models/github_enum.dart';
import 'package:cw2bit/infrastructure/database/entity/app_hot_search/favorite_app.dart';
import 'package:cw2bit/infrastructure/database/entity/app_hot_search/favorite_app_group.dart';
import 'package:cw2bit/infrastructure/database/entity/app_hot_search/hot_search_repo.dart';
import 'package:cw2bit/infrastructure/database/entity/webpage/webpage_repo.dart';
import 'package:cw2bit/public/webview/app_webview_dialog.dart';
import 'package:cw2bit/public/webview/app_webview_listener.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutterflow_ui/flutterflow_ui.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

class HistoryHotSearchLogic extends GetxController {
  final HistoryHotSearchState state = HistoryHotSearchState();

  final k_app_scroll_view_view_id = '__k_app_scroll_view_view_id__';
  final k_group_scroll_view_view_id = '__k_group_scroll_view_view_id__';
  final k_app_hot_search_history_directory_view_id = '__k_app_hot_search_history_directory_view_id__';
  final k_hot_search_scroll_view_view_id = '__k_hot_search_scroll_view_view_id__';

  final RegExp title_regex = RegExp(r'\[(.*)\]');
  final RegExp url_regex = RegExp(r'\((.*?)\)');

  /// 日历的Key
  final calendar_key = GlobalKey();

  @override
  void onReady() async {
    super.onReady();

    await _fetch_cloud_apps_and_local_app_groups();
  }

  Future<void> m_refresh_group_apps_and_hot_search_list() async {
    await _fetch_cloud_apps_and_local_app_groups();
  }

  Future<void> _fetch_cloud_apps_and_local_app_groups() async {
    /// 获取APP组列表
    var ft_groups = HotSearchRepo.singl.list_groups();

    /// 获取本地APP列表
    var ft_apps = HotSearchRepo.singl.list_apps();

    /// 获取”全部”组的APP列表
    var ft_all_apps = fetch_app_list();

    /// 组合数据
    Future.wait([ft_groups, ft_apps, ft_all_apps]).then((List<dynamic> values) {
      List<FavoriteAppGroup> local_groups = values[0] as List<FavoriteAppGroup>;
      List<FavoriteApp> local_apps = values[1] as List<FavoriteApp>;
      List<String> cloud_all_apps = values[2] as List<String>;

      state.app = '';
      state.group_id = -1;
      state.favorite_app_group = LocalAppGroups.from([
        LocalAppGroup(
          group: FavoriteAppGroup(name: '全部', order: -1, id: -1, create_time: DateTime.now()),
          apps: cloud_all_apps
              .map((e) => FavoriteApp(id: -1, name: e, create_time: DateTime.now(), group_id: -1, order: -1))
              .toList(),
        ),
        ...local_groups
            .map(
              (e) => LocalAppGroup(
                group: e,
                apps: local_apps.where((app) => app.group_id == e.id).toList(),
              ),
            )
            .toList(),
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
    var reading_record = await WebpageRepo.singl.get_reading_record(model.url);
    int reading_record_id = reading_record?.id ?? -1;
    if (reading_record == null) {
      reading_record_id = await WebpageRepo.singl.add_reading_record(model.url, app: state.app);
    }

    await show_webview_dialog(
      url: model.url,
      title: '正在浏览：(${state.app})${model.content}',
      not_navigation_action_scheme: c_not_navigation_action_scheme,
      listener: AppWebviewReadingListener(
        onWebviewLoaded: (webviewController, url) async {
          await WebpageRepo.singl.update_reading_update_time(url);
        },
        onViewScrollChanged: (webviewController, url, scrollTop, totalHeight) async {
          /// 更新阅读进度
          double progress = (scrollTop / totalHeight).clamp(0.0, 1.0);
          var stored_reading_record = await WebpageRepo.singl.get_reading_record(model.url);
          if (scrollTop > stored_reading_record!.reading_scroll_top) {
            await WebpageRepo.singl.update_reading_progress(reading_record_id, progress, scrollTop);
          }
        },
        onWebviewClosed: (url) async {
          /// 更新页面的阅读进度
          var new_reading_record = await await WebpageRepo.singl.get_reading_record_by_id(reading_record_id);
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
    return history.last.url;
  }

  /// 切换收藏组，展示收藏组中的APP列表
  Future<void> switch_favorite_group_noUi(int group_id) async {
    List<FavoriteApp> apps = state.favorite_apps_by_group_id(group_id);
    state.app = '';
    state.apps = apps.map((e) => e.name).toList();
    state.group_id = group_id;
  }

  /// 获取指定路径下的内容列表，包含子文件夹和文件
  Future<void> fetch_next_dir_list_noUi(String dir_path, {String? app_name}) async {
    state.history_directory_list = [];
    List<GithubContent> contents = await Apis.github.list_contents(
      c_hot_search_repo_owner,
      c_hot_search_repo,
      dir_path,
    );

    state.m_current_dir_path = dir_path;
    if (app_name != null) {
      state.app = app_name;
    }

    /// 更新获取到的文件夹内的内容
    state.history_directory_list = contents;

    /// 清空热搜列表
    state.hot_search_list = [];
  }

  /// 获取根目录下的全部APP列表
  Future<List<String>> fetch_app_list() async {
    List<GithubContent> contents =
        await Apis.github.list_contents(c_hot_search_repo_owner, c_hot_search_repo, c_hot_search_repo_root_dir);
    List<String> apps = contents
        // 过滤出项目中目录类型的内容，即APP，APP的归档内容都被放置到对应的APP目录下
        .where((content) => EnumGithubContentType.dir == content.type)
        .map((content) => content.name)
        .toList();
    return Future.value(apps);
  }

  /// 展示APP指定文件的热搜列表
  Future<void> fetch_app_hot_search_list_noUi(String file_path) async {
    if (file_path.isEmpty) {
      state.hot_search_list = [];
      return;
    }

    GithubContent? contents;
    var last_file_path = state.m_current_file_path;
    state.m_current_file_path = file_path;
    try {
      contents = await Apis.github.get_content(
        c_hot_search_repo_owner,
        c_hot_search_repo,
        file_path,
      );
    } catch (ex) {
      state.m_current_file_path = last_file_path;
      rethrow;
    }

    AppHotSearchRepoContentModel realtime_model = AppHotSearchRepoContentModel.fromJson(contents.toJson());
    Uint8List decoded_bytes = base64.decode(realtime_model.content!.replaceAll('\n', ''));
    List<HotSearchModel> hot_search_model_list = extract_hot_search_models(decoded_bytes);
    state.hot_search_list = hot_search_model_list;

    var all_reading_records = await WebpageRepo.singl.list_all_reading_records();
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

  /// 刷新指定APP的热搜文件bitmap
  /// 1.年份>=2024，使用yyyy/mm/yyyy-mm-dd.md格式的归档路径
  //  2.年份>=2023 & 月份>=11月，使用yyyy/mm/yyyy-mm-dd.md格式的归档路径
  //  3.年份>=2023 & 月份<8月，提示无归档数据
  //  4.年份>=2023 & 月份<11月，使用yyyy/mm归档路径，仅跳转月份归档
  //  5.年份 < 2023，提示无归档数据
  void refresh_available_hot_search_records_bitmap(String app, int year, int month) {
    QKit.delay.delay(() async {
      if (year < 2023) {
        return;
      }

      if (year == 2023 && month < 11) {
        return;
      }

      var archive_file_identifier = ArchiveDateIdentifier(year, month, app);
      var pfs_key = archive_file_identifier.format_apps_available_history_records_key;

      var records_bitmap = QKit.bridge.flustars.preferences.getString(pfs_key, default_value: null);

      var now = DateTime.now();

      /// 不存在或当月，需要重新获取
      if (records_bitmap == null || (now.year == year && now.month == month)) {
        /// 接口获取热搜记录文件列表
        try {
          List<GithubContent> contents = await Apis.github.list_contents(
            c_hot_search_repo_owner,
            c_hot_search_repo,
            '${c_hot_search_repo_root_dir}/${archive_file_identifier.app}/${archive_file_identifier.year}/${archive_file_identifier.format_history_records_month()}',
          );

          var record_names = contents.map((e) => e.name).toList();

          /// 首次获取，初始化bitmap
          int max_index = 32;
          records_bitmap = '0' * max_index;
          var record_bitmap_list = records_bitmap.split('');
          for (int i = 1; i < max_index; i++) {
            var exist = record_names
                .firstWhereOrNull((name) => name.startsWith(archive_file_identifier.format_history_records_key(i)));
            if (exist != null) {
              record_bitmap_list[i] = '1';
            }
          }
          records_bitmap = record_bitmap_list.join();
          QKit.bridge.flustars.preferences.putString(pfs_key, records_bitmap);
          calendar_key.currentState?.safeSetState(() {});
        } catch (ex) {
          // 忽略异常
        }
      }
    });
  }

  /// 获取指定APP的热搜文件某天是否存在热搜
  bool is_available_hot_search_records(String app, int year, int month, int day) {
    var archive_file_identifier = ArchiveDateIdentifier(year, month, app);
    var pfs_key = archive_file_identifier.format_apps_available_history_records_key;
    var records_bitmap = QKit.bridge.flustars.preferences.getString(pfs_key, default_value: null);
    if (records_bitmap == null) {
      return false;
    }
    var record_bitmap_list = records_bitmap.split('');
    var bit = record_bitmap_list[day];
    return bit == '1';
  }
}
