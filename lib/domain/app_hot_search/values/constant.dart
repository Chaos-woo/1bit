import 'package:flustars_flutter3/flustars_flutter3.dart';

/// 基于 app_hot_search_list
/// 防止WebView自动打开三方应用或无法解析的导航
const c_not_navigation_action_scheme = [
  'bilibili',
  'acfun',
  'weixin',
  'snssdk1128',
  'intent',
  'baiduboxapp',
  'sspai',
  'zhihu',
];

const c_not_navigation_action_keyword = [
  'signin',
  'login',
];

/// webpage发布时间格式化
final c_webpage_publish_date_time_format = '${DateFormats.y_mo_d}';

/// webpage阅读进度完成的默认阈值
const c_default_webpage_progress_finish_threshold = 0.8;

/// APP黑名单的缓存数据Key
const String k_pfs_app_hot_search_black_list = '__k_pfs_app_hot_search_black_list__';

/// 默认APP组的缓存数据Key
const String k_pfs_app_hot_search_default_group = '__k_pfs_app_hot_search_default_group__';

/// webpage阅读进度完成的阈值缓存数据Key
const String k_pfs_webpage_progress_finish_threshold = '__k_pfs_webpage_progress_finish_threshold__';
