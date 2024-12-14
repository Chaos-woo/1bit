import 'package:cw2bit/domain/app_hot_search/settings/app_groups_edit/view.dart';
import 'package:cw2bit/domain/app_hot_search/settings/group_apps_edit/binding.dart';
import 'package:cw2bit/domain/app_hot_search/settings/group_apps_edit/view.dart';
import 'package:cw2bit/domain/app_hot_search/settings/index/view.dart';
import 'package:cw2bit/domain/feature_explore/app_theme/view.dart';
import 'package:cw2bit/domain/feature_explore/flutter_flow/view.dart';
import 'package:cw2bit/domain/feature_explore/github_1bit/comment_edit/binding.dart';
import 'package:cw2bit/domain/feature_explore/github_1bit/comment_edit/view.dart';
import 'package:cw2bit/domain/feature_explore/github_1bit/issues/binding.dart';
import 'package:cw2bit/domain/feature_explore/github_1bit/issues/components/github_setting/binding.dart';
import 'package:cw2bit/domain/feature_explore/github_1bit/issues/components/github_setting/view.dart';
import 'package:cw2bit/domain/feature_explore/github_1bit/issues/view.dart';
import 'package:cw2bit/domain/feature_explore/github_1bit/issues_detail/binding.dart';
import 'package:cw2bit/domain/feature_explore/github_1bit/issues_detail/view.dart';
import 'package:cw2bit/domain/feature_explore/github_1bit/issues_edit/view.dart';
import 'package:cw2bit/domain/my_homepage/homepage/binding.dart';
import 'package:cw2bit/domain/my_homepage/homepage/view.dart';
import 'package:cw2bit/infrastructure/ext/my_extension.dart';
import 'package:cw2bit/public/text_ocr/view.dart';
import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

enum RouteGroupNames {
  default_group('default_group'),
  feature_explore('feature_explore'),
  text('text'),
  ;

  final String name;

  const RouteGroupNames(this.name);
}

/// RT0路由管理器
final class rout0_ {
  final String route_name;
  final RouteGroupNames group;
  final GetPageBuilder page_builder;
  Bindings? binding;
  List<Bindings> bindings;
  Transition? transition;
  Duration? transition_duration;
  CustomTransition? override_transition;
  List<GetMiddleware>? middlewares;

  rout0_._(
    this.route_name,
    this.group,
    this.page_builder, {
    this.binding,
    this.bindings = const [],
    this.transition,
    this.transition_duration,
    this.override_transition,
    this.middlewares,
  });

  static get routes => [
        home,
        public_text_ocr,
        flutter_flow_home,
        app_theme_home,
        github_setting,
        github_issues_home,
        github_issues_detail,
        github_issues_edit,
        github_comment_edit,
        app_hot_search_settings_home,
        app_hot_search_settings_app_groups,
        app_hot_search_settings_group_apps,
      ];

  /// 创建所有路由页面
  static void create_route_page() {
    var routes = rout0_.routes;
    var default_route_list = routes.where((element) => element.group == RouteGroupNames.default_group).toList();
    List<rout0_> other_route_list = routes.where((element) => element.group != RouteGroupNames.default_group).toList();

    for (var route in default_route_list) {
      RouteProxyDispatcher.add_route(
        route.route_name,
        route.page_builder,
        binding: route.binding,
        bindings: route.bindings ?? [],
        transition: route.transition,
        transition_duration: route.transition_duration,
        override_transition: route.override_transition,
        middlewares: route.middlewares,
      );
    }

    var mapped_route_list = other_route_list.to_map(
      (element) => element.group,
      (element) => element,
    );

    for (var entry in mapped_route_list.entries) {
      var route_group = RouteProxyDispatcher.create_group(entry.key.name);
      for (var route in entry.value) {
        route_group.add_route(
          route.route_name,
          route.page_builder,
          binding: route.binding,
          bindings: route.bindings,
          transition: route.transition,
          transition_duration: route.transition_duration,
          override_transition: route.override_transition,
          middlewares: route.middlewares,
        );
      }
    }
  }

  /// 首页
  static rout0_ get home => rout0_._(
        '/home',
        RouteGroupNames.default_group,
        () => HomepagePage(),
        bindings: [HomepageBinding()],
      );

  /// 公共OCR
  static rout0_ get public_text_ocr => rout0_._(
        '/public/text_orc/home',
        RouteGroupNames.feature_explore,
        () => const TextOcrPage(),
      );

  /// FlutterFlow模块
  static rout0_ get flutter_flow_home => rout0_._(
        '/flutterflow/home',
        RouteGroupNames.feature_explore,
        () => const FlutterFlowPage(),
      );

  /// APP主题模块
  static rout0_ get app_theme_home => rout0_._(
        '/app_theme/home',
        RouteGroupNames.feature_explore,
        () => AppThemePage(),
      );

  /// Github设置模块
  static rout0_ get github_setting => rout0_._(
        '/github/setting',
        RouteGroupNames.feature_explore,
        () => GithubSettingPage(),
        binding: GithubSettingBinding(),
      );

  /// Github issues模块首页
  static rout0_ get github_issues_home => rout0_._(
        '/github/issues/home',
        RouteGroupNames.feature_explore,
        () => Github1bitIssuesPage(),
        binding: Github1bitIssuesBinding(),
      );

  /// Github issues模块详情页
  static rout0_ get github_issues_detail => rout0_._(
        '/github/issues/detail',
        RouteGroupNames.feature_explore,
        () => const Github1bitIssuesDetailPage(),
        binding: Github1bitIssuesDetailBinding(),
      );

  /// Github issues模块编辑页
  static rout0_ get github_issues_edit => rout0_._(
        '/github/issues/edit',
        RouteGroupNames.feature_explore,
        () => const Github1bitIssuesEditPage(),
      );

  /// Github issues模块评论编辑页
  static rout0_ get github_comment_edit => rout0_._(
        '/github/comment/edit',
        RouteGroupNames.feature_explore,
        () => const Github1bitCommentEditPage(),
        binding: Github1bitCommentEditPageBinding(),
      );

  /// APP热搜设置模块首页
  static rout0_ get app_hot_search_settings_home => rout0_._(
        '/app_hot_search/settings/home',
        RouteGroupNames.text,
        () => AppHotSearchSettingPage(),
      );

  /// APP热搜设置模块APP分组编辑页
  static rout0_ get app_hot_search_settings_app_groups => rout0_._(
        '/app_hot_search/settings/app_groups',
        RouteGroupNames.text,
        () => AppHotSearchAppGroupsEditPage(),
      );

  /// APP热搜设置模块APP分组的APP编辑页
  static rout0_ get app_hot_search_settings_group_apps => rout0_._(
        '/app_hot_search/settings/group_apps',
        RouteGroupNames.text,
        () => AppHotSearchGroupAppsEditPage(),
        binding: AppHotSearchGroupAppsBinding(),
      );

  /// 封装路由的跳转方法，增强APP路由字符串
  Future<R?>? to_then_back<R>({
    dynamic argument,
    Map<String, String>? path_variables,
    bool prevent_duplicates = true,
  }) {
    return q0_.route
        .to<R>(
          this.route_name,
          argument: argument,
          path_variables: path_variables,
          prevent_duplicates: prevent_duplicates,
        )
        .force_as();
  }
}
