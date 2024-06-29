import 'package:get/get.dart';

/// 路由对象
class RouteProxy {
  String routeName;
  GetPageBuilder pageBuilder;
  Bindings? binding;
  List<Bindings> bindings;
  Transition? transition;
  Duration? transitionDuration;
  CustomTransition? customTransition;
  List<GetMiddleware>? middlewares;

  RouteProxy(
    this.routeName,
    this.pageBuilder, {
    this.binding,
    this.bindings = const [],
    this.transition,
    this.transitionDuration,
    this.customTransition,
    this.middlewares,
  });
}
