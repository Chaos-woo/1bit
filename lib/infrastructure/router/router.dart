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
import 'package:cw2bit/domain/wallabag/wallabag_homepage/view.dart';
import 'package:cw2bit/public/text_ocr/view.dart';
import 'package:qkit/qkit.dart';

/// 命名路由
const rt_home = '/home';

/// 公共路由
const rt_publicTextOcr = '/public/textorc/home';

/// 1bit模块路由
const rt_toolFlutterFlowHome = '/tool/flutterflow/home';
const rt_tool_github_setting = '/tool/github/setting';
const rt_toolGithubIssuesHome = '/tool/github/issues/home';
const rt_toolGithubIssuesDetail = '/tool/github/issues/detail';
const rt_toolGithubIssuesEdit = '/tool/github/issues/edit';
const rt_toolGithubCommentEdit = '/tool/github/comment/edit';

/// 朝闻道模块路由
const rt_newsWallabagHome = '/news/wallabag/home';

class AppPageRouter {
  static void initRoutePage() {
    RouteProxyDispatcher.addRoute(
      rt_home,
      () => HomepagePage(),
      bindings: [HomepageBinding()],
    );

    RouteProxyDispatcher.createGroup('1bit')
        .addRoute(rt_toolFlutterFlowHome, () => const FlutterFlowPage())
        .addRoute(
          rt_toolGithubIssuesHome,
          () => Github1bitIssuesPage(),
          binding: Github1bitIssuesBinding(),
        )
        .addRoute(
          rt_tool_github_setting,
          () => GithubSettingPage(),
          binding: GithubSettingBinding(),
        )
        .addRoute(
          rt_toolGithubIssuesDetail,
          () => const Github1bitIssuesDetailPage(),
          binding: Github1bitIssuesDetailBinding(),
        )
        .addRoute(rt_toolGithubIssuesEdit, () => const Github1bitIssuesEditPage())
        .addRoute(
          rt_toolGithubCommentEdit,
          () => const Github1bitCommentEditPage(),
          binding: Github1bitCommentEditPageBinding(),
        );

    RouteProxyDispatcher.createGroup('news')
        .addRoute(rt_newsWallabagHome, () => const WallabagHomepagePage());

    RouteProxyDispatcher.createGroup('public').addRoute(
      rt_publicTextOcr,
      () => const TextOcrPage(),
    );
  }
}
