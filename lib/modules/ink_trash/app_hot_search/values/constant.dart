import 'package:flustars_flutter3/flustars_flutter3.dart';

/// 阅读进度比
typedef ReadingProgressRatio = (int be_read, int remaining);

/// 阅读进度阈值
class ReadingProgressThreshold {
  final String _app;
  final double _value;
  final bool _is_default;

  ReadingProgressThreshold(this._app, this._value, this._is_default);

  /// 小数形式百分比
  double get as_double => _value;

  /// 整数形式百分比
  int get as_int_percent => (_value * 100).toInt();

  String get app => _app;

  bool get is_default => _is_default;

  /// 默认阈值
  ReadingProgressThreshold.default_value(this._app)
      : _value = c_default_webpage_progress_finish_threshold,
        _is_default = true;
}

/// 基于 app_hot_search_list / riibit
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
  'jianshu',
];

/// 基于 app_hot_search_list / riibit
/// 防止WebView自动跳转一些登录等网站引流页面
const c_not_navigation_action_keyword = <String>[
  // 'signin',
  // 'login',
];

/// webpage发布时间格式化
final c_webpage_publish_date_time_format = '${DateFormats.y_mo_d}';

/// webpage阅读进度完成的默认阈值
const c_default_webpage_progress_finish_threshold = 0.8;

/// APP黑名单的缓存数据Key
const String k_pfs_app_hot_search_black_list = '__k_pfs_app_hot_search_black_list__';

/// 设置APP是否记录阅读进度的缓存数据Key
const String k_pfs_app_hot_search_reading_record_white_list = '__k_pfs_app_hot_search_reading_record_white_list__';

/// 默认APP组的缓存数据Key
const String k_pfs_app_hot_search_default_group = '__k_pfs_app_hot_search_default_group__';

/// webpage阅读进度完成的阈值缓存数据Key
const String k_pfs_webpage_progress_finish_threshold = '__k_pfs_webpage_progress_finish_threshold__';
