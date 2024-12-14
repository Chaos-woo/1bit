import 'package:get/get.dart';
import 'package:qkit/qkit.dart';

/// 页面路由辅助生成工具
///
/// 使用[create_group]、[add_route]添加路由后，框架初始化时自动调用
/// [dispatch]方法初始化页面路由，即可通过[RouteProxyDispatcher.m_getx_pages]
/// 获取GetX全部配置的路由
class RouteProxyDispatcher {
  static final List<GetPage> m_getx_pages = [];

  /// 用户自定义分组路由
  static final List<RouteProxyGroup> m_named_router_group = [];

  /// 默认路由分组
  static final RouteProxyGroup m_default_router_group = RouteProxyGroup('__m_named_default_group__');

  static RouteProxyGroup create_group(String name) {
    RouteProxyGroup group = RouteProxyGroup(name);
    m_named_router_group.add(group);
    return group;
  }

  static void add_group(RouteProxyGroup group) {
    m_named_router_group.add(group);
  }

  static void add_route(
    String route_name,
    GetPageBuilder page_builder, {
    Bindings? binding,
    List<Bindings> bindings = const [],
    Transition? transition,
    Duration? transition_duration,
    CustomTransition? override_transition,
    List<GetMiddleware>? middlewares,
  }) {
    m_default_router_group.add_route(
      route_name,
      page_builder,
      binding: binding,
      bindings: bindings,
      transition: transition,
      transition_duration: transition_duration,
      override_transition: override_transition,
      middlewares: middlewares,
    );
  }

  /// 初始化路由，并生成GetX页面路由
  static void dispatch() {
    Set<String> route_names = {};
    List<RouteProxy> routes = [];
    for (var route in m_default_router_group.routes) {
      if (route_names.contains(route.route_name)) {
        continue;
      }

      routes.add(route);
    }

    for (var group in m_named_router_group) {
      for (var route in group.routes) {
        if (route_names.contains(route.route_name)) {
          continue;
        }

        routes.add(route);
      }
    }

    var pages = routes.map(_create_getx_page).toList();
    m_getx_pages.addAll(pages);
  }

  /// 创建GetX页面路由
  static GetPage _create_getx_page(RouteProxy route) {
    return GetPage(
      name: route.route_name,
      page: route.page_builder,
      binding: route.binding,
      bindings: route.bindings,
      transition: route.transition,
      transitionDuration: route.transition_duration,
      customTransition: route.override_transition,
      middlewares: route.middlewares,
    );
  }
}
