import 'package:cw2bit/domain/app_hot_search/service/hot_search_config_mgr.dart';
import 'package:cw2bit/domain/app_hot_search/service/hot_search_mgr.dart';
import 'package:cw2bit/domain/github/services/github_mgr.dart';
import 'package:cw2bit/domain/microsoft_bing/service/bing_mgr.dart';
import 'package:cw2bit/infrastructure/database/r_database.dart';
import 'package:cw2bit/public/ui/theme/themes.dart';

import 'api/apis.dart';

/// C0处理器
final class c0_ {
  /// 本地数据库仓库
  static final local_data_repo = DatabaseMgr.repos;

  /// 全局管理器
  static final mgr_theme = ThemesMgr.getx;
  static final mgr_bing = BingMgr.getx;
  static final mgr_github = GithubMgr.getx;

  /// 业务管理器
  static final bis_mgr_hot_search_config = HotSearchConfigMgr.getx;
  static final bis_mgr_hot_search = HotSearchMgr.getx;

  /// API
  static final api_github = Apis.github;

  c0_._();
}
