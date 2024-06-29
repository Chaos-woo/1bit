import 'package:get/get.dart';
import 'package:qkit/router/models/route_proxy.dart';

/// 命名路由组
class RouteProxyGroup {
  final String name;
  final List<RouteProxy> routes = [];

  RouteProxyGroup(this.name);

  /// 项路由组中添加路由
  RouteProxyGroup addRoute(
    String routeName,
    GetPageBuilder pageBuilder, {
    Bindings? binding,
    List<Bindings> bindings = const [],
    Transition? transition,
    Duration? transitionDuration,
    CustomTransition? customTransition,
    List<GetMiddleware>? middlewares,
  }) {
    RouteProxy route = RouteProxy(
      routeName,
      pageBuilder,
      binding: binding,
      bindings: bindings,
      transition: transition,
      transitionDuration: transitionDuration,
      customTransition: customTransition,
      middlewares: middlewares,
    );

    routes.add(route);

    return this;
  }

  void clearRoutes() {
    routes.clear();
  }
}
