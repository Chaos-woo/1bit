import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

/// 页面路由辅助生成工具
///
/// 使用[createGroup]、[addRoute]添加路由后，框架初始化时自动调用
/// [dispatch]方法初始化页面路由，即可通过[QDispatcher.pageRoutes]
/// 获取GetX全部配置的路由
class QDispatcher {
  static final List<GetPage> pageRoutes = [];

  /// 用户自定义分组路由
  static final List<QRouteGroup> namedRouteGroups = [];

  /// 默认路由分组
  static final QRouteGroup defaultRouteGroup = QRouteGroup('#default');

  static QRouteGroup createGroup(String name) {
    QRouteGroup group = QRouteGroup(name);
    namedRouteGroups.add(group);
    return group;
  }

  static void addGroup(QRouteGroup group) {
    namedRouteGroups.add(group);
  }

  static void addRoute(
    String routeName,
    GetPageBuilder pageBuilder, {
    Bindings? binding,
    List<Bindings> bindings = const [],
    Transition? transition,
    Duration? transitionDuration,
    CustomTransition? customTransition,
    List<GetMiddleware>? middlewares,
  }) {
    defaultRouteGroup.addRoute(
      routeName,
      pageBuilder,
      binding: binding,
      bindings: bindings,
      transition: transition,
      transitionDuration: transitionDuration,
      customTransition: customTransition,
      middlewares: middlewares,
    );
  }

  /// 初始化路由，并生成GetX页面路由
  static void dispatch() {
    Set<String> routeNames = {};
    List<QRoute> routes = [];
    for (var route in defaultRouteGroup.routes) {
      if (routeNames.contains(route.routeName)) {
        continue;
      }

      routes.add(route);
    }

    for (var group in namedRouteGroups) {
      for (var route in group.routes) {
        if (routeNames.contains(route.routeName)) {
          continue;
        }

        routes.add(route);
      }
    }

    var pages = routes.map(_newGetPage).toList();
    pageRoutes.addAll(pages);
  }

  /// 创建GetX页面路由
  static GetPage _newGetPage(QRoute route) {
    return GetPage(
      name: route.routeName,
      page: route.pageBuilder,
      binding: route.binding,
      bindings: route.bindings,
      transition: route.transition,
      transitionDuration: route.transitionDuration,
      customTransition: route.customTransition,
      middlewares: route.middlewares,
    );
  }
}
