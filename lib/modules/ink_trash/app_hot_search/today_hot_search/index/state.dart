import 'package:cw2bit/modules/app_hot_search/models/wrappers/app_groups.dart';
import 'package:cw2bit/modules/app_hot_search/models/wrappers//app_webpages.dart';
import 'package:cw2bit/modules/app_hot_search/models/hot_search_model.dart';
import 'package:cw2bit/infrastructure/c0_.dart';
import 'package:cw2bit/infrastructure/database/entity/app_hot_search/hot_search_app.dart';
import 'package:cw2bit/infrastructure/database/entity/app_hot_search/hot_search_group.dart';
import 'package:cw2bit/infrastructure/database/entity/webpage/webpage_reading.dart';
import 'package:cw2bit/infrastructure/database/entity_combination/comb_hot_search_group_apps.dart';

class TodayHotSearchState {
  /// 当前选择的APP
  String app = '';

  /// 当前选择的APP组
  int group_id = -1;

  /// 可选择的APP
  final List<String> _m_apps = [];

  /// 获取可选择的APP
  List<String> get apps => _m_apps;

  /// 设置可选择的APP
  set apps(List<String> value) {
    _m_apps.clear();
    _m_apps.addAll(value);
  }

  /// 收藏的APP
  LocalAppGroups _m_favorite_app_group = LocalAppGroups.from([
    CombHotSearchGroupApps(
      group: HotSearchGroup(name: '全部', criteria: -1, id: -1, create_time: DateTime.now(), update_time: DateTime.now()),
      apps: [],
    ),
  ]);

  /// 收藏的APP
  void set favorite_app_group(LocalAppGroups value) => _m_favorite_app_group = value;

  /// 获取收藏的APP组列表
  List<HotSearchGroup> get favorite_app_groups => _m_favorite_app_group.groups.map((e) => e.group).toList();

  /// 根据指定的APP名称获取对应的收藏APP组中的APP列表
  List<HotSearchApp> favorite_apps_by_group_id(int group_id) {
    return _m_favorite_app_group.groups.firstWhere((e) => e.group.id == group_id).apps;
  }

  /// 热搜列表
  List<HotSearchModel> _m_hot_search_list_for_app = [];

  /// 热搜列表
  List<HotSearchModel> get hot_search_list => _m_hot_search_list_for_app;

  /// 设置热搜列表
  set hot_search_list(List<HotSearchModel> value) {
    _m_hot_search_list_for_app.clear();
    _m_hot_search_list_for_app.addAll(value);
  }

  /// 热搜网页阅读记录
  final LocalAppWebpages _m_webpage_history = LocalAppWebpages([]);

  /// 热搜网页阅读记录
  void replace_webpage_reading_history(List<WebpageReading> value) {
    value.forEach((element) => _m_webpage_history.replace_webpage(element));
  }

  /// 热搜网页阅读记录
  LocalAppWebpages get webpage_reading_history => _m_webpage_history;

  /// 根据URL获取热搜网页阅读记录
  WebpageReading? get_webpage_reading(String url) {
    return _m_webpage_history.find_webpage(url);
  }

  TodayHotSearchState() {
    ///Initialize variables
  }
}
