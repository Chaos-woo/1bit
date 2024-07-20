import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

/// 页面路由辅助生成工具
///
/// 使用[createGroup]、[addRoute]添加路由后，框架初始化时自动调用
/// [dispatch]方法初始化页面路由，即可通过[RouteProxyDispatcher.s_pageRoutes]
/// 获取GetX全部配置的路由
class RouteProxyDispatcher {
  static final List<GetPage> s_pageRoutes = [];

  /// 用户自定义分组路由
  static final List<RouteProxyGroup> m_namedRouteGroups = [];

  /// 默认路由分组
  static final RouteProxyGroup m_defaultRouteGroup = RouteProxyGroup('#default');

  static RouteProxyGroup createGroup(String name) {
    RouteProxyGroup group = RouteProxyGroup(name);
    m_namedRouteGroups.add(group);
    return group;
  }

  static void addGroup(RouteProxyGroup group) {
    m_namedRouteGroups.add(group);
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
    m_defaultRouteGroup.addRoute(
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
    List<RouteProxy> routes = [];
    for (var route in m_defaultRouteGroup.routes) {
      if (routeNames.contains(route.routeName)) {
        continue;
      }

      routes.add(route);
    }

    for (var group in m_namedRouteGroups) {
      for (var route in group.routes) {
        if (routeNames.contains(route.routeName)) {
          continue;
        }

        routes.add(route);
      }
    }

    var pages = routes.map(_newGetPage).toList();
    s_pageRoutes.addAll(pages);
  }

  /// 创建GetX页面路由
  static GetPage _newGetPage(RouteProxy route) {
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
