import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:cw2bit/modules/app_hot_search/models/hot_search_model.dart';
import 'package:cw2bit/modules/app_hot_search/models/wrappers/app_groups.dart';
import 'package:cw2bit/modules/app_hot_search/values/constant.dart';
import 'package:cw2bit/modules/github/models/github_repo.dart';
import 'package:cw2bit/infrastructure/api/github/models/github_enum.dart';
import 'package:cw2bit/infrastructure/c0_.dart';
import 'package:cw2bit/infrastructure/database/entity/app_hot_search/hot_search_app.dart';
import 'package:cw2bit/infrastructure/database/entity/app_hot_search/hot_search_group.dart';
import 'package:cw2bit/infrastructure/database/entity/webpage/webpage_reading.dart';
import 'package:cw2bit/infrastructure/database/entity_combination/comb_hot_search_group_apps.dart';
import 'package:cw2bit/infrastructure/ext/my_extension.dart';
import 'package:cw2bit/infrastructure/ext/string_ext.dart';
import 'package:get/get.dart';

class HotSearchMgr extends GetxService {
  static final String getx_tag = '__getx_hot_search_mgr__';

  static HotSearchMgr get getx => Get.find(tag: getx_tag);

  static final root_dir = 'archives';

  Future<HotSearchGroup?> find_hot_search_group(int group_id) async {
    return await c0_.data_repository.hot_search.get_group_by_id(group_id);
  }

  GithubRepo right_repo_for(DateTime datetime) {
    return datetime.isAfter(DateTime(2024, 11, 30)) ? GithubRepo.riibit : GithubRepo.hot_searches_for_apps;
  }

  String right_realtime_hot_search_path(String app, DateTime datetime) {
    var year = datetime.year;
    var month_int_value = datetime.month;
    var month = month_int_value.toString();
    if (month_int_value < 10) {
      month = '0$month';
    }
    var day_int_value = datetime.day;
    var day = day_int_value.toString();
    if (day_int_value < 10) {
      day = '0$day';
    }
    return '$root_dir/$app/$year/$month/$year-$month-$day.md';
  }

  Future<LocalAppGroups> fetch_comb_hot_search_groups(GithubRepo repo) async {
    /// 获取APP组和APP列表
    var ft_group_with_apps = c0_.data_repository.hot_search.list_groups_with_apps();

    /// 获取”全部”组的APP列表
    var ft_all_apps = fetch_cloud_app_list(repo, root_dir);

    var groups;
    await Future.wait([ft_group_with_apps, ft_all_apps]).then((List<dynamic> values) {
      List<CombHotSearchGroupApps> group_with_apps = values[0] as List<CombHotSearchGroupApps>;
      List<String> cloud_all_apps = values[1] as List<String>;

      groups = LocalAppGroups.from([
        CombHotSearchGroupApps(
          group: HotSearchGroup(
              name: '全部', criteria: -1, id: -1, create_time: DateTime.now(), update_time: DateTime.now()),
          apps: cloud_all_apps
              .map((e) =>
                  HotSearchApp(id: -1, name: e, create_time: DateTime.now(), update_time: DateTime.now(), criteria: -1))
              .toList(),
        ),
        ...group_with_apps,
      ]);
    });

    return groups;
  }

  Future<List<String>> fetch_cloud_app_list(GithubRepo repo, String path) async {
    List<String> apps = (await c0_.mgr_github.list_contents(repo, path, type: GithubContentType.dir))
        .map((content) => content.name)
        .sorted(
      [
        SortRule.ascending((a, b) => a.length.compareTo(b.length)),
        SortRule.ascending((a, b) => a.first.compareTo(b.first)),
      ],
    ).toList();
    return Future.value(apps);
  }

  /// 计算网页阅读进度
  ReadingProgressRatio calculate_web_reading_progress_ratio(WebpageReading? reading) {
    if (reading == null) {
      return (-1, -1);
    }

    /// 将阅读进度double小数保留两位
    double reading_progress = double.parse(reading.reading_progress.toStringAsFixed(2));
    int be_read = min((reading_progress * 100).toInt(), 100);
    be_read = be_read > c0_.bis_mgr_hot_search_config.get_app_archive_threshold_cache(reading.app).as_int_percent
        ? 100
        : be_read;
    return (be_read, 100 - be_read);
  }

  final RegExp title_regex = RegExp(r'\[(.*)\]');
  final RegExp url_regex = RegExp(r'\((.*?)\)');

  /// 根据固定markdown格式匹配热搜列表
  /// 格式：[标题](链接)
  List<HotSearchModel> match_hot_search_models(String content) {
    List<HotSearchModel> models = [];
    for (String line in LineSplitter.split(content)) {
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

  /// 更新阅读记录的进度
  Future<void> save_reading_progress(int record_id, String record_url, double scroll_top, double total_height) async {
    double progress = (scroll_top / total_height).clamp(0.0, 1.0);
    var stored_reading_record = await c0_.data_repository.webpage.get_reading_record(record_url);
    if (scroll_top > stored_reading_record!.reading_scroll_top) {
      await c0_.data_repository.webpage.update_reading_progress(record_id, progress, scroll_top);
    }
  }
}
