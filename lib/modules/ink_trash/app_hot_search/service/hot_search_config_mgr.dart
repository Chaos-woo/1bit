import 'package:cw2bit/modules/app_hot_search/values/constant.dart';
import 'package:cw2bit/infrastructure/ext/my_extension.dart';
import 'package:cw2bit/infrastructure/ext/string_ext.dart';
import 'package:cw2bit/infrastructure/ext/system_operation.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

class HotSearchConfigMgr extends GetxService {
  static final String getx_tag = '__getx_hot_search_config_mgr__';

  static HotSearchConfigMgr get getx => Get.find(tag: getx_tag);

  /// APP归档阈值缓存
  final Map<String, ReadingProgressThreshold> app_archive_thresholds_cache = {};

  @override
  void onInit() async {
    super.onInit();

    // 刷新APP归档阈值缓存
    await refresh_app_archive_thresholds_cache();
  }

  /// 获取默认的APP分组配置
  Future<int> get_default_app_group_config() async {
    return q0_.bridge.flustars.preferences.getInt(k_pfs_app_hot_search_default_group, default_value: -1)!;
  }

  /// 设置或删除默认的APP分组配置
  /// return GenericOperation.add: 新增
  /// return GenericOperation.delete: 删除
  Future<GenericOperation> set_default_app_group_config(int group_id) async {
    int? stored_default_group_id = q0_.bridge.flustars.preferences.getInt(k_pfs_app_hot_search_default_group);
    bool is_selected_store_group_id = stored_default_group_id == group_id;
    if (is_selected_store_group_id) {
      await q0_.bridge.flustars.preferences.remove(k_pfs_app_hot_search_default_group);
      return GenericOperation.delete;
    } else {
      await q0_.bridge.flustars.preferences.putInt(k_pfs_app_hot_search_default_group, group_id);
      return GenericOperation.add;
    }
  }

  /// 获取APP黑名单列表配置
  Future<List<String>> get_black_apps_config() async {
    List<String> black_apps = await q0_.bridge.flustars.preferences.getStringList(
      k_pfs_app_hot_search_black_list,
      default_value: [],
    )!;
    return Future.value(black_apps);
  }

  /// 设置APP黑名单列表配置
  Future<void> set_black_apps_config(List<String> black_apps) async {
    await q0_.bridge.flustars.preferences.putStringList(
      k_pfs_app_hot_search_black_list,
      black_apps,
    );
  }

  /// 获取热搜的阅读进度完成的阈值配置
  Future<ReadingProgressThreshold> get_hot_search_read_progress_threshold_config({String app = ''}) async {
    if (app.is_blank) {
      var threshold = await q0_.bridge.flustars.preferences.getDouble(k_pfs_webpage_progress_finish_threshold);
      return threshold == null
          ? ReadingProgressThreshold.default_value('')
          : ReadingProgressThreshold('', threshold, false);
    } else {
      var threshold =
          await q0_.bridge.flustars.preferences.getDouble('${k_pfs_webpage_progress_finish_threshold}${app}');
      return threshold == null
          ? ReadingProgressThreshold.default_value(app)
          : ReadingProgressThreshold(app, threshold, false);
    }
  }

  /// 批量获取热搜的阅读进度完成的阈值配置
  Future<Map<String, ReadingProgressThreshold>> batch_get_hot_search_read_progress_threshold_config(
    List<String> apps,
  ) async {
    var configs = <ReadingProgressThreshold>{};
    for (var value in apps) {
      var config = await get_hot_search_read_progress_threshold_config(app: value);
      configs.add(config);
    }
    return Future.value(configs.to_map_first((config) => config.app, (config) => config));
  }

  /// 刷新APP归档阈值缓存
  Future<void> refresh_app_archive_thresholds_cache() async {
    var apps = InAdvanceAppThreshold.values.map((e) => e.app).toList();
    var configs = await batch_get_hot_search_read_progress_threshold_config(apps);
    app_archive_thresholds_cache.addAll(configs);
  }

  /// 设置APP热搜的阅读进度完成的阈值配置
  Future<void> set_hot_search_read_progress_threshold_config(double threshold, {String app = ''}) async {
    if (app.is_blank) {
      await q0_.bridge.flustars.preferences.putDouble(k_pfs_webpage_progress_finish_threshold, threshold);
    } else {
      await q0_.bridge.flustars.preferences.putDouble('${k_pfs_webpage_progress_finish_threshold}${app}', threshold);
    }

    // 刷新APP归档阈值缓存
    await refresh_app_archive_thresholds_cache();
  }

  /// 获取热搜APP的阅读进度完成阈值缓存
  ReadingProgressThreshold get_app_archive_threshold_cache(String app) {
    return app_archive_thresholds_cache[app] ?? ReadingProgressThreshold.default_value(app);
  }

  /// 获取设置APP是否记录阅读进度列表配置
  Future<List<String>> get_reading_record_white_apps_config() async {
    List<String> white_apps = await q0_.bridge.flustars.preferences.getStringList(
      k_pfs_app_hot_search_reading_record_white_list,
      default_value: [],
    )!;
    return Future.value(white_apps);
  }

  /// 设置APP是否记录阅读进度列表配置
  Future<void> set_reading_record_white_apps_config(List<String> white_apps) async {
    await q0_.bridge.flustars.preferences.putStringList(
      k_pfs_app_hot_search_reading_record_white_list,
      white_apps,
    );
  }

  /// 添加APP阅读进度记录表配置
  Future<void> add_reading_record_config(String app) async {
    var white_apps = await get_reading_record_white_apps_config();
    if (!white_apps.contains(app)) {
      white_apps.add(app);
      await set_reading_record_white_apps_config(white_apps);
    }
  }

