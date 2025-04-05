import 'package:cw2bit/infra/INK/INKs.dart';
import 'package:cw2bit/infra/a_extension/function_stream_extension.dart';
import 'package:cw2bit/modules/c_module_app_home/binding.dart';
import 'package:cw2bit/modules/c_module_app_home/view.dart';
import 'package:get/get.dart';
import 'package:cw2bit/infra/a_router/router.dart' as my_router;

enum RouteGroupNames {
  // 临时的，实验性质的，不知道如何处理的，例如新功能，新特性
  experimental('experimental'),
  // 功能性的，设置类的，全局类的内容跟
  functionality('functionality'),
  // 业务功能，功能玩法，已经成熟的、具体的内容
  feature('feature'),
  ;

  final String name;

  const RouteGroupNames(this.name);
}

/// RT0路由管理器
final class RTs {
  final String routeName;
  final RouteGroupNames group;
  final GetPageBuilder pageBuilder;
  Bindings? binding;
  List<Bindings> bindings;
  Transition? transition;
  Duration? transitionDuration;
  CustomTransition? overrideTransition;
  List<GetMiddleware>? middlewares;

  RTs._(
    this.routeName,
    this.group,
    this.pageBuilder, {
    this.binding,
    this.bindings = const [],
    this.transition,
    this.transitionDuration,
    this.overrideTransition,
    this.middlewares,
  });

  /// 新路由在这里新增
  static get routes => [
        home,
        ...[
          public_text_ocr,
          flutter_flow_home,
          app_theme_home,
        ],
        ...[
          github_setting,
          github_issues_home,
          github_issues_detail,
          github_issues_edit,
          github_comment_edit,
        ],
        ...[
          app_hot_search_settings_home,
          app_hot_search_settings_app_groups,
          app_hot_search_settings_group_apps,
          app_reading_threshold_config,
        ],
      ];

  /// 创建所有路由页面
  static void createRoutePage() {
    var routes = RTs.routes;
    var defaultRouteList = routes.where((element) => element.group == RouteGroupNames.experimental).toList();
    List<RTs> customRouteList = routes.where((element) => element.group != RouteGroupNames.experimental).toList();

    for (var route in defaultRouteList) {
      my_router.Router.addRoute(
        route.routeName,
        route.pageBuilder,
        binding: route.binding,
        bindings: route.bindings ?? [],
        transition: route.transition,
        transitionDuration: route.transitionDuration,
        overrideTransition: route.overrideTransition,
        middlewares: route.middlewares,
      );
    }

    var mapped = customRouteList.toMap(
      (element) => element.group,
      (element) => element,
    );

    for (var entry in mapped.entries) {
      var group = my_router.Router.createGroup(entry.key.name);
      for (var route in entry.value) {
        group.add(
          route.routeName,
          route.pageBuilder,
          binding: route.binding,
          bindings: route.bindings,
          transition: route.transition,
          transitionDuration: route.transitionDuration,
          overrideTransition: route.overrideTransition,
          middlewares: route.middlewares,
        );
      }
    }
  }

  /// 首页
  static RTs get home => RTs._(
        '/home',
        RouteGroupNames.feature,
        () => HomepagePage(),
        bindings: [HomepageBinding()],
      );

  /////////////////////
  /////////////////////
  /////////////////////
  //////拦截线////////
  /////////////////////
  /////////////////////
  /////////////////////

  /// 公共OCR
  static RTs get public_text_ocr => RTs._(
        '/public/text_orc/home',
        RouteGroupNames.feature,
        () => const TextOcrPage(),
      );

  /// FlutterFlow模块
  static RTs get flutter_flow_home => RTs._(
        '/flutterflow/home',
        RouteGroupNames.feature,
        () => const FlutterFlowPage(),
      );

  /// APP主题模块
  static RTs get app_theme_home => RTs._(
        '/app_theme/home',
        RouteGroupNames.feature,
        () => AppThemePage(),
      );

  /// Github设置模块
  static RTs get github_setting => RTs._(
        '/github/setting',
        RouteGroupNames.feature,
        () => GithubSettingPage(),
        binding: GithubSettingBinding(),
      );

  /// Github issues模块首页
  static RTs get github_issues_home => RTs._(
        '/github/issues/home',
        RouteGroupNames.feature,
        () => Github1bitIssuesPage(),
        binding: Github1bitIssuesBinding(),
      );

  /// Github issues模块详情页
  static RTs get github_issues_detail => RTs._(
        '/github/issues/detail',
        RouteGroupNames.feature,
        () => const Github1bitIssuesDetailPage(),
        binding: Github1bitIssuesDetailBinding(),
      );

  /// Github issues模块编辑页
  static RTs get github_issues_edit => RTs._(
        '/github/issues/edit',
        RouteGroupNames.feature,
        () => const Github1bitIssuesEditPage(),
      );

  /// Github issues模块评论编辑页
  static RTs get github_comment_edit => RTs._(
        '/github/comment/edit',
        RouteGroupNames.feature,
        () => const Github1bitCommentEditPage(),
        binding: Github1bitCommentEditPageBinding(),
      );

  /// APP热搜设置模块首页
  static RTs get app_hot_search_settings_home => RTs._(
        '/app_hot_search/settings/home',
        RouteGroupNames.functionality,
        () => AppHotSearchSettingPage(),
      );

  /// APP热搜设置模块APP分组编辑页
  static RTs get app_hot_search_settings_app_groups => RTs._(
        '/app_hot_search/settings/app_groups',
        RouteGroupNames.functionality,
        () => AppHotSearchAppGroupsEditPage(),
      );

  /// APP热搜设置模块APP分组的APP编辑页
  static RTs get app_hot_search_settings_group_apps => RTs._(
        '/app_hot_search/settings/group_apps',
        RouteGroupNames.functionality,
        () => AppHotSearchGroupAppsEditPage(),
        binding: AppHotSearchGroupAppsBinding(),
      );

  /// APP热搜文章阅读阈值配置页
  static RTs get app_reading_threshold_config => RTs._(
        '/app_hot_search/settings/reading_record_threshold',
        RouteGroupNames.functionality,
        () => AppReadingThresholdConfigPage(),
      );

  /// 封装路由的跳转方法，增强APP路由字符串
  Future<R?>? to<R>({
    dynamic argument,
    Map<String, String>? pathVariables,
    bool preventDuplicates = true,
  }) {
    return INKs.route
        .to<R>(
          this.routeName,
          argument: argument,
          pathVariables: pathVariables,
          prevent_duplicates: preventDuplicates,
        )
        .force_as();
  }
}
