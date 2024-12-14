import 'package:get/get.dart';
import 'package:qkit/router/models/route_proxy.dart';

/// 命名路由组
class RouteProxyGroup {
  final String name;
  final List<RouteProxy> routes = [];

  RouteProxyGroup(this.name);

  /// 项路由组中添加路由
  RouteProxyGroup add_route(
    String route_name,
    GetPageBuilder page_builder, {
    Bindings? binding,
    List<Bindings> bindings = const [],
    Transition? transition,
    Duration? transition_duration,
    CustomTransition? override_transition,
    List<GetMiddleware>? middlewares,
  }) {
    RouteProxy route = RouteProxy(
      route_name,
      page_builder,
      binding: binding,
      bindings: bindings,
      transition: transition,
      transition_duration: transition_duration,
      override_transition: override_transition,
      middlewares: middlewares,
    );

    routes.add(route);

    return this;
  }

  void clear_routers() {
    routes.clear();
  }
}
