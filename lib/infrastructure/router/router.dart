import 'package:cw2bit/domain/home/homepage/binding.dart';
import 'package:cw2bit/domain/home/homepage/view.dart';
import 'package:cw2bit/domain/tool/flutter_flow/view.dart';
import 'package:cw2bit/domain/tool/github_1bit_issues/binding.dart';
import 'package:cw2bit/domain/tool/github_1bit_issues/view.dart';
import 'package:qkit/qkit.dart';

class AppRoutes {
  static const kHome = '/home';

  static const kToolFlutterFlow = '/tool/flutterflow/home';
  static const kToolGithubIssuesHome = '/tool/github/issues/home';
  static const kToolGithubIssuesDetail = '/tool/github/issues/detail';
}

class AppPageRouter {
  static void initRoutePage() {
    RouteProxyDispatcher.addRoute(
      AppRoutes.kHome,
      () => HomepagePage(),
      bindings: [HomepageBinding()],
    );

    RouteProxyDispatcher.createGroup('tool')
        .addRoute(
          AppRoutes.kToolFlutterFlow,
          () => const FlutterFlowPage(),
        )
        .addRoute(
          AppRoutes.kToolGithubIssuesHome,
          () => Github1bitIssuesPage(),
          binding: Github1bitIssuesBinding(),
        );
  }
}
