import 'package:cw2bit/infra/a_router/named_route.dart';
import 'package:get/get.dart';

/// 命名路由组
class NamedRouteGroup {
  final String name;
  final Set<NamedRoute> routes = {};

  NamedRouteGroup(this.name);

  /// 向路由组中添加路由
  NamedRouteGroup add(
    String name,
    GetPageBuilder pageBuilder, {
    Bindings? binding,
    List<Bindings> bindings = const [],
    Transition? transition,
    Duration? transitionDuration,
    CustomTransition? overrideTransition,
    List<GetMiddleware>? middlewares,
  }) {
    NamedRoute route = NamedRoute(
      name,
      pageBuilder,
      binding: binding,
      bindings: bindings,
      transition: transition,
      transitionDuration: transitionDuration,
      overrideTransition: overrideTransition,
      middlewares: middlewares,
    );

    routes.add(route);

    return this;
  }

  /// 向路由组中添加路由
  NamedRouteGroup addRoute(NamedRoute route) {
    routes.add(route);
    return this;
  }

  void clear() {
    routes.clear();
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is NamedRouteGroup && runtimeType == other.runtimeType && name == other.name;

  @override
  int get hashCode => name.hashCode;
}
