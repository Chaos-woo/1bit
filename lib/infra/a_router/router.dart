import 'package:cw2bit/infra/a_router/named_route_group.dart';
import 'package:cw2bit/infra/a_router/named_route.dart';
import 'package:get/get.dart';

/// 页面路由辅助生成工具
///
/// 使用[createGroup]、[addRoute]添加路由后，框架初始化时自动调用
/// [dispatch]方法初始化页面路由，即可通过[Router._mGetxPages]
/// 获取GetX全部配置的路由
class Router {
  static final List<GetPage> _mGetxPages = [];

  static final Set<NamedRouteGroup> _mNamedRouteGroupList = {};

  /// 默认路由分组
  static final NamedRouteGroup _mNamedRoutGroup = NamedRouteGroup('__m_named_default_group__');

  /// 用户自定义分组路由
  List<GetPage> get getxPages => _mGetxPages;

  static NamedRouteGroup createGroup(String name) {
    var group = NamedRouteGroup(name);
    _mNamedRouteGroupList.add(group);
    return group;
  }

  static void addGroup(NamedRouteGroup group) {
    _mNamedRouteGroupList.add(group);
  }

  static void addRoute(
    String name,
    GetPageBuilder pageBuilder, {
    Bindings? binding,
    List<Bindings> bindings = const [],
    Transition? transition,
    Duration? transitionDuration,
    CustomTransition? overrideTransition,
    List<GetMiddleware>? middlewares,
  }) {
    _mNamedRoutGroup.add(
      name,
      pageBuilder,
      binding: binding,
      bindings: bindings,
      transition: transition,
      transitionDuration: transitionDuration,
      overrideTransition: overrideTransition,
      middlewares: middlewares,
    );
  }

  /// 初始化路由，并生成GetX页面路由
  static void dispatch() {
    Set<String> routeNameSet = {};
    List<NamedRoute> routes = [];
    for (var route in _mNamedRoutGroup.routes) {
      if (routeNameSet.contains(route.name)) {
        continue;
      }

      routes.add(route);
    }

    for (var group in _mNamedRouteGroupList) {
      for (var route in group.routes) {
        if (routeNameSet.contains(route.name)) {
          continue;
        }

        routes.add(route);
      }
    }

    var pages = routes.map(_createGetxPage).toList(); // 修改此处
    _mGetxPages.addAll(pages);
  }

  /// 创建GetX页面路由
  static GetPage _createGetxPage(NamedRoute route) {
    return GetPage(
      name: route.name,
      // 修改此处
      page: route.pageBuilder,
      binding: route.binding,
      bindings: route.bindings,
      transition: route.transition,
      transitionDuration: route.transitionDuration,
      customTransition: route.overrideTransition,
      middlewares: route.middlewares,
    );
  }
}
