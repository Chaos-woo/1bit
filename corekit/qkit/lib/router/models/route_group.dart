import 'package:get/get.dart';
import 'package:qkit/router/models/route.dart';

/// 命名路由组
class QRouteGroup {
  final String name;
  final List<QRoute> routes = [];

  QRouteGroup(this.name);

  /// 项路由组中添加路由
  QRouteGroup addRoute(
    String routeName,
    GetPageBuilder pageBuilder, {
    Bindings? binding,
    List<Bindings> bindings = const [],
    Transition? transition,
    Duration? transitionDuration,
    CustomTransition? customTransition,
    List<GetMiddleware>? middlewares,
  }) {
    QRoute route = QRoute(
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