  /// 删除APP阅读进度记录表配置
  Future<void> remove_reading_record_config(String app) async {
    var white_apps = await get_reading_record_white_apps_config();
    if (white_apps.contains(app)) {
      white_apps.remove(app);
      await set_reading_record_white_apps_config(white_apps);
    }
  }

  /// 判断APP是否在是否记录阅读进度列表中
  Future<bool> is_in_store_reading_record_white_apps(String app) async {
    var white_apps = await get_reading_record_white_apps_config();
    return white_apps.contains(app);
  }
}

/// 预置APP阈值配置
class InAdvanceAppThreshold {
  static InAdvanceAppThreshold m_kr_36 = InAdvanceAppThreshold('36氪', 45);
  static InAdvanceAppThreshold m_3dm_game = InAdvanceAppThreshold('3DM游戏网', 50);
  static InAdvanceAppThreshold m_51cto = InAdvanceAppThreshold('51CTO', 60);
  static InAdvanceAppThreshold acfun = InAdvanceAppThreshold('AcFun', 0);
  static InAdvanceAppThreshold csdn = InAdvanceAppThreshold('CSDN博客', 90);
  static InAdvanceAppThreshold free_buf = InAdvanceAppThreshold('FreeBuf', 63);
  static InAdvanceAppThreshold github_trending = InAdvanceAppThreshold('Github Trending', 0);
  static InAdvanceAppThreshold hello_github = InAdvanceAppThreshold('Hello GitHub', 0);
  static InAdvanceAppThreshold it_home = InAdvanceAppThreshold('IT之家', 40);
  static InAdvanceAppThreshold v2ex = InAdvanceAppThreshold('v2ex', 0);
  static InAdvanceAppThreshold woshipm = InAdvanceAppThreshold('人人都是产品经理', 70);
  static InAdvanceAppThreshold toutiao = InAdvanceAppThreshold('今日头条', 0);
  static InAdvanceAppThreshold youshewang = InAdvanceAppThreshold('优设网', 55);
  static InAdvanceAppThreshold history_today = InAdvanceAppThreshold('历史上的今天', 0);
  static InAdvanceAppThreshold m_52pojie = InAdvanceAppThreshold('吾爱破解', 70);
  static InAdvanceAppThreshold bilibili = InAdvanceAppThreshold('哔哩哔哩', 0);
  static InAdvanceAppThreshold anquanke = InAdvanceAppThreshold('安全客', 50);
  static InAdvanceAppThreshold anquanmaibo = InAdvanceAppThreshold('安全脉搏', 85);
  static InAdvanceAppThreshold sspai = InAdvanceAppThreshold('少数派', 47);
  static InAdvanceAppThreshold weibo = InAdvanceAppThreshold('微博', 0);
  static InAdvanceAppThreshold dongqiudi = InAdvanceAppThreshold('懂球帝', 0);
  static InAdvanceAppThreshold dongchedi = InAdvanceAppThreshold('懂车帝', 0);
  static InAdvanceAppThreshold douyin = InAdvanceAppThreshold('抖音', 0);
  static InAdvanceAppThreshold juejin = InAdvanceAppThreshold('掘金', 55);
  static InAdvanceAppThreshold jihewang = InAdvanceAppThreshold('机核网', 90);
  static InAdvanceAppThreshold the_paper = InAdvanceAppThreshold('澎湃新闻', 0);
  static InAdvanceAppThreshold baidu = InAdvanceAppThreshold('百度', 0);
  static InAdvanceAppThreshold tieba = InAdvanceAppThreshold('百度贴吧', 0);
  static InAdvanceAppThreshold kanxue = InAdvanceAppThreshold('看雪论坛', 0);
  static InAdvanceAppThreshold zhihu = InAdvanceAppThreshold('知乎', 0);
  static InAdvanceAppThreshold zhihu_daily = InAdvanceAppThreshold('知乎日报', 0);
  static InAdvanceAppThreshold jianshu = InAdvanceAppThreshold('简书', 10);
  static InAdvanceAppThreshold qq_news = InAdvanceAppThreshold('腾讯新闻', 0);
  static InAdvanceAppThreshold hupu = InAdvanceAppThreshold('虎扑步行街', 0);
  static InAdvanceAppThreshold douban_movie = InAdvanceAppThreshold('豆瓣电影', 0);
  static InAdvanceAppThreshold douban_group = InAdvanceAppThreshold('豆瓣讨论', 30);
  static InAdvanceAppThreshold xueqiu = InAdvanceAppThreshold('雪球', 50);

  static List<InAdvanceAppThreshold> values = [
    m_kr_36,
    m_3dm_game,
    m_51cto,
    acfun,
    csdn,
    free_buf,
    github_trending,
    hello_github,
    it_home,
    v2ex,
    woshipm,
    toutiao,
    youshewang,
    history_today,
    m_52pojie,
    bilibili,
    anquanke,
    anquanmaibo,
    sspai,
    weibo,
    dongqiudi,
    dongchedi,
    douyin,
    juejin,
    jihewang,
    the_paper,
    baidu,
    tieba,
    kanxue,
    zhihu,
    zhihu_daily,
    jianshu,
    qq_news,
    hupu,
    douban_movie,
    douban_group,
    xueqiu,
  ];

  final String app;
  final int in_advance_threshold;

  const InAdvanceAppThreshold(this.app, this.in_advance_threshold);

  static InAdvanceAppThreshold from(String app) {
    return InAdvanceAppThreshold.values.firstWhere((e) => e.app == app,
        orElse: () => InAdvanceAppThreshold(
              app,
              ReadingProgressThreshold.default_value('').as_int_percent,
            ));
  }

  /// 小数形式百分比
  double get as_double => in_advance_threshold / 100.0;
}
