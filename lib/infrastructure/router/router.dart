import 'package:cw2bit/domain/app_hot_search/settings/app_groups_edit/view.dart';
import 'package:cw2bit/domain/app_hot_search/settings/group_apps_edit/binding.dart';
import 'package:cw2bit/domain/app_hot_search/settings/group_apps_edit/view.dart';
import 'package:cw2bit/domain/app_hot_search/settings/index/view.dart';
import 'package:cw2bit/domain/home/homepage/binding.dart';
import 'package:cw2bit/domain/home/homepage/view.dart';
import 'package:cw2bit/domain/tool/flutter_flow/view.dart';
import 'package:cw2bit/domain/tool/github_1bit/comment_edit/binding.dart';
import 'package:cw2bit/domain/tool/github_1bit/comment_edit/view.dart';
import 'package:cw2bit/domain/tool/github_1bit/issues/binding.dart';
import 'package:cw2bit/domain/tool/github_1bit/issues/components/github_setting/binding.dart';
import 'package:cw2bit/domain/tool/github_1bit/issues/components/github_setting/view.dart';
import 'package:cw2bit/domain/tool/github_1bit/issues/view.dart';
import 'package:cw2bit/domain/tool/github_1bit/issues_detail/binding.dart';
import 'package:cw2bit/domain/tool/github_1bit/issues_detail/view.dart';
import 'package:cw2bit/domain/tool/github_1bit/issues_edit/view.dart';
import 'package:cw2bit/public/text_ocr/view.dart';
import 'package:qkit/qkit.dart';

/// 命名路由
const rt_home = '/home';

/// 公共路由
const rt_publicTextOcr = '/public/textorc/home';

/// R1bit模块路由
const rt_tool_flutter_flow_home = '/tool/flutterflow/home';
const rt_tool_github_setting = '/tool/github/setting';
const rt_tool_github_issues_home = '/tool/github/issues/home';
const rt_tool_github_issues_detail = '/tool/github/issues/detail';
const rt_tool_github_issues_edit = '/tool/github/issues/edit';
const rt_tool_github_comment_edit = '/tool/github/comment/edit';

/// 文字小站模块路由
const rt_news_apphotsearch_settings_home = '/news/apphotsearch/settings';
const rt_news_apphotsearch_settings_appgroups = '/news/apphotsearch/settings/appgroups';
const rt_news_apphotsearch_settings_groupapps = '/news/apphotsearch/settings/groupapps';

class AppPageRouter {
  static void createRouterPage() {
    RouteProxyDispatcher.addRoute(
      rt_home,
      () => HomepagePage(),
      bindings: [HomepageBinding()],
    );

    RouteProxyDispatcher.createGroup('base')
        .addRoute(
          rt_tool_flutter_flow_home,
          () => const FlutterFlowPage(),
        )
        .addRoute(
          rt_tool_github_issues_home,
          () => Github1bitIssuesPage(),
          binding: Github1bitIssuesBinding(),
        )
        .addRoute(
          rt_tool_github_setting,
          () => GithubSettingPage(),
          binding: GithubSettingBinding(),
        )
        .addRoute(
          rt_tool_github_issues_detail,
          () => const Github1bitIssuesDetailPage(),
          binding: Github1bitIssuesDetailBinding(),
        )
        .addRoute(
          rt_tool_github_issues_edit,
          () => const Github1bitIssuesEditPage(),
        )
        .addRoute(
          rt_tool_github_comment_edit,
          () => const Github1bitCommentEditPage(),
          binding: Github1bitCommentEditPageBinding(),
        );

    RouteProxyDispatcher.createGroup('news')
        .addRoute(
          rt_news_apphotsearch_settings_home,
          () => AppHotSearchSettingPage(),
        )
        .addRoute(
          rt_news_apphotsearch_settings_appgroups,
          () => AppHotSearchAppGroupsEditPage(),
        )
        .addRoute(
          rt_news_apphotsearch_settings_groupapps,
          () => AppHotSearchGroupAppsEditPage(),
          binding: AppHotSearchGroupAppsBinding(),
        );

    RouteProxyDispatcher.createGroup('public').addRoute(
      rt_publicTextOcr,
      () => const TextOcrPage(),
    );
  }
}
