import 'package:cw2bit/domain/app_hot_search/models/bo/app_groups.dart';
import 'package:cw2bit/domain/app_hot_search/models/bo/app_webpages.dart';
import 'package:cw2bit/domain/app_hot_search/models/hot_search_model.dart';
import 'package:cw2bit/domain/app_hot_search/values/constant.dart';
import 'package:cw2bit/infrastructure/api/github/models/content/github_content.dart';
import 'package:cw2bit/infrastructure/api/github/models/github_enum.dart';
import 'package:cw2bit/infrastructure/database/entity/app_hot_search/favorite_app.dart';
import 'package:cw2bit/infrastructure/database/entity/app_hot_search/favorite_app_group.dart';
import 'package:cw2bit/infrastructure/database/entity/webpage/webpage_reading.dart';

class HistoryHotSearchState {
  /// 当前选择的APP
  String app = '';

  /// 当前选择的APP组
  int group_id = -1;

  /// 日期选择器选择的时间
  DateTime picked_date = DateTime.now();

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
    LocalAppGroup(
      group: FavoriteAppGroup(name: '全部', order: -1, id: -1, create_time: DateTime.now()),
      apps: [],
    ),
  ]);

  /// 收藏的APP
  void set favorite_app_group(LocalAppGroups value) => _m_favorite_app_group = value;

  /// 获取收藏的APP组列表
  List<FavoriteAppGroup> get favorite_app_groups => _m_favorite_app_group.groups.map((e) => e.group).toList();

  /// 根据指定的APP名称获取对应的收藏APP组中的APP列表
  List<FavoriteApp> favorite_apps_by_group_id(int group_id) {
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
    value.forEach((element) => _m_webpage_history.replaceWebpage(element));
  }

  /// 热搜网页阅读记录
  LocalAppWebpages get webpage_reading_history => _m_webpage_history;

  /// 根据URL获取热搜网页阅读记录
  WebpageReading? get_webpage_reading(String url) {
    return _m_webpage_history.findWebpage(url);
  }

  /// ============= 历史热搜的Github仓库文件 == 1 ==================
  /// 当前的路径
  String m_current_dir_path = c_hot_search_repo_root_dir;

  /// 当前打开的文件路径
  String m_current_file_path = '';

  /// 当前打开的文件是否是指定文件路径
  bool m_is_current_file_specified(String file_path) => m_current_file_path == file_path;

  /// 历史存档目录
  List<GithubContent> _m_history_dir_list = [];

  List<GithubContent> get history_directory_list => [
        if (m_current_dir_path.split("/").length > 2)
          GithubContent(
              name: "..",
              path: "",
              type: EnumGithubContentType.dir,
              size: 0,
              url: "",
              htmlUrl: "",
              gitUrl: "",
              downloadUrl: null,
              content: null,
              encoding: null,
              sha: ''),
        ..._m_history_dir_list
      ];

  set history_directory_list(List<GithubContent> value) {
    _m_history_dir_list.clear();
    _m_history_dir_list.addAll(value);
  }

  /// ============= 历史热搜的Github仓库文件 == 2 ==================

  HistoryHotSearchState() {
    ///Initialize variables
  }
}
